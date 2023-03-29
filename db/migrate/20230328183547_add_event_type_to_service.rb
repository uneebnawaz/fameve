class AddEventTypeToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :event_type, :string
  end
end
