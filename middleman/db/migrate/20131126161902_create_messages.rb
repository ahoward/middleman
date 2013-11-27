class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.text :text
      t.string :bug

      t.timestamps
    end
  end
end
