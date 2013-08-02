class Article < ActiveRecord::Base
	validates :title, :date, :content, :tags, :author,
		presence: true

	paginates_per 5

end
