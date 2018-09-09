class ProfileImagesController < ApplicationController
  def create 
    p "aadawdawdawwda"
    uploaded_file = fileupload_params[:file]
    output_path = Rails.root.join('public/profile_image', uploaded_file.original_filename)
    
    begin
      File.open(output_path, 'w+b') do |fp|
        fp.write uploaded_file.read
      end
    rescue
      head 500
    end
    
    # @profile_image = ProfileImage.new(create_params)
    
    # if @profile_image.save
    #   render :json @profile_image
    # else 
    #   render :json @profile_image.errors
    # end

  end



  private 

  def fileupload_params
    params.permit(:file)
  end

  def create_params
    params.merge(user_id: @user.id, image_path: output_path)
  end
end
