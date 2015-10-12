desc "this task is called by the heroku schdeuler"

task :check_to_text => :environment do


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
    @greeneries.map! do |greenery|
  ​
      time_difference = Time.now - greenery[:last_sent]
      if time_difference > greenery.plant[:frequency]
  ​
        $client.messages.create(
          from: '+15094123281',
          to: '+15094386223',
          body: greenery[:message]
        )
  ​
        greenery[:last_sent] = Time.now
      end
  ​
      greenery
    end
  ​
  end
  ​
  ​sendMessages()
  ​
end
