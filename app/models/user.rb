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

class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email

  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/
  validates_presence_of :password_digest
  validates_presence_of :first_name
  validates_presence_of :last_name

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

end
