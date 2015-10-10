namespace :sms do


  require 'twilio-ruby'
  require 'pry'
  ​
  $data = [   ## Not global... rather use the database
    {
      message: 'You are great!',
      frequency: 20,
      last_sent: Time.now
    },
    {
      message: 'You are super!',
      frequency: 10,
      last_sent: Time.now
    },
    {
      message: 'You are wonder!',
      frequency: 5,
      last_sent: Time.now
    },
  ]
  ​
  ​
  account_sid = ENV['TWIL_SID']
  auth_token = ENV['TWIL_TOKEN']
  ​
  Twilio.configure do |config|
    config.account_sid = account_sid
    config.auth_token = auth_token
  end
  ​
  $client = Twilio::REST::Client.new
  ​
  ​
  def sendMessages
  ​
    $data.map! do |item|
  ​
      time_difference = Time.now - item[:last_sent]
      if time_difference > item[:frequency]
  ​
        $client.messages.create(
          from: '+1 5094123281',
          to: '+15094386223',
          body: item[:message]
        )
  ​
        item[:last_sent] = Time.now
      end
  ​
      item
    end
  ​
  end
  ​
  ​
  ​
  while true  ## Heroku Schelduler
    sendMessages()
    sleep(2) ## Heroku Schelduler
  end ## Heroku Schelduler
  ​
  ​
  #



end
