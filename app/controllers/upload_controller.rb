class UploadController < ApplicationController
  def index
    @files = begin Dir.entries('/user_upload') rescue [] end
  end

  def create
    if params[:upload] and params[:upload][:file]
      path = File.join('/user_upload', params[:upload][:file].original_filename)
      data = params[:upload][:file].read
      File.open(path, "wb") { |f| f.write data }
    end

    redirect_to '/upload'
  end

  def show
    name = "#{params[:id]}.#{params[:format]}"
    send_file File.join('/user_upload', name)
  end
end
