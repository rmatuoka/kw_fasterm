class Category < ActiveRecord::Base
    belongs_to :section
    has_many :products
    
    validates_presence_of :title
end
