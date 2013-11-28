class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs, :id => false do |t|
      t.integer    :id, :options => "PRIMARY KEY"
      t.references :message

      t.timestamps
    end
    add_index :bugs, :message_id
    remove_column :messages, :bug
  end
end
