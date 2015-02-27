class RenameVisitsToHappenings < ActiveRecord::Migration
  def change
    rename_table :visits, :happenings
  end
end
