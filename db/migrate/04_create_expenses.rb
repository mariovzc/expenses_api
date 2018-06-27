class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :concept
      t.date :date
      t.string :amount
      t.references :category, foreign_key: true
      t.references :expense_type, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
