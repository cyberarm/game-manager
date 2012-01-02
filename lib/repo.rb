Shoes.app title: "Add Game - Game Manager", width: 300, height: 120 do
stack do
 background white..lightgrey
 para "Add Game", size: 15
end
stack do
 list_box items: ["Select One", "Warzone2100", "Other Game"], choose: "Select One", focus: true do |game|
   @game.text = game.text
   if @game.text == "Warzone2100"
    load "./lib/repo/warzone2100.rb"
    close
    
   elsif @game.text == "Other Game"

    
   elsif @game.text == "Select One"
    @game = "No Game selected"
    end
   end
   
  @game = para "No Game selected", size: 15
  button "Cancel", margin_left: 50 do
   close
 end
  
 end
end
