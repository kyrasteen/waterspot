namespace :scheduler do
  desc "This task is called by heroku to update gauge stations every hour"
  task :update_gauges => :environment do
    puts "updating stations"
    Gauge.update_values
    puts "fin"
  end
end
