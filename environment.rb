require 'active_record'

# recursviely requires all files in ./lib and down that end in .rb
Dir.glob('./lib/*.rb').each do |file|
  require file
end

Dir.glob(folder +"/*.rb").each do |file|
    require file
  end
end

# tells AR what db file to use
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/deliverystats.db'
)
