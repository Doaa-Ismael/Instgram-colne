class HomeController < ApplicationController
  layout 'application'
  def index
    @posts = Post.order(created_at: :desc) .page(params[:page]).per(1)
  end
end
