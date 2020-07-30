require_relative '../config/environment'
require 'tty-prompt'


cli = CLI.new

cli.welcome
cli.menu