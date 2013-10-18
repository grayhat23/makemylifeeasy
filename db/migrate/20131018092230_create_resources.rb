class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :user, index: true
      t.integer :r_type
      t.decimal :average_rating

      t.timestamps
    end
  end
end
