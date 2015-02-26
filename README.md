# node-sms-drone

Control the Parrot Mini Drone with SMS

![Photo of drone being controlled with SMS](https://cloud.githubusercontent.com/assets/1238468/6400092/b814fa0a-bdee-11e4-9e5f-9f5850be2a48.jpg)

### Install

```bash
$ git clone git@github.com:adambutler/node-sms-drone.git
$ cd node-sms-drone
$ npm install -g coffee-script
$ npm install
$ cp .env.example .env
```

### Run the server locally

It's easiest if you deploy the server to Heroku
this will make it easy to point Twilio to, however
if you wish to run the server locally just run -

```
$ coffee server.coffee
```

### Run the client

```
$ coffee client.coffee
```

## Contributing

Contributions are welcome, please follow [GitHub Flow](https://guides.github.com/introduction/flow/index.html)
