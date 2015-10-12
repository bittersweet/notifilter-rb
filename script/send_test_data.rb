require 'thread'

require 'notifilter'

jobs = []
25.times do
  jobs << Thread.new do
    100.times do |i|
      data = { user_id: rand(10), created_at: Time.now }
      Notifilter.notify("signup", data)
    end
  end
end

jobs.map(&:join)
