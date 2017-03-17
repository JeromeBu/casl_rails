class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :subtitle
      t.integer :max_participants

      t.timestamps
    end
  end
end
