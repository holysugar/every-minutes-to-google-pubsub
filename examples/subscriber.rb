#!/usr/bin/env ruby

require "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new(
  project: ENV['PROJECT_ID'],
  keyfile: ENV['GOOGLE_KEYFILE'],
)

topic = pubsub.topic(ENV['TOPIC'])
name = ENV['SUBSCRIBER_NAME'] || 'subscriber-example'

topic.subscribe(name) # do once

subscription = topic.subscription(name)

subscription.listen(autoack: true) { |msg|
  puts msg.data
  p msg.attributes
}
