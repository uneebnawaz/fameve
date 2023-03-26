class AddBudgetToPostRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :post_requests, :budget, :integer
  end
end
