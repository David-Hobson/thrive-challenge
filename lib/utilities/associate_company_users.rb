# Associates companies with their users and sorts the data
def associate_company_users(companies, users)
  companies.each do |company|
    company_users = users.filter { |user| company.id == user.company_id }
    company.associate_users(company_users)
  end

  companies.sort_by(&:id)
end
