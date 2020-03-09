module AttendancesHelper
  
  def format_hour(time)
    format("%.2d",(time.hour))
  end
  
  # 分を15分刻みにする
  def format_min(time)
    format("%.2d",((time.min)/15)*15)
  end
  
  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
    format("%.2f", (finish.round_to(15.minutes) - start.round_to(15.minutes))/3600)
  end

end
