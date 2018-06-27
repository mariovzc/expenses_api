# == Schema Information
#
# Table name: expense_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ExpenseType, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }   
  end

  describe "Asossiations" do
    it { should have_many(:expenses) }
  end
end
