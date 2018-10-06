class ProfileImagesController < ApplicationController

    

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
  def update
    @profile_image = User.find(@user.id)
    
    client = Aws::S3::Client.new(
      region:            'ap-northeast-1',
      access_key_id:     ENV["API_KEY"],
      secret_access_key: ENV["API_SECRET"]
    )
    s3 = Aws::S3::Resource.new(client: client)

    bucket = s3.bucket('heartup')

    #もし既にアップロードされていたら既存のものを削除
    if @profile_image[:profile_image].present?
      p "---------------delete_image--------------------"
      p @profile_image[:profile_image]
      p "./images/" + @profile_image[:profile_image]
      @nakami = client.delete_object(:bucket => 'heartup', :key => "images/" + @profile_image[:profile_image])
      p "---------------end of delete---------------"
      p @nakami
      p "delete------nakami---------------------"
    end

    uploaded_file = fileupload_params[:file]
        
    file_name = uploaded_file.original_filename
    file_full_path="images/"+file_name
    object = bucket.object(file_full_path)
    # object.write(uploaded_file ,:acl => :public_read)
    object.upload_file(uploaded_file.tempfile, acl: "public-read")

    @profile_image[:profile_image] = file_name


    if @profile_image.save
      p "-------now_profile_image--------------"
      p @profile_image[:profile_image]
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
