require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) { User.create(email: 'lettuce@lettuce.com', username: 'lettuce pray', password: 'lettuce') }

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value('bob@bob.com').for(:email) }
    it { is_expected.not_to allow_value('this_is_a_real_email_i_promise').for(:email) }
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
    it do
      is_expected.to validate_length_of(:username)
        .is_at_least(2).is_at_most(20)
    end
  end
end
