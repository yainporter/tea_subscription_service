class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :price
      t.integer :frequency

      t.timestamps
    end
  end
end
