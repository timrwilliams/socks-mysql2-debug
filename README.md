This repo is designed to reproduce an issue with mysql2 gem outlined here: https://github.com/brianmario/mysql2/issues/571

The issue is connected to proxying TCP traffic through a SOCKS5 proxy using the Dante socksify client. This client only support Linux so this test will not work on Windows or OSX. 

It uses a test MySQL DB running Mysql 5.6.19a and an open SOCKS5 proxy running Dante 1.4 server.

## Suggested Reproduction steps
### 1. Install dependencies
This should install the latest version of mysql2 & bundler should pull down the last working version 0.3.15

    git clone git@github.com:timrwilliams/socks-mysql2-debug.git
    gem install mysql2
    bundle install
    
### 2. Test connectivity
#### a) mysql2 v0.3.17 with no proxy - WORKS
    ruby connectivity.rb
      ======== OUTPUT ==========
      mysql2 version: 0.3.17
      {"1+2"=>3}

#### b) mysql2 v0.3.15 with proxy - WORKS
    ./socksify bundle exec ruby connectivity.rb 
      Proxying requests via SOCKS5
      ======== OUTPUT ==========
      mysql2 version: 0.3.15
      {"1+2"=>3}

#### c) mysql2 v0.3.17 with proxy - FAILS
    ./socksify ruby connectivity.rb 
      Proxying requests via SOCKS5
      ======== OUTPUT ==========
      mysql2 version: 0.3.17
      ...Hangs indefinitely...

Test c generates between 5 - 10 failed connection attempts per seconds resulting in mysql blocking the requesting host. Please contact me to flush the mysql hosts if you're trying to debug the issue and trigger this.