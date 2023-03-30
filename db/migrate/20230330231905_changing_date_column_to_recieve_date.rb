class ChangingDateColumnToRecieveDate < ActiveRecord::Migration[7.0]
  def change
    add_column :sightings, :date, :date
    remove_column :sightings, :Date, :string
  end
end
