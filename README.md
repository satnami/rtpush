[![Gem Version](https://badge.fury.io/rb/rtpush.svg)](https://badge.fury.io/rb/rtpush) [![Maintainability](https://api.codeclimate.com/v1/badges/687aec30cf02fad5b6eb/maintainability)](https://codeclimate.com/github/satnami/rtpush/maintainability)

# RTPush. The terminal push notification service for Ruby.

## Installation
```
$ gem install rtpush
```

## Configuring
You can use [dotenv](https://github.com/bkeepers/dotenv), which is included in the Gemfile,
to fill in any values that you can't or won't supply through the environment.

In order of precedence RTPush uses:
1. Environment variables (for example MY_VALUE=abc)
2. Values provided in a .env file
3. Default values from .env.default

## Configuration Parameters
```
NOTIFICATION_TITLE=XX

REDIS_URL=XX

SLACK_WEBHOOK=XX

TWILIO_TO_NUMBER=XX
TWILIO_FROM_NUMBER=XX
TWILIO_AUTH_TOKEN=XX
TWILIO_ACCOUNT_SID=XX

GCM_PRIORITY=XX
GCM_AUTH_KEY=XX
GCM_ANDROID_APP_NAME=XX
GCM_ANDROID_DEVICE_TOKEN=XX

INSTAPUSH_APP_ID=XX
INSTAPUSH_APP_SECRET=XX
INSTAPUSH_APP_EVENT=XX
```

## Setup guide
```
TBD
```

## Usage
rtpush strategy1,strategy2 message
```
$ rtpush sms,slack,mobile,insta hello 
```

## Test
```
rspec spec
```

## Improvement
```
TBD
```
