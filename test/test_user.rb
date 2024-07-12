require 'models/user'

RSpec.describe User do
  it 'generates a token report for a user' do
    user = User.new(
      'id' => 1,
      'company_id' => 1,
      'first_name' => 'David',
      'last_name' => 'Hobson',
      'email' => 'david@thrivemycareer.com',
      'email_status' => true,
      'active_status' => true,
      'tokens' => 22
    )

    user_summary = user.generate_user_token_summary(33)

    expect(user_summary).to eq(
      "\tHobson, David, david@thrivemycareer.com\n"\
      "\t\tPrevious Token Balance: 22\n"\
      "\t\tNew Token Balance: 55\n"\
    )
  end
end
