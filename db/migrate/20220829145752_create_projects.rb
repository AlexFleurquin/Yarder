class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :address
      t.string :building_type
      t.integer :construction_year
      t.string :urgency
      t.integer :budget
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
