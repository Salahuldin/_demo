class RemoveDevIdFromBugs < ActiveRecord::Migration[5.2]
  def change
    remove_column :bugs, :dev_id, :integer
  end
end
