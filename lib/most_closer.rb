module MostCloser
  #close_of?distanceのためのソナタ
  def set_up(latitude, longitude)
    sql4 = <<-"EOS"
    (
      6371 * ACOS(
        COS(RADIANS(
          EOS

    sql5 = <<-"EOS"
          )) * COS(RADIANS(a.ido)) * COS(RADIANS(a.keido) - RADIANS(
          EOS

    sql6 = ")) + SIN(RADIANS(#{latitude})) * SIN(RADIANS(a.ido))))"
    sql2 = sql4 + latitude.to_s + sql5 + longitude.to_s + sql6
    return sql2
  end

  #これで引数の緯度と経度に一番近いuser_idを取得
  def close_of_distance(latitude, longitude, locate_user)
    # SQLを作成
    sql1 = <<-"EOS"
    select
    a.id
  , a.ido
  , a.keido
  , a.user_id
  , 
  EOS
      #ここにset_upの内容

        sql3 = <<-"EOS"
      as DISTANCE
    from
      user_locates a ORDER BY DISTANCE LIMIT 3;
        EOS

    # sqlを実行し、取得結果をhashに変換
    # ActiveRecord::Base.connection.select_all(sql).to_hash 
    sql2 = set_up(latitude, longitude)
    sql = sql1 + sql2 + sql3
        # return sql
        
        test2 = ActiveRecord::Base.connection.select_all(sql).to_hash 
        if test2[1]["user_id"] != locate_user
          return test2[1]["user_id"]
        elsif test2[2]["user_id"] != locate_user
          return test2[2]["user_id"]
        else
          return test2[0]["user_id"]
        end
  end

  #2番目に近いユーザーを検索
  def weak_close_of_distance(latitude, longitude, locate_user)
    # SQLを作成
    sql1 = <<-"EOS"
    select
    a.id
  , a.ido
  , a.keido
  , a.user_id
  , 
  EOS
      #ここにset_upの内容

        sql3 = <<-"EOS"
      as DISTANCE
    from
      user_locates a ORDER BY DISTANCE LIMIT 3;
        EOS

    # sqlを実行し、取得結果をhashに変換
    # ActiveRecord::Base.connection.select_all(sql).to_hash 
    sql2 = set_up(latitude, longitude)
    sql = sql1 + sql2 + sql3
        # return sql
        
        test2 = ActiveRecord::Base.connection.select_all(sql).to_hash 
        if test2[1]["user_id"] != locate_user
          return test2[1]["user_id"]
        elsif test2[2]["user_id"] != locate_user
          return test2[2]["user_id"]
        else
          return test2[0]["user_id"]
        end
  end

  module_function :close_of_distance, :weak_close_of_distance, :set_up

end