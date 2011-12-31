require "green_shoes"
require "active_record"

puts "Starting App.."

ActiveRecord::Base.establish_connection(
 :adapter => 'sqlite3',
 :database => 'test.sqlite3')

require_relative "game"
 
unless File.exist?("test.sqlite3")
 ActiveRecord::Schema.define do
  create_table :games do |t|
   t.column :name, :string
   t.column :path, :string
   t.timestamps
  end
 end
end

Shoes.app title: "Game Manager" do
	puts "Started."

stack align: "center" do
	 background white..lightgrey
  para "Game Manager", size: 20
 end
 @stack_games = stack do
  games = Game.find(:all)
  games.each do |g|
   stack do
    background white..gray
     @game_para = para link("#{g.name}"),stroke: gray, size: 15, margin_left: 5
     @delete_button = button "Delete" do
      Game.destroy(g.id)
      @delete_button.hide()
     end
     inscription
    end
   end
 end
   button "Add Game" do
    window width: 200, height: 200, title: "Add Game" do
     para "Add Game", size: 15
     para "Game Name:"
     @name = edit_line text: ""
     para "Game Path:"
     button "Path" do
      @add_game = ask_open_file
     end
     para
     button "Add Game" do
      @new_game = Game.new(:name => @name.text, :path => @add_game).save
      if @new_game == true
       alert "restart Game Manager to see game."
       close()
      else 
       alert("Error Adding Game")
    end
   end
  end
  end# if
end

puts "Exiting..."
puts "Bye"
