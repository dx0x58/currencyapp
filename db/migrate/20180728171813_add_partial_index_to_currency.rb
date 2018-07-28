class AddPartialIndexToCurrency < ActiveRecord::Migration[5.2]
  INDEX_NAME = 'create_index_statement'.freeze

  def up
    create_index_statement = <<~SQL
      CREATE UNIQUE INDEX #{INDEX_NAME} ON currencies (active) WHERE active
    SQL

    execute create_index_statement
  end

  def down
    remove_index :currencies, name: INDEX_NAME
  end
end
