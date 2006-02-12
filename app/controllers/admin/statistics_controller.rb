class Admin::StatisticsController < ApplicationController
  layout 'admin'

  def index
    overview
    render :action => 'overview'
  end

  def overview
    @total_users = User.find(:all).size
    @total_memorials = Memorial.find(:all).size
    @total_comments = Comment.find(:all).size
    @total_pictures = Picture.find(:all).size
  end
end
