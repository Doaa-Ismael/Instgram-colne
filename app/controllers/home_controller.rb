class HomeController < ApplicationController
  layout 'application'
  def index
    @posts = Post.order(created_at: :desc)
  end
end
