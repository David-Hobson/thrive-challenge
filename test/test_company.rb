require 'models/user'
require 'models/company'

RSpec.describe Company do
  it "generates a token report for a company and it's users" do
    user1 = User.new(
      'id' => 1,
      'company_id' => 1,
      'first_name' => 'David',
      'last_name' => 'Hobson',
      'email' => 'david@thrivemycareer.com',
      'email_status' => true,
      'active_status' => true,
      'tokens' => 22
    )
    user2 = User.new(
      'id' => 2,
      'company_id' => 1,
      'first_name' => 'Bianca',
      'last_name' => 'Caggianello',
      'email' => 'bianca@thrivemycareer.com',
      'email_status' => true,
      'active_status' => true,
      'tokens' => 88
    )
    user3 = User.new(
      'id' => 3,
      'company_id' => 1,
      'first_name' => 'Chappell',
      'last_name' => 'Roan',
      'email' => 'chappell@thrivemycareer.com',
      'email_status' => false,
      'active_status' => true,
      'tokens' => 420
    )
    company = Company.new(
      'id' => 1,
      'name' => 'Thrive',
      'top_up' => 22,
      'email_status' => true
    )
    company.associate_users([user1, user2, user3])

    company_token_summary = company.generate_token_summary

    expect(company_token_summary).to eq(
      "Company Id: 1\n"\
      "Company Name: Thrive\n"\
      "Users Emailed:\n"\
      "\tCaggianello, Bianca, bianca@thrivemycareer.com\n"\
      "\t\tPrevious Token Balance: 88\n"\
      "\t\tNew Token Balance: 110\n"\
      "\tHobson, David, david@thrivemycareer.com\n"\
      "\t\tPrevious Token Balance: 22\n"\
      "\t\tNew Token Balance: 44\n"\
      "Users Not Emailed:\n"\
      "\tRoan, Chappell, chappell@thrivemycareer.com\n"\
      "\t\tPrevious Token Balance: 420\n"\
      "\t\tNew Token Balance: 442\n"\
      "\tTotal amount of top ups for Thrive: 66"
    )
  end
end
