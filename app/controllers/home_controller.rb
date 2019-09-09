class HomeController < ApplicationController
  layout 'application'
  def index
    @posts = Post.order(created_at: :desc) .page(params[:page]).per(3)
  end
end
