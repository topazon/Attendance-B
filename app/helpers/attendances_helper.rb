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
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
  
  # 退勤時間-出勤時間（hour）
  def working_timesA(start, finish)
    (format_hour(finish).to_f - format_hour(start).to_f)
  end
  
  # 退勤時間-出勤時間（min）
  def working_timesB(start, finish)
    ((format_min(finish).to_f - format_min(start).to_f)/60)
  end
  
  
   # 不正な値があるか確認する
  def attendances_invalid?
    attendances = true
    attendances_params.each do |id, item|
      if item[:started_at].blank? && item[:finished_at].blank?
        next
      elsif item[:started_at].blank? || item[:finished_at].blank?
        attendances = false
        break
      elsif item[:started_at] > item[:finished_at]
        attendances = false
        break
      end
    end
    return attendances
  end
end
