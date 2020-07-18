#!/bin/env ruby
# encoding: utf-8

Pry.config.prompt = Pry::Prompt.new(
  "custom",
  "my custom prompt",
  [proc { |obj, _, _| "#{obj} \e[35m❯\e[0m " }]
)

# Pry.config.prompt = [
#   proc { |obj, _, _| "#{obj} \e[35m❯\e[0m " }
# ]
Pry.config.color = true
