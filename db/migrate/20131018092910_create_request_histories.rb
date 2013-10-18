class CreateRequestHistories < ActiveRecord::Migration
  def change
    create_table :request_histories do |t|
      t.references :request, index: true
      t.string :comments
      t.integer :status

      t.timestamps
    end
  end
end
