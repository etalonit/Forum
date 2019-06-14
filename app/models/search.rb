class Search < ApplicationRecord

	def search_articles

		articles = Article.all

        articles = articles.where("title LIKE ?","%#{keywords}%") if keywords.present?
		articles = articles.where("content LIKE ?","%#{content}%") if content.present?

		return articles
	end
end
