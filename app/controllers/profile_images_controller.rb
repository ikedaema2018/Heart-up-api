class ProfileImagesController < ApplicationController
  def update
    uploaded_file = fileupload_params[:file]
    @path_name = uploaded_file.original_filename
    output_path = Rails.root.join('public/profile_image', @path_name)

    @profile_image = User.find(@user.id)

    @profile_image = User.find(@user.id)

    begin
      if !@profile_image[:profile_image].nil?
        delete_path = Rails.root.join('public/profile_image', @profile_image[:profile_image])
        File.delete delete_path
      end
    rescue
      
    end

    begin
      File.open(output_path, 'w+b') do |fp|
        fp.write uploaded_file.read
      end
    rescue
      head 500
    end
    
    if @profile_image.update(profile_image: create_params[:image_path])
      render json: @profile_image
    else 
      head 500
    end

  end

  private 

  def fileupload_params
    params.permit(:file)
  end

  def create_params
    params.permit().merge(image_path: @path_name)
  end
end
