class CreateServiceTypes < ActiveRecord::Migration
  def change
    create_table :service_types do |t|
      t.string :name
      t.integer :s_type

      t.timestamps
    end
  end
end
