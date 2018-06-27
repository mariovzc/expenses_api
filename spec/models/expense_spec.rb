# == Schema Information
#
# Table name: expenses
#
#  id              :integer          not null, primary key
#  concept         :string
#  date            :date
#  amount          :string
#  category_id     :integer
#  expense_type_id :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe "Associations" do
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should belong_to(:expense_type) }
  end
end
