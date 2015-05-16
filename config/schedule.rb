
 set :output, "/log/cron_log.log"

 every :day, :at => '4:52 pm' do
   rake "todo:delete_items"
 end
