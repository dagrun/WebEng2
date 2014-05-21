# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
MeetAct::Application.initialize!
require 'flickraw'
MY_KEY = '026fea634b166f2e91d3d1df76b03a90'
MY_SECRET = '4d70fa4a3b9a167f'
FlickRaw.api_key = MY_KEY
FlickRaw.shared_secret = MY_SECRET