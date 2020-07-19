module BuildingsHelper
  # 消防法施行令第10条第1項
  def fire_extinguisher
    # 消防法施行令第10条第1項第1号イ
    if usege_in?(@building,[1, 3, 4, 5, 6, 12, 13, 14, 16])
      "#{@equipments[0]}が必要です（#{law(10, 1, 1, "イ")})"

    # 消防法施行令第10条第1項第1号ロ
    elsif usege_in?(@building,[7, 8]) && @building.fire_use_id == 1
      "#{@equipments[0]}が必要です（#{law(10, 1, 1, "ロ")}）"

    # 消防法施行令第10条第1項第2号イ
    elsif total_area(@building,150) && usege_in?(@building,[2, 9, 10, 11, 15, 17, 18, 19, 22, 23, 26, 27, 28, 29, 30])
      "#{@equipments[0]}が必要です（#{law(10, 1, 2, "イ")}）"

    # 消防法施行令第10条第1項第2号ロ
    elsif total_area(@building,150) && usege_in?(@building,[7, 8]) && @building.fire_use_id == 2
      "#{@equipments[0]}が必要です（#{law(10, 1, 2, "ロ")}）"

    # 消防法施行令第10条第1項第3号 
    elsif usege_in?(@building,[20, 21, 24, 25, 31]) && total_area(@building,300)
      "#{@equipments[0]}が必要です（#{law(10, 1, 3, nil)}）"

    # 消防法施行令第10条第1項第4号は少量危険物のためなし

    # 消防法施行令第10条第1項第5号
    elsif (basement_floor_number_and_area(@building, 50)) || (windowless_and_area(@building, 50)) || (more_than_3rd_floor_number_and_area(@building, 50))
      "#{@equipments[0]}が必要です（#{law(10, 1, 5, nil)}）"

    else
      "#{@equipments[0]}は必要ありません"
    end
  end

  # 消防法施行令第21条
  def automatic_fire_alarm_equipment
    # 消防法施行令第21条第1項第1号イ
    if usege_in?(@building,[6, 10, 12, 13, 14, 16, 29])
      "#{@equipments[10]}が必要です（#{law(21, 1, 1, "イ")}）"

    # 消防法施行令第21条第1項第1号ロ  
    elsif usege_in?(@building,[17])
      "#{@equipments[10]}が必要です（#{law(21, 1, 1, "ロ")}）"

    # 消防法施行令第21条第1項第2号
    elsif usege_in?(@building,[22]) && total_area(@building,200)
      "#{@equipments[10]}が必要です（#{law(21, 1, 2, nil)}）"
    
    # 消防法施行令第21条第1項第3号イ
    elsif total_area(@building,300) && usege_in?(@building,[1, 2, 3, 4, 5, 7, 8, 9, 15, 19])
      "#{@equipments[10]}が必要です（#{law(21, 1, 3, "イ")}）"

    # 消防法施行令第21条第1項第3号ロ
    elsif total_area(@building,300) && usege_in?(@building,[18])
    "#{@equipments[10]}が必要です（#{law(21, 1, 3, "ロ")}）"

    # 消防法施行令第21条第1項第4号
    elsif usege_in?(@building,[11, 20, 21, 23, 24, 26, 27, 28, 30]) && total_area(@building,500)
      "#{@equipments[10]}が必要です（#{law(21, 1, 4, nil)}）"

    # 消防法施行令第21条第1項第5は（16の3）項が関係するためなし

    # 消防法施行令第21条第1項第6号
    elsif usege_in?(@building,[25, 31]) && total_area(@building,1000)
      "#{@equipments[10]}が必要です（#{law(21, 1, 6, nil)}）"

    # 消防法施行令第21条第1項第7号は避難階段が関係するためなし

    # 消防法施行令第21条第1項第8号は指定可燃物関係のためなし

    # 消防法施行令第21条第1項第9号イ,ロは（16の2）項に関係するためなし

    # 消防法施行令第21条第1項第10号
    elsif usege_in?(@building,[3, 4, 5, 7, 8]) && ((basement_floor_number_and_area(@building, 100)) || (windowless_and_area(@building, 100)))
      "#{@equipments[10]}が必要です（#{law(21, 1, 10, nil)}）"

    # 消防法施行令第21条第1項第11号
    elsif (basement_floor_number_and_area(@building, 300)) || (windowless_and_area(@building, 300)) || (more_than_3rd_floor_number_and_area(@building, 300))
      "#{@equipments[10]}が必要です（#{law(21, 1, 11, nil)}）"
    
    # 消防法施行令第21条第1項第12号は道路のように供される部分が関係するためなし
    
    # 消防法施行令第21条第1項第13号は駐車のように供される部分が関係するためなし
    
    # 消防法施行令第21条第1項第14号
    elsif more_than_11th_floor_number(@building)
      "11階以上の部分に#{@equipments[10]}が必要です（#{law(21, 1, 14, nil)}）"
    
    # 消防法施行令第21条第1項第15号は通信機器室が関係するためなし

    else
      "#{@equipments[10]}は必要ありません"
    end 
  end

  # 消防法施行令第24条
  def emergency_alarm_equipment
    # 消防法施行令第24条第1項
    if automatic_fire_alarm_equipment == "#{@equipments[10]}が必要です"
      "非常警報器具及び設備は必要ありません"

    # 消防法施行令第24条第3項第4号
    elsif (usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 22]) && total_capacity(@building) >= 300) || (usege_in?(@building,[11, 20, 21]) && total_capacity(@building) >= 800)
      "#{@equipments[14]}(放送設備)が必要です（#{law(24, 3, 4, nil)}）"
      
    # 消防法施行令第24条第2項第1号
    elsif automatic_fire_alarm_equipment == "#{@equipments[10]}が必要です"
      "#{@equipments[14]}は必要ありません（#{law(24, 2, 1, nil)}）"

    elsif usege_in?(@building,[10, 12, 13, 14, 15, 22]) && total_capacity(@building) >=20
      "#{@equipments[14]}が必要です（#{law(24, 2, 1, nil)}）"

    # 消防法施行令第24条第3項第3号は（16）項に関係するためなし

    # 消防法施行令第24条第2項第2号
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]) && ((total_capacity(@building) >= 50) || (@building.information_by_floors.where(floor_number_id: [1, 2, 3]).or(@building.information_by_floors.where('windowless_id>=?', 2)).all.sum(:floor_capacity) >= 20))
      "#{@equipments[14]}が必要です（#{law(24, 2, 2, nil)}）"

    # 消防法施行令第24条第3項第1号は（16の2）項及び（16の3）項に関係するためなし

    # 消防法施行令第24条第3項第2号
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]) && ((more_than_11th_floor_number(@building)) || (@building.information_by_floors.where(floor_number_id: 1).present?))
      "#{@equipments[14]}(放送設備)が必要です（#{law(24, 3, 2, nil)}）"
      
    # 消防法施行令第24条第1項
    elsif usege_in?(@building,[9, 16, 17, 18, 19, 23, 26, 27]) && total_capacity(@building) >= 20 && total_capacity(@building) < 50
      "非常警報器具が必要です（#{law(24, 1, nil, nil)}）"

    else
      "#{@equipments[14]}及び器具は必要ありません"
    end
  end

  # 消防法施行令第25条
  def evacuation_tool
    # 消防法施行令第25条第1項第1号
    if usege_in?(@building,[12, 13, 14, 15, 16, 17, 18, 19]) && ((more_thna_2nd_floor_number_and_capacity(@building, 20)) || (basement_floor_number_and_capacity(@building, 20)))
      "#{@equipments[15]}が必要です（#{law(25, 1, 1, nil)}）"

    # 消防法施行令第25条第1項第2号
    elsif usege_in?(@building,[10, 11]) && ((more_thna_2nd_floor_number_and_capacity(@building, 30)) || (basement_floor_number_and_capacity(@building, 30)))
      "#{@equipments[15]}が必要です（#{law(25, 1, 2, nil)}）"

    # 消防法施行令第25条第1項第3号(主要構造部の仕様については考慮せず)
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 20, 21, 22, 23, 24, 25]) && ((more_thna_2nd_floor_number_and_capacity(@building, 50)) || (basement_floor_number_and_capacity(@building, 50)))
      "#{@equipments[15]}が必要です（#{law(25, 1, 3, nil)}）"
    
    # 消防法施行令第25条第1項第4号
    elsif usege_in?(@building,[26, 27, 31]) && ((@building.information_by_floors.where('floor_number_id >= ?', 5).where('windowless_id>=?', 2).where('floor_capacity >=?', 100).present?) || (basement_floor_number_and_capacity(@building, 100)) || (more_thna_2nd_floor_number_and_capacity(@building, 150)))
      "#{@equipments[15]}が必要です（#{law(25, 1, 4, nil)}）"

    # 消防法施行令第25条第1項第5号は避難階及び避難階段が関係するためなし
    else
      "#{@equipments[15]}は必要ありません"
    end
  end

  # 消防法施行令第26条
  def guide_light
    # 消防法施行令第26条第1項第1号、消防法施行令第26条第1項第2号
    if usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23]) 
      "#{@equipments[16]}が必要です（#{law(26, 1, 1, nil)}、#{law(26, 1, 2, nil)}）"

    elsif (usege_in?(@building,[11, 20, 21, 24, 25, 26, 27, 28, 29, 30, 31])) && (@building.information_by_floors.where('floor_number_id <= ?', 3).present?) 
      "地階部分には、#{@equipments[16]}が必要です（#{law(26, 1, 1, nil)}、#{law(26, 1, 2, nil)}）"

    elsif (usege_in?(@building,[11, 20, 21, 24, 25, 26, 27, 28, 29, 30, 31])) && (@building.information_by_floors.where('windowless_id>=?', 2).present?) 
      "無窓階部分には、#{@equipments[16]}が必要です（#{law(26, 1, 1, nil)}、#{law(26, 1, 2, nil)}）"

    elsif (usege_in?(@building,[11, 20, 21, 24, 25, 26, 27, 28, 29, 30, 31])) && (more_than_11th_floor_number(@building))
      "11階以上の部分には、#{@equipments[16]}が必要です（#{law(26, 1, 1, nil)}、#{law(26, 1, 2, nil)}）"
    
    # 消防法施行令第26条第1項第4号
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31])
      "誘導標識が必要です（#{law(26, 1, 4, nil)}）"

    else
      "#{@equipments[16]}は必要ありません"
    end
  end

  private

  def usege_in?(building,*n)
    building.entirety_usege_id.in?(*n)
  end

  def total_area(building,n)
    building.information_by_floors.all.sum(:floor_area) >= n
  end

  def total_capacity(building)
    building.information_by_floors.all.sum(:floor_capacity)
  end

  def basement_floor_number_and_area(building, area)
    building.information_by_floors.where('floor_number_id <= ?', 3).where('floor_area >= ?', area).present?
  end

  def more_than_3rd_floor_number_and_area(building, area)
    building.information_by_floors.where('floor_number_id >= ?', 6).where('floor_area >= ?', area).present?
  end

  def windowless_and_area(building, area)
    building.information_by_floors.where('windowless_id >= ?', 2).where('floor_area >= ?', area).present?
  end

  def more_than_11th_floor_number(building)
    building.information_by_floors.where('floor_number_id >= ?', 14).present?
  end

  def basement_floor_number_and_capacity(building, capacity)
    building.information_by_floors.where('floor_number_id <= ?', 3).where('floor_capacity >= ?', capacity).present?
  end
  def more_thna_2nd_floor_number_and_capacity(building, capacity)
    building.information_by_floors.where('floor_number_id >= ?', 5).where('floor_capacity >= ?', capacity).present?
  end

  def law(article, paragraph, item, number)
    if item == nil
      "消防法施行令第#{article}条第#{paragraph}項"
    else
      "消防法施行令第#{article}条第#{paragraph}項第#{item}号#{number}"
    end
  end
end