class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.string :author
      t.string :tags

      t.timestamps
    end
  end
end
