namespace :scheduler do
  desc "This task is called by heroku to update gauge stations every hour"
  task :update_gauges => :environment do

  STATES = [
    "al","ak","az","ar","ca","co",
    "ct","de","dc","fl","ga","hi",
    "id","il","in","ia","ks","ky",
    "la","me","md","ma","mi","mn",
    "ms","mo","mt","ne","nv","nh",
    "nj","nm","ny","nc","nd","oh",
    "ok","or","pa","ri","sc","sd",
    "tn","tx","ut","vt","va","wa",
    "wv","wi","wy"
  ]

    puts "updating stations"
    STATES.each do |state|
      Gauge.update_values(state)
    end
    puts "fin"
  end
end
