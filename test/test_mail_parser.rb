# Require minitest
require 'minitest/autorun'

#Make tests look nice
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/mail_parser'

class MailParserTest < Minitest::Test
    def test_something
    end
end
