class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.references :bug
      t.references :peer

      t.timestamps
    end
  end
end
