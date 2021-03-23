coin = 100

while 1
slotdata = [["","",""],["","",""],["","",""]]
  if coin == 0 then
    puts "コインなくなりました。またお会いしましょう！"
    exit
  end
  puts "コイン残数：#{coin}"

  puts "何枚入れますか？"
  puts "1(10coin),2(30coin),3(50coin),4(やめる)"
  
  coinSelect = gets.to_i
  
  case coinSelect
    when 1
      coinm = 10
    when 2
      coinm = 30
    when 3
      coinm = 50
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
    coin -= coinm
    
  end

  puts "エンターを3回押してください！"
  
  for slot in 0..2 do
    
    puts "-----------------------"
    for cnt in 0..2 do
      slotdata[cnt][slot] = Random.rand(10)
      puts "#{slotdata[cnt][0]}|#{slotdata[cnt][1]}|#{slotdata[cnt][2]}"
    end
    gets
  end
  
  if slotdata[1][0] == slotdata[1][1] && slotdata[1][1] == slotdata[1][2]
    coinm *= 3
    puts "横あたり！"
  elsif (slotdata[0][0] == slotdata[1][1] && slotdata[2][2] == slotdata[1][1]) || (slotdata[0][2] == slotdata[1][1] && slotdata[2][0] == slotdata[1][1])
    coinm *= 2
    puts "斜めあたり！"
  else
    puts "ハズレー"
    coinm = 0
  end
  coin += coinm

end