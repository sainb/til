require 'pp'
require 'colorize'

# https://stackoverflow.com/a/7095275/8574922
x = "1.is
2.this
3.sparta?".lines.map{|x| x.gsub(/[[:digit:]]+\.([a-z]+)(.*)(\n)?/){|y| $1+$2}}

p x