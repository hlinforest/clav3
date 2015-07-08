require 'pry' # in case you want to use binding.pry
require 'active_record'
require_relative 'lib/contact'

# Output messages from Active Record to standard out
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contact_list',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'

ActiveRecord::Schema.define do
  # If we do NOT already have a contacts table, create a new one.
  if !ActiveRecord::Base.connection.table_exists?(:contacts)
      create_table :contacts do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :email, :string
    end
  end

  # Old code left commented out
  # drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts) # If we have a contacts table, drop it.
  # Recreate the contacts table
  # create_table :contacts do |t|
  #   t.column :first_name, :string
  #   t.column :last_name, :string
  #   t.column :email, :string
  # end
end

puts 'Setup DONE'
