rm -f /repo/tmp/pids/server.pid
rm -f /repo/tmp/pids/sidekiq.pid
bundle exec rails db:migrate
bundle exec rails s -p 3000 -b '0.0.0.0' & bundle exec sidekiq & bin/webpack-dev-server