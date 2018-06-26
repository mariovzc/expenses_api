# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string           not null
#  password_digest      :string           not null
#  first_name           :string           not null
#  last_name            :string           not null
#  confirmation_token   :string
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    subject { User.new(first_name: "Mario", last_name: "soto", email: "a@a.com", passsword: "123456789", password_confirmation: "123456789") }
    it { is_expected.to validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
