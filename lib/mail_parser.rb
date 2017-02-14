require 'mail'

class MailParser
  def self.parse(email)
    email_string = Mail.read(email).body.parts.first.raw_source
      clean_string = CGI.unescape(email_string.gsub('> ', '').gsub("\r", '').gsub("\t", '').gsub("=", '%'))

      # clean up the email_string
      email_array = clean_string.split("\n").map(&:strip)

      # get kundeninformation with index
      kundeninformation_index = email_array.index("Kundeninformation")
      name = email_array[kundeninformation_index + 1]
      street = email_array[kundeninformation_index + 3]
      zip = email_array[kundeninformation_index + 4]

      # get total with index
      total_index = email_array.index("Total in CHF")
      total = email_array[total_index + 1]

      # get wind and time with index
      daytime_string = email_array[email_array.index("Bestelldatum") + 1 ]
      daytime_array = daytime_string.split(' ')
      date = daytime_array[1]
      window = daytime_array[2]

      customer_hash = {
        date: date,
        window: window,
        name: name,
        street: street,
        zip: zip,
        total: total,
      }
  end
end


# CGI (AT THE END!)
