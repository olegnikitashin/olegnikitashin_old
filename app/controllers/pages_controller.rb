class PagesController < ApplicationController
  def home
    @blog_posts = Blog.all
    @skills = Skill.all
    @portfolios = Portfolio.all
  end

  def about; end

  def contact; end

  def tech_news
    @tweets = SocialTool.twitter_search
  end
end
