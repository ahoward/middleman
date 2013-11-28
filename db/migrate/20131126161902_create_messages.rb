class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.references :bugs
      t.references :peers

      t.timestamps
    end
  end
end
