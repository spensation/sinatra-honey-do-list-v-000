require './config/environment'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/controllers/tasks_controller'
require_relative 'app/controllers/users_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SessionsController
use TasksController
use UsersController 
run ApplicationController
