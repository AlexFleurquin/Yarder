class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :type
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
