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
     alert "restart Game Manager to see game."
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
