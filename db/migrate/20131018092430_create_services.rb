class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :image_url
      t.decimal :charge, :precision => 12, :scale => 2
      t.references :service_type, index: true

      t.timestamps
    end
  end
end
