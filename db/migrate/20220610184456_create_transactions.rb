class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :type_transaction, foreign_key: true
      t.datetime :date
      t.float :value
      t.string :cpf
      t.string :card
      t.time :hour
      t.string :store_manager
      t.string :store_name

      t.timestamps
    end
  end
end
