require "green_shoes"

Shoes.app title: "Add Game", width: 150, height: 100 do
 stack do
  background white..lightgrey
  para "Add Game", size: 15
 end
 
 button "Add From HardDrive" do
  Shoes.app width: 200, height: 200, title: "Add Game" do#
   stack do
    background white..lightgrey
    para "Add Game", size: 15
   end
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
     $stack_games.clear {
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
     }
     puts "Added Game: #{@name.text}"
     close()
    else
     alert("Error Adding Game")
    end
   end
  end#
  close
 end
  
  button "Add From Game Repository" do
   @ask = confirm "Feature Not Fully-Functional Yet. \n Continue anyways?"
   if @ask == true
    load "./lib/repo.rb"
    close
   else
   end
 end
end
