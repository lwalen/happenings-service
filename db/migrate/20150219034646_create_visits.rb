class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :person
      t.date :start_on
      t.date :end_on

      t.timestamps
    end
  end
end
