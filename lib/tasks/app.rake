namespace :app do
  desc "TODO"
  task setup_database: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    sql = File.open("#{Rails.root}/db/manual_migration.sql")
    ActiveRecord::Base.connection.execute(sql.read)
  end

end
