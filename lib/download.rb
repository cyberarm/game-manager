# Game download template

Shoes.app do
  stack margin_left: 10 do
    title "Downloading #{@download_name}", size: 16
    status = para "Please Wait, this may take awhile... #{@download_size}"
    @msg = para '0%'
    @dl = download "#{@download_text}",
      save: "#{Dir.pwd}/../downloads/#{@download_name}.#{@download_type}" do
      status.text = strong(fg("#{@download_name}, is downloaded.", orangered))
    end

    pg = progress left: 10, top: 100, width: width - 20
    a = animate do
      if @dl.started?
        pg.fraction = dl.progress.to_f / dl.content_length
        @msg.text = "%2d%" % (pg.fraction * 100)
      end
      if @dl.finished?
        pg.hide
        a.stop
      end
    end
  end
end
