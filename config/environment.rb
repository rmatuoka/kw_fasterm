 ENV['GEM_PATH'] = '/home/fasterm/.gems'
 
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
KwFasterm::Application.initialize!
