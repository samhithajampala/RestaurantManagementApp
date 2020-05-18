class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :oid
      t.string :iid
      t.string :status
      t.string :chef
      t.string :quantity
      t.timestamps
    end
  end
end
