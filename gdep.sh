#!/bin/bash

git pull origin master
rake assets:precompile RAILS_ENV=production
rake db:migrate RAILS_ENV=production
 touch tmp/restart.txt
