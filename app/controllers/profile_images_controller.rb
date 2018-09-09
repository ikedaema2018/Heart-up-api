class ProfileImagesController < ApplicationController
  def create
    uploaded_file = fileupload_params[:file]
    @path_name = uploaded_file.original_filename
    output_path = Rails.root.join('public/profile_image', @path_name)

    p @path_name
    
    begin
      File.open(output_path, 'w+b') do |fp|
        fp.write uploaded_file.read
      end
    rescue
      head 500
    end


    @profile_image = ProfileImage.new(create_params)
    
    if @profile_image.save
      head 200
    else 
      head 500
    end

  end



  private 

  def fileupload_params
    params.permit(:file)
  end

  def create_params
    params.permit().merge(user_id: @user.id, image_path: @path_name)
  end
end
