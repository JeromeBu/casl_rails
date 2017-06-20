class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.date :birth_date
      t.string :school
      t.string :class
      t.text :extra_info
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
