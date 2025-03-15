# Simple Ruby Sinatra App to support a class

* Sinatra 
	* Views
	
* Bulma CSS

## SDLC
* draft script without views
* main app utilizes vises in the views folder


## Installation 

```bash
apt-get update && apt-get -y dist-upgrade
apt-get install ruby-full build-essential zlib1g-dev
gem install sinatra

# PUMA
gem insatll puma
bundle exec puma -e production -d

# Straight-up no chaser

## Development 
 nohup ruby brainapp.rb >> log/log_file 2>&1 &
 
## Production
nohup ruby brainapp.rb -p 3000 -e production >> log/log_file 2>&1 &
```