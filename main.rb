hand_type = ["グー", "チョキ", "パー"]
face_type = ["上", "下", "左", "右"]
your_choice = {hand: nil, face: nil}
partner_choice = {hand: nil, face: nil}

def get_your_choice(choice_list)
  result = nil
  
  loop {
    begin
      puts choice_list
      choice = gets.chomp.to_s
      
    case choice
    when "0", "1", "2", "3" then
      result = choice.to_i
      break
    end 
    rescue
    end
  }
  
  return result
end

loop {
  puts "じゃんけん..."
  
  loop {
    your_choice[:hand] = get_your_choice("0:(グー)1(チョキ)2(パー)3(戦わない)")
    
    if your_choice[:hand] == 3
      return
    end
    
    if partner_choice[:hand] == nil
      puts "ホイ!"
    else
      puts "ショ!"
    end
    puts your_choice[:hand]
    puts "---------------------"
    puts "あなた:#{hand_type[your_choice[:hand]]}を出しました"
    
    partner_choice[:hand] = rand(3)
    
    puts "相手:#{hand_type[partner_choice[:hand]]}を出しました"
    puts "---------------------"
    
    if your_choice[:hand] == partner_choice[:hand]
      puts "あいこで..."
    else
      break
    end
  }
  
  puts "あっち向いて〜"
  
  your_choice[:face] = get_your_choice("0(上)1(下)2(左)3(右)")
  
  puts "ホイ!"
  puts "---------------------"
  puts "あなた:#{face_type[your_choice[:face]]}"
  
  partner_choice[:face] = rand(4)
  
  puts "相手:#{face_type[partner_choice[:face]]}"

  if your_choice[:face] == partner_choice[:face]
    
    if (((your_choice[:hand] == 0) && (partner_choice[:hand] == 1)) ||
        ((your_choice[:hand] == 1) && (partner_choice[:hand] == 2)) ||
        ((your_choice[:hand] == 2) && (partner_choice[:hand] == 0)))
      winner = "あなた"
    else
      winner = "相手"
    end
    
    puts "#{winner}の勝ち!"
  end
  
  partner_choice[:hand] = nil
}
