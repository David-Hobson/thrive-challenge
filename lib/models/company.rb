# Represents a company at Thrive
class Company
  def initialize(params = {})
    @id = params['id']
    @name = params['name']
    @top_up = params['top_up'].to_i
    @email_status = params['email_status']
  end

  def associate_users(users)
    @users = users.sort_by(&:last_name)
  end

  # Generates the token summary for one company
  def generate_token_summary
    summary = "Company Id: #{@id}\n"\
    "Company Name: #{@name}\n"

    total_top_ups = 0
    active_users = @users.filter { |user| user.active_status == true }

    email_users = active_users.filter { |user| user.email_status == true }
    summary += "Users Emailed:\n"
    email_users.each do |user|
      summary += user.generate_user_token_summary(@top_up)
      total_top_ups += @top_up
    end

    non_email_users = active_users.filter { |user| user.email_status == false }
    summary += "Users Not Emailed:\n"
    non_email_users.each do |user|
      summary += user.generate_user_token_summary(@top_up)
      total_top_ups += @top_up
    end

    summary += "\tTotal amount of top ups for #{@name}: #{total_top_ups}"
  end

  attr_reader :id,
              :name,
              :top_up,
              :email_status
end
