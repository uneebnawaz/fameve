class AddCityToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :city, :string
  end
end
