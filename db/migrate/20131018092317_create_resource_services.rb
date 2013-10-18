class CreateResourceServices < ActiveRecord::Migration
  def change
    create_table :resource_services do |t|
      t.references :resource, index: true
      t.references :service_type, index: true
      t.references :service, index: true

      t.timestamps
    end
  end
end
