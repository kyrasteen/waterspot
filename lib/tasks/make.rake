namespace :make do
  desc "This display when you type rake -T in the term"
  task :hello => :environment do
    puts Spot.first.user.username
  end
end
