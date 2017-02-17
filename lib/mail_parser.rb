require 'mail'

class MailParser
  def self.parse(email)
    data = clean(Mail.read(email).body.parts.first.raw_source)
            .split("\n").map(&:strip)

    notes_index = data.index("Bemerkungen") || data.index("Notes")
    total_index = data.index("Total in CHF")
    time_index = data.index("Bestelldatum") || data.index("Order date")
    time_array = data.at(time_index + 1).split(' ')
    customer_hash = {
      date: time_array[1],
      window: time_array[2],
      name: data.at(notes_index - 4),
      street: data.at(notes_index - 2),
      zip: data.at(notes_index - 1),
      total: data.at(total_index + 1)
    }

  end

  def self.clean(string)
    CGI.unescape(string.gsub('> ', '').gsub("\r", '').gsub("\t", '').gsub("=", '%'))
  end
end


# refactor gsub method
