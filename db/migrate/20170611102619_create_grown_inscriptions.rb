class CreateGrownInscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :grown_inscriptions do |t|
      t.references :grown_activity, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
