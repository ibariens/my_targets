class CreateActuals < ActiveRecord::Migration
  def change
    create_table :actuals do |t|
      t.belongs_to :targets
      t.float      :amount, null: false
      t.timestamps          null: false
    end
  end
end