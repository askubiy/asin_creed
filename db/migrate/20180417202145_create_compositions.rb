class CreateCompositions < ActiveRecord::Migration[5.0]
  def change
    create_table :compositions do |t|
      t.string :title
      t.string :schedule
      t.datetime :start_date
      t.datetime :end_date
      t.string :price
      t.string :fee
      t.string :client_name

      t.timestamps
    end
  end
end
