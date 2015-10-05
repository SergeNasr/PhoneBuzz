require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
require 'slim'
 

get "/" do
	slim :index
end

get '/number' do
	auth_token = '14983519acf2f600f0511427f65e05de'
	account_id = 'AC6cf61d85f0a06524d552e5502f4246ae'

	#set up client to talk to rest API
	@client = Twilio::REST::Client.new account_id, auth_token
	toNumb = params[:number] || "+15147573743"

	if toNumb !~ /^\d{10}$/
		Twilio::TwiML::Response.new do |r| 
			r.Say "Invalid input"
		end.text
	else
		@call = @client.account.calls.create(
			:from => '+14387938468',   # Twilio number
			:to => toNumb,     
			:url => 'https://dl.dropboxusercontent.com/u/39796511/PhoneBuzz.xml'
		)
	end
end

get '/playfizzbuzz' do 
	n = params['Digits'].to_i

	if n <= 0
		Twilio::TwiML::Response.new do |r| 
			r.Say "Invalid input"
		end.text
	else
		answer = ''
		(1..n).each do |i|
			if i % 5 == 0 and i % 3 == 0
	        answer << "FizzBuzz, "
	      elsif i % 5 == 0
	        answer << "Buzz, "
	      elsif i % 3 == 0
	        answer << "Fizz, "
	      else
	        answer << i.to_s + ", "
	      end
		end

		Twilio::TwiML::Response.new do |r| 
			r.Say answer
		end.text
	end
end

