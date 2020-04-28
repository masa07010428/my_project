module ApplicationHelper
  # 消防法施行令第10条第1項
  def fire_extinguisher
    # 消防法施行令第10条第1項第1号イ
    if usege_in?(@building,[1, 3, 4, 5, 6, 12, 13, 14, 16, 34, 35, 36, 39])
      "#{@equipments[0]}が必要です（#{law(article: 10, paragraph: 1, item: 1, number: "イ")})"
      

    # 消防法施行令第10条第1項第1号ロ
    elsif usege_in?(@building,[7, 8]) && @building.fire_use == "有"
      "#{@equipments[0]}が必要です（#{law(article: 10, paragraph: 1, item: 1, number: "ロ")}）"

    # 消防法施行令第10条第1項第2号イ
    elsif total_area(@building,150) && usege_in?(@building,[2, 9, 10, 11, 15, 17, 18, 19, 22, 23, 26, 27, 28, 29, 30])
      "#{@equipments[0]}が必要です（#{law(article: 10, paragraph: 1, item: 2, number: "イ")}）"

    # 消防法施行令第10条第1項第2号ロ
    elsif total_area(@building,150) && usege_in?(@building,[7, 8]) && @building.fire_use == "無"
      "#{@equipments[0]}が必要です（#{law(article: 10, paragraph: 1, item: 2, number: "ロ")}）"

    # 消防法施行令第10条第1項第3号 
    elsif usege_in?(@building,[20, 21, 24, 25, 31]) && total_area(@building,300)
      "#{@equipments[0]}が必要です（#{law(article: 10, paragraph: 1, item: 3, number: nil)}）"
    
    # 消防法施行令第10条第1項第4号は少量危険物のためなし
    
    # 消防法施行令第10条第1項第5号 

    else
      "#{@equipments[0]}は必要ありません"
    end
  end

  # 消防法施行令第21条
  def automatic_fire_alarm_equipment
    # 消防法施行令第21条第1項第1号イ
    afae = if usege_in?(@building,[6, 10, 12, 13, 14, 16, 29, 36])
      "#{@equipments[10]}が必要です（#{law(article: 21, paragraph: 1, item: 1, number: "イ")}）"

    # 消防法施行令第21条第1項第1号ロ  
    elsif usege_in?(@building,[17])
      "#{@equipments[10]}が必要です（#{law(article: 21, paragraph: 1, item: 1, number: "ロ")}）"

    # 消防法施行令第21条第1項第2号
    elsif usege_in?(@building,[22]) && total_area(@building,200)
      "#{@equipments[10]}が必要です（#{law(article: 21, paragraph: 1, item: 2, number: nil)}）"
    
    # 消防法施行令第21条第1項第3号イ
    elsif total_area(@building,300) && usege_in?(@building,[1, 2, 3, 4, 5, 7, 8, 9, 15, 19, 32, 34])
      "#{@equipments[10]}が必要です（#{law(article: 21, paragraph: 1, item: 3, number: "イ")}）"

    # 消防法施行令第21条第1項第3号ロ
    elsif total_area(@building,300) && usege_in?(@building,[18])
    "#{@equipments[10]}が必要です（#{law(article: 21, paragraph: 1, item: 3, number: "ロ")}）"

    # 消防法施行令第21条第1項第4号
    elsif usege_in?(@building,[11, 20, 21, 23, 24, 26, 27, 28, 30]) && total_area(@building,500)
      "#{@equipments[10]}が必要です（#{law(article: 21, paragraph: 1, item: 4, number: nil)}）"

    # 消防法施行令第21条第1項第5号

    # 消防法施行令第21条第1項第6号
    elsif usege_in?(@building,[25, 31]) && total_area(@building,1000)
      "#{@equipments[10]}が必要です（#{law(article: 21, paragraph: 1, item: 6, number: nil)}）"
    
    # 消防法施行令第21条第1項第7号
    
    # 消防法施行令第21条第1項第8号
    
    # 消防法施行令第21条第1項第9号
    
    # 消防法施行令第21条第1項第10号
    
    # 消防法施行令第21条第1項第11号
    
    # 消防法施行令第21条第1項第12号
    
    # 消防法施行令第21条第1項第13号
    
    # 消防法施行令第21条第1項第14号
    elsif @building.entirety_floor >= 11
      "11階以上の部分に#{@equipments[10]}が必要です（#{law(article: 21, paragraph: 1, item: 14, number: nil)}）"
    
    # 消防法施行令第21条第1項第15号

    else
      "#{@equipments[10]}は必要ありません"
    end 
  end

  # 消防法施行令第24条
  def emergency_alarm_equipment
    # 消防法施行令第24条第1項
    if automatic_fire_alarm_equipment.include?("#{@equipments[10]}が必要です")
      "非常警報器具及び設備は必要ありません"

    # 消防法施行令第24条第3項第4号
    elsif (usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 22]) && total_capacity(@building) >=300) || (usege_in?(@building,[11,20,21]) && total_capacity(@building) >=800)
      "#{@equipments[14]}(放送設備)が必要です（#{law(article: 24, paragraph: 3, item: 4, number: nil)}）"
      
    # 消防法施行令第24条第2項第1号
    elsif automatic_fire_alarm_equipment.include?("#{@equipments[10]}が必要です")
      "#{@equipments[14]}は必要ありません（#{law(article: 24, paragraph: 2, item: 1, number: nil)}）"
    elsif usege_in?(@building,[10, 12, 13, 14, 15, 22]) && total_capacity(@building) >=20
      "#{@equipments[14]}が必要です（#{law(article: 24, paragraph: 2, item: 1, number: nil)}）"

    # 消防法施行令第24条第3項第3号
    elsif usege_in?(@building,[32]) && total_capacity(@building) >=500
      "#{@equipments[14]}(放送設備)が必要です（#{law(article: 24, paragraph: 3, item: 3, number: nil)}）"
    
    # 消防法施行令第24条第2項第2号
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36]) && total_capacity(@building) >=50
      # 地階及び無窓階の場合（収容人員20人以上）も入れる
      "#{@equipments[14]}が必要です（#{law(article: 24, paragraph: 2, item: 2, number: nil)}）"

    # 消防法施行令第24条第3項第1号
    elsif usege_in?(@building,[34, 35])
      "#{@equipments[14]}が必要です（#{law(article: 24, paragraph: 3, item: 1, number: nil)}）"
    
    # 消防法施行令第24条第3項第2号
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 36, 37, 38, 39]) && @building.entirety_floor >= 11
      # 地階の階数が3以上の場合も入れる
      "#{@equipments[14]}(放送設備)が必要です（#{law(article: 24, paragraph: 3, item: 2, number: nil)}）"
      
    # 消防法施行令第24条第1項
    elsif usege_in?(@building,[9, 16, 17, 18, 19, 23, 26, 27]) && total_capacity(@building) >=20 && total_capacity(@building) < 50
      "非常警報器具が必要です（#{law(article: 24, paragraph: 1, item: nil, number: nil)}）"

    else
      "#{@equipments[14]}及び器具は必要ありません"
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
    if usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 32, 34, 35])
      # 地階、無窓階及び11階以上の場合も入れる
      "#{@equipments[16]}が必要です（#{law(article: 26, paragraph: 1, item: 1, number: nil)}、#{law(article: 26, paragraph: 1, item: 2, number: nil)}）"
    
    # 消防法施行令第26条第1項第4号
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33])
      "誘導標識が必要です（#{law(article: 26, paragraph: 1, item: 4, number: nil)}）"

    else
      "#{@equipments[16]}は必要ありません"
    end
  end

  private

  def usege_in?(building,*n)
    building.entirety_usege_id.in?(*n)
  end

  def total_area(building,n)
    building.total_area >= n
  end

  def total_capacity(building)
    building.total_capacity
  end

  def law(article: a, paragraph: b, item: c, number: d)
    "消防法施行令第#{article}条第#{paragraph}項第#{item}号#{number}"
  end
end