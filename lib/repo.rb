Shoes.app title: "Add Game - Game Manager", width: 400, height: 300  do
stack do
 background white..lightgrey
 para  "Add Game", size: 15
end
stack do
 list_box items: ["Select One", "Warzone2100", "Other Game"], choose: "Select One", focus: true do |game|
   @game.text = game.text
   if @game.text == "Warzone2100"
    @game_description.text = "In Warzone 2100, you command the forces of The Project in a battle to rebuild the world after mankind has almost been destroyed by nuclear missiles."
    @game_website.text = "#{@game.text} Website:"
    @game_size.text = "Download Size: 54MB"
    @game_genre.text = "Genre: Real-Time Strategy Game"
    @download_text = "http://downloads.sourceforge.net/project/warzone2100/releases/2.3.9/warzone2100-2.3.9.exe?r=http%3A%2F%2Fwz2100.net%2Fdownload&ts=1325445869&use_mirror=superb-dca2"
    @download_type = "exe"
    @download_name = "wz2100"
    @game_homepage = "http://wz2100.net"
    @homepage.show
    @install.show
    
   elsif @game.text == "Other Game"
    @game_description.text = "A really weird game"
    @game_website.text = "#{@game.text} Website:"
    @game_size.text = "Download Size: 54MB"
    @game_genre.text = "Genre: Unknown"
    @download_text = "http://google.com"
    @download_type = "exe"
    @download_name = "other_game"
    @game_homepage = "http://google.com"
    @homepage.show
    @install.show
    
   elsif @game.text == "Select One"
    @homepage.hide
    @game.text = "No Game selected"
    @game_description.text = ""
    @game_website.text = ""
    @game_size.text = ""
    @game_genre.text = ""
    @install.hide
    end
   end
  @game = para "No Game selected", size: 15
  @game_description = para ""
  @game_website = para ""
  @homepage = button "Visit Game Website" do
   visit(@game_homepage)
  end
  @homepage.hide
  @game_size = para ""
  @game_genre = para ""
 
 flow do
  @install = button "Install" do
   @download = download "#{@download_text}", save: "#{Dir.pwd}/downloads/download_#{@download_name}.#{@download_type}" do
    alert "Download Complete"
   end
  end  
@install.hide

  button "Cancel", margin_left: 50 do
   close
  end
 end  
  
 end
end
