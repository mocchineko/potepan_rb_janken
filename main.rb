    JANKEN_COMMANDS = [
        {
            name: "グー",
            win_hand: 1,
            lose_hand: 2,
        },
        {
            name: "チョキ",
            win_hand: 2,
            lose_hand: 0,
        },
        {
            name: "パー",
            win_hand: 0,
            lose_hand: 1,
        },
    ]
    HOI_COMMAND_NAMES = [
        "上",
        "下",
        "右",
        "左",
    ]
    RESULT_MESSAGES = {
        win: "勝った！",
        lose: "負けた...",
        draw: "引き分け",
    }

    def play
        while(true) #勝敗がつくまで永遠にループする
           janken_result = janken(false)
           hoi_result = hoi(janken_result)
           break if hoi_result != :draw
        end
    end

    def janken(is_aiko)
        puts is_aiko ? "\nあいこで..." : "\nじゃんけん..."
        puts "0(グー)1(チョキ)2(パー)3(戦わない)"

        my_hand = gets.chomp.to_i
        exit if my_hand == 3

        enemy_hand = rand(0..2)

        my_command = JANKEN_COMMANDS[my_hand]
        result = get_janken_result(my_command, enemy_hand)

        puts is_aiko ? "\nショ!" : "\nホイ!"
        puts "------------------------"
        puts "あなた: #{my_command[:name]}を出しました"
        puts "相手: #{JANKEN_COMMANDS[enemy_hand][:name]}を出しました"
        puts "------------------------"
        
        return janken(true) if result == :draw
        result
    end

    def get_janken_result(my_command, enemy_hand)
        case enemy_hand
        when my_command[:win_hand]
            return :win
        when my_command[:lose_hand]
            return :lose
        else 
            :draw
        end
    end

    def hoi(janken_result)
        puts "\nあっち向いて〜"
        puts "0(上)1(下)2(右)3(左)"

        my_hand = gets.chomp.to_i
        enemy_hand = rand(0..3)

        result = :draw
        if my_hand == enemy_hand
            result = janken_result == :win ? :win : :lose
        end

        puts "\nホイ!"
        puts "------------------------"
        puts "あなた: #{HOI_COMMAND_NAMES[my_hand]}を出しました"
        puts "相手: #{HOI_COMMAND_NAMES[enemy_hand]}を出しました"
        puts "#{RESULT_MESSAGES[result]}"
        puts "------------------------"

        result
    end

    play()