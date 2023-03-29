class ChangePriceDatatypeInServices < ActiveRecord::Migration[6.1]
  def change
    change_column :services, :price, :integer, using: 'price::integer'
  end
end
