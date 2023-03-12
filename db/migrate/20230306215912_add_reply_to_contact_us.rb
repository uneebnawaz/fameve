class AddReplyToContactUs < ActiveRecord::Migration[6.1]
  def change
    add_column :contact_us, :reply, :text
  end
end
