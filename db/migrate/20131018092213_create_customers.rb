class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :c_type
      t.references :user, index: true

      t.timestamps
    end
  end
end
