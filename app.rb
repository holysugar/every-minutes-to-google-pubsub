require 'sinatra'
require 'google/cloud/pubsub'

def project_id
  ENV['PROJECT_ID']
end

def topic_name
  ENV['TOPIC']
end

def keyfile
  ENV['GOOGLE_KEYFILE']
end

def attributes(now)
  {
    year: now.year,
    month: now.month,
    day: now.day,
    hour: now.hour,
    min: now.min,
    time: now.iso8601,
    tz: ENV['TZ'],
    unixtime: now.to_i,
  }
end

def pubsub
  if keyfile
    Google::Cloud::Pubsub.new(project: project_id, keyfile: keyfile)
  else
    Google::Cloud::Pubsub.new(project: project_id)
  end
end

get '/tick' do
  now = Time.now
  text = now.iso8601
  data = attributes(now)

  pubsub.publish(topic_name, text, data.merge(autocreate: true))

  content_type 'text/plain'
  "#{text}\n#{data.map{|k,v| "#{k}: #{v}"}.join("\n")}"
end

