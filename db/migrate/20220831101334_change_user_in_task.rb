class ChangeUserInTask < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :user, index: true
    add_reference :tasks, :user, index: true, null: true
  end
end
