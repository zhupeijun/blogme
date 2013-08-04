class Comment < ActiveRecord::Base
	belongs_to :article
	validates :nick, :email, :content, presence: true
end
