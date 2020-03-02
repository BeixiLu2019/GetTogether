class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :category
      t.datetime :datetime
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
