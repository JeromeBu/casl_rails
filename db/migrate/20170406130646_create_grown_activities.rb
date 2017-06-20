class CreateGrownActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :grown_activities do |t|
      t.string :title
      t.string :subtitle
      t.integer :max_participants

      t.timestamps
    end
  end
end
