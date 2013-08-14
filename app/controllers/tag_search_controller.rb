class TagSearchController < ApplicationController
	skip_before_filter :authorize
  def search
		@articles = Article.joins(:article_tags).where(
			"article_tags.tag = '#{params[:tag]}'")
  end
end
