class ChangeDateToTask < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :start_date, :datetime
    change_column :tasks, :end_date, :datetime
    add_column :tasks, :name, :string
  end
end
