class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :status
      t.references :customer, index: true
      t.references :service_type, index: true
      t.references :service, index: true
      t.references :resource, index: true
      t.decimal :charge, :precision => 12, :scale => 2

      t.timestamps
    end
  end
end
