namespace :check_date do 
  desc "check_state"# このタスクの説明を書く
# タスクの名前、「:environment」がないとDBやモデルにアクセスできないので、使う場合は付ける
  task :check_state => :environment do
    p "test"
  end
end