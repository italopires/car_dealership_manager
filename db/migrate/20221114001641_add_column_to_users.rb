class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :kind, :integer, default: 1
  end
end
