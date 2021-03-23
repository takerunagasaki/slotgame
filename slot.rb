coin = 100
point = 0
#slotdata = [["","",""],["","",""],["","",""]]
while 1
slotdata = [["","",""],["","",""],["","",""]]
  if coin == 0 then
    puts "コインなくなりました。またお会いしましょう！"
    exit
  end
  puts "コイン残数：#{coin}"
  # puts "ポイント：#{point}"
  puts "何枚入れますか？"
  puts "1(10coin),2(30coin),3(50coin),4(やめる)"
  
  coinSelect = gets.to_i
  
  case coinSelect
    when 1
      coinm = 10
      #pointp = 250
    when 2
      coinm = 30
      #pointp = 150
    when 3
      coinm = 50
      #pointp = 50
    when 4
      exit
    else
      puts "1~4を選択してください"
      redo
  end
  
  if coin - coinm < 0 then
    puts "コインが足りません！"
    puts "持っているコインで遊びましょう！"
    redo
  else
    #point += pointp
    coin -= coinm
    
  end

  puts "エンターを3回押してください！"
  
  for slot in 0..2 do
    
    # nums = [*0..9] # 1~1000の数字の配列
    # for nDelet in 0..2 do
    #   nums.count.times do |t|
    #     slotdata[nDelet][slot] = nums.delete_at(rand(nums.count)) # array_numsからランダムに一つ値が削除されるため一度出力した値が出力されない
    #   end
    # end
    puts "-----------------------"
    for cnt in 0..2 do
      slotdata[cnt][slot] = Random.rand(10)
      # slotdata = [[7,3,6],[5,7,3],[4,6,7]]  #テストデータ斜めあたり　左上斜め
       slotdata = [[4,3,5],[8,5,3],[5,6,7]]  #テストデータ斜めあたり　右上斜め
      #slotdata = [[7,3,6],[8,8,8],[4,5,7]]  #テストデータ横あたり

      puts "#{slotdata[cnt][0]}|#{slotdata[cnt][1]}|#{slotdata[cnt][2]}"
    end
    
    gets
    
  end
  
  if slotdata[1][0] == slotdata[1][1] && slotdata[1][1] == slotdata[1][2]
    coinm *= 3
    puts "横あたり！"
  elsif (slotdata[0][0] == slotdata[1][1] && slotdata[2][2]) || (slotdata[0][2] == slotdata[1][1] && slotdata[2][0])
    coinm *= 2
    puts "斜めあたり！"
  else
    puts "ハズレー"
    coinm = 0
  end
  coin += coinm

end