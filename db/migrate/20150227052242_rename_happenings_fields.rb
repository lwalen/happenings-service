class RenameHappeningsFields < ActiveRecord::Migration
  def change
    rename_column :happenings, :start_on, :start_date
    rename_column :happenings, :end_on, :end_date
    rename_column :happenings, :person, :subject
  end
end
