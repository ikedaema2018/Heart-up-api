class ProfileImagesController < ApplicationController
  def update
    p "1"
    AWS.config(access_key_id: 'AKIAIL6MGOAT5XBVA2NQ', secret_access_key: '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', region: 'ap-northeast-1')
    p "2"
    s3 = AWS::S3.new
    bucket = s3.buckets['heart-up']
    uploaded_file = fileupload_params[:file]
        
    p "3"
    file_name = uploaded_file.original_filename
    file_full_path="images/"+file_name
    object = bucket.objects[file_full_path]
    object.write(file ,:acl => :public_read)
    p "4"
    @s3image.file_name="http://s3-ap-northeast-1.amazonaws.com/heart-up/images/#{file_name}"

    p "5"
    @profile_image = User.find(@user.id)
    if @profile_image.update(profile_image: file_name)
      render json: @profile_image
    else 
      head 500
    end

    # test, development
    # output_path = Rails.root.join('public/profile_image', @path_name)



    # @profile_image = User.find(@user.id)

    # uploaded_file = fileupload_params[:file]

    # @path_name = uploaded_file.original_filename
    # begin
    #   if !@profile_image[:profile_image].nil?
    #     delete_path = Rails.root.join('public/profile_image', @profile_image[:profile_image])
    #     File.delete delete_path
    #   end
    # rescue
      
    # end

    # begin
    #   File.open(output_path, 'w+b') do |fp|
    #     fp.write uploaded_file.read
    #   end
    # rescue
    #   head 500
    # end
    
    # if @profile_image.update(profile_image: create_params[:image_path])
    #   render json: @profile_image
    # else 
    #   head 500
    # end
  end

  private 

  def fileupload_params
    params.permit(:file)
  end

  def create_params
    params.permit().merge(image_path: @path_name)
  end
end
