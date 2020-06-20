module BuildingsHelper
  # 消防法施行令第10条第1項
  def fire_extinguisher
    # 消防法施行令第10条第1項第1号イ
    if usege_in?(@building,[1, 3, 4, 5, 6, 12, 13, 14, 16, 34, 35, 36, 39])
      "#{@equipments[0]}が必要です（#{law(10, 1, 1, "イ")})"

    # 消防法施行令第10条第1項第1号ロ
    elsif usege_in?(@building,[7, 8]) && @building.fire_use == "有"
      "#{@equipments[0]}が必要です（#{law(10, 1, 1, "ロ")}）"

    # 消防法施行令第10条第1項第2号イ
    elsif total_area(@building,150) && usege_in?(@building,[2, 9, 10, 11, 15, 17, 18, 19, 22, 23, 26, 27, 28, 29, 30])
      "#{@equipments[0]}が必要です（#{law(10, 1, 2, "イ")}）"

    # 消防法施行令第10条第1項第2号ロ
    elsif total_area(@building,150) && usege_in?(@building,[7, 8]) && @building.fire_use == "無"
      "#{@equipments[0]}が必要です（#{law(10, 1, 2, "ロ")}）"

    # 消防法施行令第10条第1項第3号 
    elsif usege_in?(@building,[20, 21, 24, 25, 31]) && total_area(@building,300)
      "#{@equipments[0]}が必要です（#{law(10, 1, 3, nil)}）"

    # 消防法施行令第10条第1項第4号は少量危険物のためなし

    # 消防法施行令第10条第1項第5号
    elsif ((["1", "2", "3"].include?(@building.basement_floor)) && (@building.information_by_basement_floors.where(floor_area: 50..Float::INFINITY).present?)) || (@building.information_by_floors.where(windowless_id: 2, floor_area: 50..Float::INFINITY).present?) || ((@building.entirety_floor >= 3) && (@building.information_by_floors.where(floor_area: 50..Float::INFINITY).present?))
      "#{@equipments[0]}が必要です（#{law(10, 1, 5, nil)}）"

    else
      "#{@equipments[0]}は必要ありません"
    end
  end

  # 消防法施行令第21条
  def automatic_fire_alarm_equipment
    # 消防法施行令第21条第1項第1号イ
    if usege_in?(@building,[6, 10, 12, 13, 14, 16, 29, 36])
      "#{@equipments[10]}が必要です（#{law(21, 1, 1, "イ")}）"

    # 消防法施行令第21条第1項第1号ロ  
    elsif usege_in?(@building,[17])
      "#{@equipments[10]}が必要です（#{law(21, 1, 1, "ロ")}）"

    # 消防法施行令第21条第1項第2号
    elsif usege_in?(@building,[22]) && total_area(@building,200)
      "#{@equipments[10]}が必要です（#{law(21, 1, 2, nil)}）"
    
    # 消防法施行令第21条第1項第3号イ
    elsif total_area(@building,300) && usege_in?(@building,[1, 2, 3, 4, 5, 7, 8, 9, 15, 19, 32, 34])
      "#{@equipments[10]}が必要です（#{law(21, 1, 3, "イ")}）"

    # 消防法施行令第21条第1項第3号ロ
    elsif total_area(@building,300) && usege_in?(@building,[18])
    "#{@equipments[10]}が必要です（#{law(21, 1, 3, "ロ")}）"

    # 消防法施行令第21条第1項第4号
    elsif usege_in?(@building,[11, 20, 21, 23, 24, 26, 27, 28, 30]) && total_area(@building,500)
      "#{@equipments[10]}が必要です（#{law(21, 1, 4, nil)}）"

    # 消防法施行令第21条第1項第5号
    elsif (usege_in?(@building,[35]) && total_area(@building,500)) && ((@building.information_by_basement_floors.where(entirety_usege:[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 22]).all.sum(:floor_area)) >= 300)
      "#{@equipments[10]}が必要です（#{law(21, 1, 5, nil)}）"

    # 消防法施行令第21条第1項第6号
    elsif usege_in?(@building,[25, 31]) && total_area(@building,1000)
      "#{@equipments[10]}が必要です（#{law(21, 1, 6, nil)}）"
    
    # 消防法施行令第21条第1項第7号は避難階段が関係するためなし
    
    # 消防法施行令第21条第1項第8号は指定可燃物関係のためなし
    
    # 消防法施行令第21条第1項第9号イ
    elsif usege_in?(@building,[34]) && @building.information_by_basement_floors.where(entirety_usege:[6, 10, 12, 13, 14, 16]).present?
      "2項ニ,5項イ,6項イ(1)から(3),6項ロの部分には#{@equipments[10]}が必要です（#{law(21, 1, 9, "イ")}）"
    
    # 消防法施行令第21条第1項第9号ロ
    elsif usege_in?(@building,[34]) && @building.information_by_basement_floors.where(entirety_usege:[17]).present?
      "6項ハ(入居または宿泊なし)の部分には#{@equipments[10]}が必要です（#{law(21, 1, 9, "ロ")}）"

    # 消防法施行令第21条第1項第10号
    elsif (usege_in?(@building,[3, 4, 5, 7, 8]) && (((@building.basement_floor.include?("1"||"2"||"3")) && (@building.information_by_basement_floors.where(floor_area: 100..Float::INFINITY).present?)) || (@building.information_by_floors.where(windowless_id: 2, floor_area: 100..Float::INFINITY).present?))) || (usege_in?(@building,[32]) && ((@building.information_by_basement_floors.where(entirety_usege:[3, 4, 5, 6, 7, 8],floor_area: 100..Float::INFINITY).present?) || (@building.information_by_floors.where(entirety_usege:[3, 4, 5, 6, 7, 8], windowless_id: 2, floor_area: 100..Float::INFINITY).present?)))
      "#{@equipments[10]}が必要です（#{law(21, 1, 10, nil)}）"

    # 消防法施行令第21条第1項第11号
    elsif (@building.information_by_basement_floors.where(floor_area: 300..Float::INFINITY).present?) || (@building.information_by_floors.where(windowless_id: 2, floor_area: 300..Float::INFINITY).present?)
      "#{@equipments[10]}が必要です（#{law(21, 1, 11, nil)}）"
    
    # 消防法施行令第21条第1項第12号は道路のように供される部分が関係するためなし
    
    # 消防法施行令第21条第1項第13号は駐車のように供される部分が関係するためなし
    
    # 消防法施行令第21条第1項第14号
    elsif @building.entirety_floor >= 11
      "11階以上の部分に#{@equipments[10]}が必要です（#{law(21, 1, 14, nil)}）"
    
    # 消防法施行令第21条第1項第15号は通信機器室が関係するためなし

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
    elsif (usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 22]) && total_capacity(@building) >= 300) || (usege_in?(@building,[11, 20, 21]) && total_capacity(@building) >= 800)
      "#{@equipments[14]}(放送設備)が必要です（#{law(24, 3, 4, nil)}）"
      
    # 消防法施行令第24条第2項第1号
    elsif automatic_fire_alarm_equipment.include?("#{@equipments[10]}が必要です")
      "#{@equipments[14]}は必要ありません（#{law(24, 2, 1, nil)}）"
    elsif usege_in?(@building,[10, 12, 13, 14, 15, 22]) && total_capacity(@building) >=20
      "#{@equipments[14]}が必要です（#{law(24, 2, 1, nil)}）"

    # 消防法施行令第24条第3項第3号
    elsif usege_in?(@building,[32]) && total_capacity(@building) >= 500
      "#{@equipments[14]}(放送設備)が必要です（#{law(24, 3, 3, nil)}）"
    
    # 消防法施行令第24条第2項第2号
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36]) && ((total_capacity(@building) >= 50) || ((@building.information_by_basement_floors.where(floor_capacity: 20..Float::INFINITY).present?) || (@building.information_by_floors.where(windowless_id: 2, floor_capacity: 20..Float::INFINITY).present?)))
      "#{@equipments[14]}が必要です（#{law(24, 2, 2, nil)}）"

    # 消防法施行令第24条第3項第1号
    elsif usege_in?(@building,[34, 35])
      "#{@equipments[14]}が必要です（#{law(24, 3, 1, nil)}）"
    
    # 消防法施行令第24条第3項第2号
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 36, 37, 38, 39]) && ((@building.entirety_floor >= 11) || (@building.information_by_basement_floors.where(floor_number: 3..Float::INFINITY).present?))
      "#{@equipments[14]}(放送設備)が必要です（#{law(24, 3, 2, nil)}）"
      
    # 消防法施行令第24条第1項
    elsif usege_in?(@building,[9, 16, 17, 18, 19, 23, 26, 27]) && total_capacity(@building) >= 20 && total_capacity(@building) < 50
      "非常警報器具が必要です（#{law(24, 1, nil: nil)}）"

    else
      "#{@equipments[14]}及び器具は必要ありません"
    end
  end

  # 消防法施行令第25条
  def evacuation_tool
    # 消防法施行令第25条第1項第1号
    if usege_in?(@building,[12, 13, 14, 15, 16, 17, 18, 19]) && ((@building.information_by_floors.where(floor_number: 2..Float::INFINITY, floor_capacity: 20..Float::INFINITY).present?) || (@building.information_by_basement_floors.where(floor_capacity: 20..Float::INFINITY).present?))
      "#{@equipments[15]}が必要です（#{law(25, 1, 1, nil)}）"

    # 消防法施行令第25条第1項第2号
    elsif usege_in?(@building,[10, 11]) && ((@building.information_by_floors.where(floor_number: 2..Float::INFINITY, floor_capacity: 30..Float::INFINITY).present?) || (@building.information_by_basement_floors.where(floor_capacity: 30..Float::INFINITY).present?))
      "#{@equipments[15]}が必要です（#{law(25, 1, 2, nil)}）"

    # 消防法施行令第25条第1項第3号(主要構造部の仕様については考慮せず)
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 20, 21, 22, 23, 24, 25]) && ((@building.information_by_floors.where(floor_number: 2..Float::INFINITY, floor_capacity: 50..Float::INFINITY).present?) || (@building.information_by_basement_floors.where(floor_capacity: 50..Float::INFINITY).present?))
      "#{@equipments[15]}が必要です（#{law(25, 1, 3, nil)}）"
    
    # 消防法施行令第25条第1項第4号
    elsif usege_in?(@building,[26, 27, 31]) && ((@building.information_by_floors.where(floor_number: 3..Float::INFINITY, windowless_id: 2, floor_capacity: 100..Float::INFINITY).present?) || (@building.information_by_basement_floors.where(floor_capacity: 100..Float::INFINITY).present?) || (@building.information_by_floors.where(floor_number: 3..Float::INFINITY, windowless_id: 1, floor_capacity: 150..Float::INFINITY).present?))
      "#{@equipments[15]}が必要です（#{law(25, 1, 4, nil)}）"

    # 消防法施行令第25条第1項第5号は避難階及び避難階段が関係するためなし
    else
      "#{@equipments[15]}は必要ありません"
    end
  end

  # 消防法施行令第26条
  def guide_light
    # 消防法施行令第26条第1項第1号、消防法施行令第26条第1項第2号
    if usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 32, 34, 35]) || ((usege_in?(@building,[11, 20, 21, 24, 25, 26, 27, 28, 29, 30, 31, 33])) && ((@building.information_by_basement_floors.present?) || (@building.information_by_floors.where(windowless_id: 2).present?) || (@building.information_by_floors.where(floor_number: 11..Float::INFINITY).present?)))
      "#{@equipments[16]}が必要です（#{law(26, 1, 1, nil)}、#{law(26, 1, 2, nil)}）"
    
    # 消防法施行令第26条第1項第4号
    elsif usege_in?(@building,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33])
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
    building.total_area >= n
  end

  def total_capacity(building)
    building.total_capacity
  end

  

  def law(article, paragraph, item, number)
    "消防法施行令第#{article}条第#{paragraph}項第#{item}号#{number}"
  end
end