class CreateCurrency < ActiveRecord::Migration[5.2]
  def up
    create_table :currencies do |t|
      t.decimal :value, precision: 7, scale: 4, null: false
      t.datetime :expiration_date
      t.boolean :active, default: false, null: false

      t.timestamps
    end
  end

  def down
    drop_table :currencies
  end
end
