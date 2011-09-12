class HomeController < ApplicationController
  before_filter :navegadorie6
  layout "home"
  
  def index
    @Highlights = Highlight.find(:all, :conditions=>[' published = 1'], :order => '`order`')
    @Noticias = Notice.all(:conditions => ['published = 1'], :limit => 4, :order => "RAND()")
  end
end
