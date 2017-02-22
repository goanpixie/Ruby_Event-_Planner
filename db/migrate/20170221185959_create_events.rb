class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :state
      t.date :date
      t.references :user, index: true

      t.timestamps
    end
  end
end
