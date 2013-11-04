class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.integer :article_id
      t.string :tag

      t.timestamps
    end
  end
end
