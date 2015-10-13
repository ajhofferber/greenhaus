desc "this task is called by the heroku schdeuler"
task :check_to_text => :environment do

  require 'rubygems'
  require 'twilio-ruby'

  account_sid = ENV['TWIL_SID']
  auth_token = ENV['TWIL_TOKEN']
  @client = Twilio::REST::Client.new account_sid, auth_token

  @from = "+15094123281" # Your Twilio number



  def sendMessages
    @greeneries = Greenery.all

    @greeneries.each do |greenery|

       @time_difference = Time.now.to_i  - greenery[:last_sent]
       if @time_difference > ((greenery.plant[:moisture])*10)

      @client.account.messages.create(
        :from => @from,
        :to => greenery.user.phone,
        :body => "Hello #{greenery.user.username}! Don't forget to water your #{greenery.plant.name} today! xo greenhaus"
      )
      puts "Sent message to #{greenery.user.username} for her #{greenery.plant.name}"
      puts "#{greenery.last_sent}"
      puts "difference: #{@time_difference}"
      puts "frequency: #{greenery.plant[:moisture]}"
      greenery.update(last_sent: Time.now.to_i)
      puts "#{greenery.last_sent}"
      end
      puts "frequency: #{greenery.plant[:moisture]*10}"

      greenery
    end
  end
sendMessages()

end
# desc "this task is called by the heroku schdeuler"
#
# task :check_to_text => :environment do
#
#   require 'twilio-ruby'
#   require 'pry'
#
#   account_sid = ENV['TWIL_SID']
#   auth_token = ENV['TWIL_TOKEN']
#   ​
#   Twilio.configure do |config|
#     config.account_sid = account_sid
#     config.auth_token = auth_token
#   end
#   ​
#   @client = Twilio::REST::Client.new
#   ​
#   ​
#   def sendMessages
#   ​
#     @greeneries.map! do |greenery|
#   ​
#       # time_difference = Time.now - greenery[:last_sent]
#       # if time_difference > greenery.plant[:frequency]
#   ​
#         @client.messages.create(
#           from: '+15094123281',
#           to: '+15094386223',
#           body: greenery[:message]
#         )
#   ​
#         # greenery[:last_sent] = Time.now
#       end
#   ​
#       greenery
#     end
#   ​
#   end
#   ​
#   ​sendMessages()
#   ​
# end
