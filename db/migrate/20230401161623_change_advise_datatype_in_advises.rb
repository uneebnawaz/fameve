class ChangeAdviseDatatypeInAdvises < ActiveRecord::Migration[6.1]
  def change
    change_column :advises, :advise, :text, using: 'advise::text'
  end
end
