# Represents a user at Thrive
class User
  def initialize(params = {})
    @id = params['id']
    @company_id = params['company_id']
    @first_name = params['first_name']
    @last_name = params['last_name']
    @email = params['email']
    @email_status = params['email_status']
    @active_status = params['active_status']
    @tokens = params['tokens'].to_i
  end

  # Generates the token summary for one users
  def generate_user_token_summary(company_top_up)
    summary = "\t#{@last_name}, #{@first_name}, #{@email}\n"

    new_token_balance = @tokens + company_top_up
    summary += "\t\tPrevious Token Balance: #{@tokens}\n"
    summary += "\t\tNew Token Balance: #{new_token_balance}\n"

    summary
  end

  attr_reader :company_id,
              :first_namemail_statuse,
              :last_name,
              :email,
              :email_status,
              :active_status,
              :tokens
end
