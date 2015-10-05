# PhoneBuzz
FizzBuzz game, played through the phone

**SUMMARY**

Three Twilio apps are implemented in this repo. 

- Program 1 is a simple FizzBuzz app in which the user calls a Twilio number, inputs a number using the keyboard of his phone and the "FizzBuzz" output is read back to him.
*Example:* User inputs "5" followed by the "#" key. Output is "1 2 Fizz 4 Buzz"

- Program 2 is an extension of Program 1. User inputs a phone number in a web form. The app dials the phone number and prompts the user for a number. The rest is similar to Program 1, in which the output of FizzBuzz is read back to the caller.

- Program 3 adds an input form to Program 2. The user inputs a phone number, as well as a delay (in minutes). Upon  submission, the phone number is called after the number of minutes inputted by the delay. After that, the app is similar to Program 1 and 2.


**HOW TO RUN THE APPS**
- **Setting up twilio:** I used ngrok to set up a local server. Once you have ngrok set up, copy the ngrok link which is linked to your localhost:4567 and update your Twilio Voice URL to be the ngrok link. 

- **Program 1:** First, change the auth_token variable in the ruby script of Program 1, to be the auth token linked to your Twilio account. Next, run the ruby script using "ruby FizzBuzz_P1.rb". Call your twilio account and play FizzBuzz!

- **Program 2:** First, change the auth_token and account_id to be the ones linked to your account. Second, run "ruby FizzBuzz_P2.rb". Third, go to your ngrok link in your browser, enter a phone number with this format: XXXXXXXXXX (example: 5143214321), then press call. Twilio will call your number and ask you to input a number. Input a number followed by a "#" sign. Finally, listen to the FizzBuzz outbut be read back to you! 

- **Program 3:** Same steps as Program 3. When you load the form in your web browser, make sure to input a delay in minutes. After your delay, twilio will call the number you inputed. The rest is similar to Program 1 & 2.



**NOTES:**
The TwiML response that handles your input in Program 2 and 3 is currently hosted on a dropbox folder. The xml code can be found in the Program 2 and 3 folders. Feel free to host the xml file on another server, but make sure you change the "url" argument in those following lines:

```
@call = @client.account.calls.create(
    :from => '+14387938468',   # Twilio number
    :to => toNumb,     
    :url => 'https://dl.dropboxusercontent.com/u/39796511/PhoneBuzz.xml'
    )
```
			
Enjoy!
