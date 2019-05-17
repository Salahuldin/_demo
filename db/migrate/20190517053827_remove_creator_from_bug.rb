class RemoveCreatorFromBug < ActiveRecord::Migration[5.2]
  def change
    remove_column :bugs, :creator, :string
  end
end
