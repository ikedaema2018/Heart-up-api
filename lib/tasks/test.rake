#lib/tasks/saikou.rake 
namespace :aiu do
  task user_stalke: :environment do
    p "aiu"
    UserStalke.user_stalke
  end
end