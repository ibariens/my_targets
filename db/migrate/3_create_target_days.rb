class CreateTargetDays < ActiveRecord::Migration
  def change
    create_table :target_days do |t|
      t.belongs_to :target
      t.datetime   :day
      t.float      :amount, null: false, default: 0
      t.timestamps
    end
  end
end