require_relative './lib/utilities/importer'
require_relative './lib/utilities/associate_company_users'

require_relative './lib/models/company'
require_relative './lib/models/user'

# Constants used to determine input and output files
COMPANIES_FILE_NAME = './data/companies.json'.freeze
USERS_FILE_NAME = './data/users.json'.freeze
OUTPUT_REPORT_FILE_NAME = './output.txt'.freeze

# Import the files under data for companies and users
# The importer will also associate the files to the Company or User model
importer = Importer.new
companies = importer.import(COMPANIES_FILE_NAME, Company)
users = importer.import(USERS_FILE_NAME, User)

# Joins the Companies and Users together for easier processing
companies_with_users = associate_company_users(companies, users)

# Filter out companies that don't have an active email status
active_companies = companies_with_users.filter { |company| company.email_status == true }

# Generate the full summary that will be written to `output.txt`
full_summary = "\n"
active_companies.each do |company|
  full_summary += "#{company.generate_token_summary}\n\n"
end
File.write(OUTPUT_REPORT_FILE_NAME, full_summary)

puts 'Successfully generated token summary!'
puts "Token summary can be found at: #{OUTPUT_REPORT_FILE_NAME}"
