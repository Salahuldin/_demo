class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.datetime :deadline
      t.string :screenshot
      t.string :description
      t.integer :type
      t.integer :status

      t.timestamps
    end
  end
end
