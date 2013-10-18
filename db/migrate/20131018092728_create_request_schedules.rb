class CreateRequestSchedules < ActiveRecord::Migration
  def change
    create_table :request_schedules do |t|
      t.references :request, index: true
      t.datetime :start_time
      t.datetime :end_date
      t.string :phone_number
      t.string :address
      t.integer :s_type

      t.timestamps
    end
  end
end
