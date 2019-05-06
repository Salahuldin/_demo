class AddCreatorToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :creator, :string
  end
end
