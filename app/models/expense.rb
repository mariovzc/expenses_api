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

class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :expense_type
  belongs_to :user
end
