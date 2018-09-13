# config/schedule.rb
require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

# 1分毎に`HelloWorld`を出力する
every 1.minutes do
  begin
    rake "check_date:check_state"
  rescue => e
    raise e
  end
end