class CreateTypeTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :type_transactions do |t|
      t.integer :type_code
      t.string :description
      t.string :label
      t.boolean :value

      t.timestamps
    end
  end
end
