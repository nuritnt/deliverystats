require 'mail'

class MailParser
  def self.parse(email)
    data = clean(Mail.read(email).body.parts.first.raw_source)
            .split("\n").map(&:strip)
    # get kundeninformation with index
    kundeninformation_index = data.index("Kundeninformation")
    # get total with index
    total_index = data.index("Total in CHF")
    # get wind and time with index
    daytime_array = data[data.index("Bestelldatum") + 1 ].split(' ')

    customer_hash = {
      date: daytime_array[1],
      window: daytime_array[2],
      name: data.at(kundeninformation_index + 1),
      street: data.at(kundeninformation_index + 3),
      zip: data.at(kundeninformation_index + 4),
      total: data.at(total_index + 1),
    }
  end

  def self.clean(string)
    CGI.unescape(string.gsub('> ', '').gsub("\r", '').gsub("\t", '').gsub("=", '%'))
  end
end


Kundeninformation = Customer information
