class DepoimentosController < ApplicationController
  before_filter :navegadorie6
  def index
    @depoimentos = Testimonial.all(:conditions => ['published = 1'])
  end

end
