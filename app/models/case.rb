class Case < ActiveRecord::Base
    has_many :case_images, :dependent => :delete_all
    
    has_attached_file :image, :styles => { :thumb => "125x125>", :c_home => "327x158>" },
        :url => "/uploads/:attachment/:id/:basename_:style.:extension",
        :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
        
    validates_presence_of :title
    validates_presence_of :sumary
    validates_presence_of :body
end
