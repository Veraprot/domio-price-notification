class CreatePropertyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :property_records do |t|
      t.references :property, foreign_key: true
      t.decimal :dynamic_display_price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
