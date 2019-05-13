class ChangeDeadlineTypeToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :bugs, :deadline, :date
  end
end
