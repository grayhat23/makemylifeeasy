class CreateResourceRatings < ActiveRecord::Migration
  def change
    create_table :resource_ratings do |t|
      t.references :resource, index: true
      t.integer :rating
      t.references :request, index: true
      t.references :customer, index: true
      t.string :comments

      t.timestamps
    end
  end
end
