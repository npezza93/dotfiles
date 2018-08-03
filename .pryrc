#!/bin/env ruby
# encoding: utf-8

Pry.config.prompt = [
  proc { |obj, _, _| "#{obj} \e[35m❯\e[0m " }
]
Pry.config.color = true
