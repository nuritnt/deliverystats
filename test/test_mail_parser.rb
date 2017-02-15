# Require minitest
require 'minitest/autorun'

#Make tests look nice
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/mail_parser'

class MailParserTest < Minitest::Test
    def test_email_1
      customer_hash = {
        date: '23.01.17',
        window: '19:00-19:30',
        name: 'Christine Mika',
        street: 'Bürglistrasse 26',
        zip: '8002',
        total: '53,00'
      }

      assert_equal customer_hash, MailParser.parse('test/fixtures/email_1.eml')
    end

    def test_email_2
      customer_hash = {
        date: '12.02.17',
        window: '19:00-19:30',
        name: 'Mona Moschko',
        street: 'Sihlhallenstrasse 11',
        zip: '8004',
        total: '59.20'
      }

      assert_equal customer_hash, MailParser.parse('test/fixtures/email_2.eml')
    end

end
