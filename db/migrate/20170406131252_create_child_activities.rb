class CreateChildActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :child_activities do |t|
      t.string :title
      t.string :subtitle
      t.integer :max_participant

      t.timestamps
    end
  end
end
