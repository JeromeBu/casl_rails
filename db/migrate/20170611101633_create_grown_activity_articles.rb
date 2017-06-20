class CreateGrownActivityArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :grown_activity_articles do |t|
      t.string :title
      t.text :content
      t.references :grown_activity, foreign_key: true

      t.timestamps
    end
  end
end
