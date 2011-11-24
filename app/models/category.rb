class Category < ActiveRecord::Base
    belongs_to :section
    has_many :products
	
	#scoped_search :on => [:title,:description]

  	has_attached_file :pdf,
          :url => "/uploads/:attachment/:id/:basename_:style.:extension",
          :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"    
    
    validates_presence_of :title
end
