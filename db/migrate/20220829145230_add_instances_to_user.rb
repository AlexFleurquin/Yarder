class AddInstancesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_pro, :boolean
    add_column :users, :siret, :string
    add_column :users, :speciality, :string
    add_column :users, :bio, :text
    add_column :users, :company, :string
  end
end
