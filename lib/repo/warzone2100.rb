require "green_shoes"

   Shoes.app title: "Warzone2100 - Game Manager" do
     @game_description = "In Warzone 2100, you command the forces of The Project\n in a battle to rebuild the world after mankind\n has almost been destroyed by nuclear missiles.\n\n The game offers campaign, multi-player, and single-player skirmish modes.\n An extensive tech tree with over 400 different technologies,\n combined with the unit design system, allows for a wide variety of possible units and tactics."
     @game_homepage = "http://wz2100.net"
     @game_genre = "Genre: Real-Time Strategy Game"
     @game_name = "Warzone2100"
     @download_size = "Download Size: 57.3MB"
     @download_type = "exe"
     
     stack do
      background white..lightgrey
       para "#{@game_name}", size: 35
      end
     para "#{@game_description}"
     para "_______________________"
     para @game_genre
     para "Rating: 4.3 of 5 stars. (rating from http://game-review.game)"
     para @download_size
     para link("Game Homepage", click: @game_homepage)
     flow do
      button "Download & Install #{@game_name}" do
      
       window title: "WarZone2100 Download - Game Manager", height: 200, width: 675  do
         @game_description = "In Warzone 2100, you command the forces of The Project\n in a battle to rebuild the world after mankind\n has almost been destroyed by nuclear missiles.\n\n The game offers campaign, multi-player, and single-player skirmish modes.\n An extensive tech tree with over 400 different technologies,\n combined with the unit design system, allows for a wide variety of possible units and tactics."
         @game_homepage = "http://wz2100.net"
         @game_genre = "Genre: Real-Time Strategy Game"
         @game_name = "Warzone2100"
         @download_size = "Download Size: 57.3MB"
         @download_text = "http://downloads.sourceforge.net/project/warzone2100/releases/2.3.9/warzone2100-2.3.9.exe?r=http%3A%2F%2Fwz2100.net%2Fdownload&ts=1325445869&use_mirror=superb-dca2"
         @download_type = "exe"
         
       stack do  
        stack margin_left: 10 do
          stack do
           background white..lightgrey
           title "Downloading #{@game_name}", size: 16
          end
          status = para "Please Wait, this may take awhile... #{@download_size}"
          @dl_100 = para "If download seems to hang at 100%, please wait at least 30 seconds to let it finish."
          @msg = para '0%'
          @dl = download "#{@download_text}",
            save: "#{Dir.pwd}/downloads/#{@game_name}.#{@download_type}" do
            status.text = strong(fg("#{@game_name}, is downloaded.", green))
            @dl_100.hide
            end
          end
      
          pg = progress left: 10, top: 100, width: width - 20
          a = animate do
            if @dl.started?
              pg.fraction = @dl.progress.to_f / @dl.content_length
              @msg.text = "%2d%" % (pg.fraction * 100)
            end
            if @dl.finished?
              pg.hide
              a.stop
              @install.show
          end
        end
         #alert "\"#{Dir.pwd}/downloads/#{@game_name}.#{@download_type}\""
         
         # TODO: Add option to automatically try to add to game to list.
          # default install path: C:\Program Files\Warzone 2100-2.3.9
         @install = button "Install Now" do
          cmd = system("\"#{Dir.pwd}/downloads/#{@game_name}.#{@download_type}\"")
          unless cmd == true
          end
        end
        @install.hide
      end
     end

      end
     end
     
    end
