class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references :property_type, foreign_key: true
      t.string :uri_id
      t.decimal :base_price, precision: 10, scale: 2
    end
  end
end
