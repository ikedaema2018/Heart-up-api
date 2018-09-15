# config/schedule.rb
require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"


every 5.minutes do
  runner "UserStalke.user_stalke"
end