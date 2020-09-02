RSpec.configure do |config|
  config.include Warden::Test::Helpers

  config.after :each do
    Warden.test_reset!
  end
end

def login_user
  user = User.create(email: 'test@test.com', username: 'test', password: 'test123')
  login_as(user, scope: :user)
end
