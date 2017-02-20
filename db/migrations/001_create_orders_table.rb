require_relative '../../environment'

class CreateOrdersTable < ActiveRecord::Migration
    def up
      create_table :orders do |t|
        t.string :customer_name
        t.string :street
        t.string :zip

        t.date :date
        t.string :total
        t.string :time_start
        t.string :time_end


        # TODO Split up these fields
        # t.float :total
        # t.date :date
      end
    end

    def down
      drop_table :orders
    end
end
