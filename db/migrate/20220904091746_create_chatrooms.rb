class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.references :client, foreign_key: { to_table: :users }
      t.references :professional, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
