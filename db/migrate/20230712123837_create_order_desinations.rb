class CreateOrderDesinations < ActiveRecord::Migration[6.0]
  def change
    create_table :order_desinations do |t|

      t.timestamps
    end
  end
end
