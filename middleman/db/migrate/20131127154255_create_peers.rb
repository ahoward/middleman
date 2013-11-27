class CreatePeers < ActiveRecord::Migration
  def change
    create_table :peers do |t|
      t.string :email
      t.references :message

      t.timestamps
    end
    add_index :peers, :message_id
  end
end
