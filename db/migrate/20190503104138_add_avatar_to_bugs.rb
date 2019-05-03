class AddAvatarToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :avatar, :string
  end
end
