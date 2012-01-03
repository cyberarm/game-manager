require "green_shoes"
require "active_record"
require "open-uri"
require "fileutils"

puts "Starting App.."

ActiveRecord::Base.establish_connection(
 :adapter => 'sqlite3',
 :database => 'test.sqlite3')

 require_relative "lib/game"
 
unless File.exist?("test.sqlite3")
 ActiveRecord::Schema.define do
  create_table :games do |t|
   t.column :name, :string
   t.column :path, :string
   t.timestamps
  end
 end
end

unless File.exist?("downloads")
 FileUtils.mkdir("downloads")
end

Shoes.app title: "Game Manager" do
puts "Started."

stack align: "center" do
background white..lightgrey
  para "Game Manager", size: 20
 end
 $stack_games = stack do
  games = Game.find(:all)
  games.each do |g|
   game_stack = stack do
    background white..lightgrey
     game_para = para "#{g.name}", stroke: "#222", size: 15, margin_left: 5
     flow do
       run_game = button "Run" do
        line = File.basename(g.path)
        cmd = system("cd #{g.path.gsub(line, "")} && \"#{g.path}\"")
        unless cmd == true
         alert "cd #{g.path.gsub(line, "")} && \"#{g.path}\""
        end
       end
       delete_button = button "Delete" do
        Game.destroy(g.id)
        game_stack.clear()
       end
     end
     inscription
    end
   end
 end
   button "Add Game" do
    load "./lib/add_game.rb"
 end
end

puts "Exiting..."
puts "Good Bye"
