require_relative '../config/environment'
require 'tty-prompt'


cli = CLI.new

cli.welcome
cli.main_menu
cli.exit_method