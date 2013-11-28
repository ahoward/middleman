class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs, :id => false do |t|
      t.integer    :id, :options => "PRIMARY KEY"
      t.references :Message

      t.timestamps
    end
    add_index :bugs, :Message_id
  end
end
