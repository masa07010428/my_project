module ApplicationHelper
  # 消防法施行令第10条第1項
  def fire_extinguisher
    # 消防法施行令第10条第1項第1号イ
    if @building.entirety_usege_id.in?([1,3,4,5,6,12,13,14,16,34,35,36,39])
      "消火器が必要です" 

    # 消防法施行令第10条第1項第1号ロ
    elsif @building.entirety_usege_id.in?([7,8]) && @building.fire_use == "有"
      "消火器が必要です"

    # 消防法施行令第10条第1項第2号イ
    elsif @building.total_area >= 150 && @building.entirety_usege_id.in?([2,9,10,11,15,17,18,19,22,23,26,27,28,29,30])
      "消火器が必要です"

    # 消防法施行令第10条第1項第2号ロ
    elsif @building.total_area >= 150 && @building.entirety_usege_id.in?([7,8]) && @building.fire_use == "無"
      "消火器が必要です"

    # 消防法施行令第10条第1項第3号 
    elsif @building.entirety_usege_id.in?([20,21,24,25,31]) && @building.total_area >= 300
      "消火器が必要です"
    
    # 消防法施行令第10条第1項第4号は少量危険物のためなし
    
    # 消防法施行令第10条第1項第5号 

    else
      "消火器は必要ありません"
    end
  end

  # 消防法施行令第21条
  def automatic_fire_alarm_equipment
    # 消防法施行令第21条第1項第1号イ
    if @building.entirety_usege_id.in?([6,10,12,13,14,16,29,36])
      "自動火災報知設備が必要です"

    # 消防法施行令第21条第1項第1号ロ  
    elsif @building.entirety_usege_id.in?([17])
      "自動火災報知設備が必要です"

    # 消防法施行令第21条第1項第2号
    elsif @building.entirety_usege_id.in?([22]) && @building.total_area >= 200
      "自動火災報知設備が必要です"
    
    # 消防法施行令第21条第1項第3号イ
    elsif @building.total_area >= 300 && @building.entirety_usege_id.in?([1,2,3,4,5,7,8,9,15,19,32,34])
      "自動火災報知設備が必要です"

    # 消防法施行令第21条第1項第3号ロ
    elsif @building.total_area >= 300 && @building.entirety_usege_id.in?([18])
    "自動火災報知設備が必要です"

    # 消防法施行令第21条第1項第4号
    elsif @building.entirety_usege_id.in?([11,20,21,23,24,26,27,28,30]) && @building.total_area >= 500
      "自動火災報知設備が必要です"

    # 消防法施行令第21条第1項第5号

    # 消防法施行令第21条第1項第6号
    elsif @building.entirety_usege_id.in?([25,31]) && @building.total_area >= 1000
      "自動火災報知設備が必要です"
    
    # 消防法施行令第21条第1項第7号
    
    # 消防法施行令第21条第1項第8号
    
    # 消防法施行令第21条第1項第9号
    
    # 消防法施行令第21条第1項第10号
    
    # 消防法施行令第21条第1項第11号
    
    # 消防法施行令第21条第1項第12号
    
    # 消防法施行令第21条第1項第13号
    
    # 消防法施行令第21条第1項第14号
    elsif @building.entirety_floor >= 11
      "11階以上の部分に自動火災報知設備が必要です"
    
    # 消防法施行令第21条第1項第15号
    
    else
      "自動火災報知設備は必要ありません"
    end 
  end

  # 消防法施行令第24条
  def emergency_alarm_equipment
    # 消防法施行令第24条第1項
    if automatic_fire_alarm_equipment == ("自動火災報知設備が必要です" || "11階以上の部分に自動火災報知設備が必要です")
      "非常警報設備及び器具は必要ありません"

    # 消防法施行令第24条第3項第4号
    elsif (@building.entirety_usege_id.in?([1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,22]) && @building.total_capacity >=300) || (@building.entirety_usege_id.in?([11,20,21]) && @building.total_capacity >=800)
      "非常警報設備(放送設備)が必要です"
      
    # 消防法施行令第24条第2項第1号
    elsif automatic_fire_alarm_equipment == "自動火災報知設備が必要です" 
      "非常警報設備は必要ありません"
    elsif @building.entirety_usege_id.in?([10,12,13,14,15,22]) && @building.total_capacity >=20
      "非常警報設備が必要です"

    # 消防法施行令第24条第3項第3号
    elsif @building.entirety_usege_id.in?([32]) && @building.total_capacity >=500
      "非常警報設備(放送設備)が必要です"
    
    # 消防法施行令第24条第2項第2号
    elsif @building.entirety_usege_id.in?([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]) && @building.total_capacity >=50
      # 地階及び無窓階の場合（収容人員20人以上）も入れる
      "非常警報設備が必要です"

    # 消防法施行令第24条第3項第1号
    elsif @building.entirety_usege_id.in?([34,35])
      "非常警報設備が必要です"
    
    # 消防法施行令第24条第3項第2号
    elsif @building.entirety_usege_id.in?([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,36,37,38,39]) && @building.entirety_floor >= 11
      # 地階の階数が3以上の場合も入れる
      "非常警報設備(放送設備)が必要です"
      
    # 消防法施行令第24条第1項
    elsif @building.entirety_usege_id.in?([9,16,17,18,19,23,26,27]) && @building.total_capacity >=20 && @building.total_capacity < 50
      "非常警報器具が必要です"

    else
      "非常警報設備及び器具は必要ありません"
    end
  end

  # 消防法施行令第25条
  def evacuation_tool
    # 消防法施行令第25条第1項第1号
    # 消防法施行令第25条第1項第2号
    # 消防法施行令第25条第1項第3号
    # 消防法施行令第25条第1項第4号
    # 消防法施行令第25条第1項第5号
  end

  # 消防法施行令第26条
  def guide_light
    # 消防法施行令第26条第1項第1号、消防法施行令第26条第1項第2号
    if @building.entirety_usege_id.in?([1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,22,23,32,34,35])
      # 地階、無窓階及び11階以上の場合も入れる
      "誘導灯が必要です"
    
    # 消防法施行令第26条第1項第4号
    elsif @building.entirety_usege_id.in?([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33])
      "誘導標識が必要です"

    else
      "誘導灯及び誘導標識は必要ありません"
    end
  end
end
