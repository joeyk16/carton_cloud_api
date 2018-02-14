class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.date :pick_up_date
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
