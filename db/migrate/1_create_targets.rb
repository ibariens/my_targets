class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string      :name,             null: false
      t.string      :measurement_unit, null: false
      t.timestamps                     null: false
    end


    Target.create(:name => "Alchohol", :measurement_unit => "times")
    Target.create(:name => "Savings",  :measurement_unit => "EUR")
    Target.create(:name => "Sport",    :measurement_unit => "times")
    Target.create(:name => "Language", :measurement_unit => "times")
    Target.create(:name => "Weight",   :measurement_unit => "kilo")
  end
end