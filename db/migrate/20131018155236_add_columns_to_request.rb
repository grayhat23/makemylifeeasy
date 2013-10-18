class AddColumnsToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :budget, :decimal, :precision => 12, :scale => 2
    add_column :requests, :query, :string
  end
end
