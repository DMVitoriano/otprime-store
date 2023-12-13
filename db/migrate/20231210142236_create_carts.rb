class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :address, type: :uuid, foreign_key: true
      t.timestamps
    end
  end
end
