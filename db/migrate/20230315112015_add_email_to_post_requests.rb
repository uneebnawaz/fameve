class AddEmailToPostRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :post_requests, :email, :string
  end
end
