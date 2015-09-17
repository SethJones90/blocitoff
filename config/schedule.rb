set :environment, "development"
every 1.day, :at => '10:00 am' do
  rake "todo:delete_items"
end
