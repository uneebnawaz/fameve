class AddPortfolioToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :portfolio, :string
  end
end
