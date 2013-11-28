class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.references :message

      t.timestamps
    end
    add_index :bugs, :message_id
    remove_column :messages, :bug
  end
end
