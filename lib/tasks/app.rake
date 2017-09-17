namespace :app do
  desc "TODO"
  task setup_database: :environment do
    sql = File.open("#{Rails.root}/db/manual_migration.sql")
    ActiveRecord::Base.connection.execute(sql.read)
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end

  task db_reset: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    sql = File.open("#{Rails.root}/db/manual_migration.sql")
  ActiveRecord::Base.connection.execute(sql.read)
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end

end
