class TagSearchController < ApplicationController
  def search
		@articles = Article.joins(:article_tags).where(
			"article_tags.tag = '#{params[:tag]}'")
  end
end
