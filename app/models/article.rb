class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :article_tags, dependent: :destroy

	validates :title, :date, :content, :tags, :author,
		presence: true

	paginates_per 5


	def add_article_tag(tag)
		article_tags.build(tag: tag)
	end
end
