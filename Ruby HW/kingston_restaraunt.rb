# Order Taker
# 7.25.14
# Created by Jamie Kingston
=begin
  
- Give me a menu of all of the foods you offer.
- Allow me to create a new table.
  - When the waitress takes the order, it will be saved onto the table 
- I will assign food to tables via typing in the name of the food or a number in the list of foods.
  ex:
    - 1: Hot dog - 2.99
    - 2: Cheese burger - 2.00
    - What is the user ordering? "Hot dog"
    - That will add a hot dog to the customer's table
- It should keep a running count of food I have ordered as well as the costs associated with each item (like a reciept (sp?))
- It should also keep a total cost
- That list should be numbered so I can decide if I want to remove items from the list
ie: "remove 2"
  
=end

class Restaraunt

  attr_accessor :menu
  attr_accessor :tables

  def initialize tables

    puts "\n\nWelcome to Wretched English Fare, the restaraunt for people who don't care what they eat.\n\n"

    self.menu = [
      {
        "Just barley soup" => 5.99
      },
      {
        "An unbearable likeness of beans" => 3.99
      },
      {
        "Grey stuff in a pot" => 2.99
      }, 
      {
        "Brown stuff in a pot" => 6.99
      }, 
      {
        "Crown gruel" => 9.99
      }, 
      {
        "Bovine spogiform yum, yum, yum" => 14.99
      },  
    ]

    self.tables = []

    for num in 1..tables
      self.tables.push Table.new
    end

  end

  def display_menu

    puts "\n\nWelcome to Wretched English Fare, the restaraunt for people who don't care what they eat.\n\n"

    puts "Our menu never changes. Here it is:\n\n"

    self.menu.each do |pair|
    print ((self.menu.index pair) + 1)
      pair.each do |item, price|
        print ".  "
        puts "#{item} #{ "." * (40 - item.length)} #{price}"
      end
    end

    print "\n\n"

  end

  def add_table

    self.tables.push Table.new

  end

  def serve_table

    # puts "Which table are you serving? "

    # table = gets.chomp.to_i - 1

    table = rand 0..self.tables.length

    puts "\nNow serving table #{table + 1}\n\n"

    self.tables[table].ticket.clear

    display_menu

    self.tables[table].take_order self.menu

    self.tables[table].edit_order



  end

end

class Table

  @@list_of_tables
  attr_accessor :ticket
  attr_accessor :order_total

  def initialize

    self.ticket = []
    self.order_total = 0

  end

  def take_order menu

    ordering = true

    while ordering == true

      puts "Enter the customer's order here: (Press enter to finish)"
      order = gets.chomp.capitalize

      if order.to_i > 0
        order = order.to_i - 1
        if order < menu.length - 1
          ticket.push menu[order]
        else
          puts "That is not on the menu.\n\n"     
        end
      elsif order.to_i == 0 && order != "Done"
        menu.each do |pair|
          match = pair.select {|k,v| k == order }
          if match.length > 0
            ticket.push match
          end
        end
      elsif order == "Done"
        ordering = false
      end

      # p self.ticket

    end

    self.display_ticket    
    
  end

  def edit_order 

    editing = true

    while editing == true
      
      puts "Enter ticket number to remove item. (Press enter to place final order)"
      edit = gets.chomp.to_i

      # p edits

      if edit > 0
 
        ticket.delete_at(edit.to_i - 1)

      else
        editing = false
      end

      self.display_ticket

    end

  end 

  def display_ticket
    
    puts "\n\nTicket review: \n\n"

    ticket_number = 1
    
    self.ticket.each do |pair|
      print ticket_number
      ticket_number += 1
      pair.each do |item, price|
        print ".  "
        puts "#{item} #{ "." * (40 - item.length)} #{price}"
      end
    end

    print "\n"

    self.sum_ticket

    puts "#{' '* (42 - self.order_total.to_s.length)}Total $ #{self.order_total}"

    print "\n\n"

  end

  def sum_ticket

    self.order_total = 0

    self.ticket.each do |item|
      item.each_value {|value| self.order_total += value}
    end
  end

end


def main

  wef = Restaraunt.new 4

  # p wef.tables

  wef.display_menu

  shift_over = false

  while shift_over == false

    wef.serve_table

  end

  # table_1 = Table.new

  # table_1.take_order menu.menu

  # table_1.edit_order

end

main