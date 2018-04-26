require 'rake'

Rails.application.load_tasks

Rake::Task['db:migrate'].invoke