class CreateArticleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :article_comments do |t|
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
