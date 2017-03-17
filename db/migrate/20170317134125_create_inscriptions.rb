class CreateInscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :inscriptions do |t|
      t.references :child, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
