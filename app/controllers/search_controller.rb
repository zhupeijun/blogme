class SearchController < ApplicationController
	skip_before_filter :authorize
	def new

	end

	def show

		key_words = params[:key_words].gsub(
			/(\ )+/, '%')

		if key_words == nil or key_words == "" or key_words == "%" then
			@articles = Article.all
		else
			@articles = Article.where(
				"title like ? or content like ?", "%" + key_words + "%", "%" + key_words + "%")
		end
	end
end
