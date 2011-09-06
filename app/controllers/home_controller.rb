class HomeController < ApplicationController
  before_filter :navegadorie6
  layout "home"
  
  def index
    @Highlights = Highlight.find(:all, :conditions=>[' published = 1'], :order => '`order`')
  end
end
