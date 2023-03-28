class RemoveAttributesFromServices < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :like, :boolean, default: false
    remove_column :services, :ratings, :float
    remove_column :services, :reviews, :int
  end
end
