
module View
  def self.welcome_screen
    puts "\e[H\e[2J"
    puts "Welcome to Tire of Prosperity!!!!!"
    puts <<-ASCII


                         MDD88N8MN88Z8D8DNDNN.
                     ONONZOMOOMOOO88888OO8O88O88N
                  8ZZ$M$MMM$NOZZOO8OOZDOZOZZOZ8ZZ8O
                O$77M77O77M$$$ZDONOOOO8DOOOOOOOOOZDN8
               $NI7MMIMMM77Z$MDOOOOONON.:~~~==+?NO8ZNDD
             $IN8Z$I?MIII77NNONOOOOO.:~+ZZ8D+..~=+INOZ8M
            7INO77??M?IIMI$ZOOOOOO=:~O,M$ZMMMD DDO:?7ZZZD
           I?N?IMM?M?M?I$7$DOOOOM,:8.MMMM8?,.?MNN:8D:INOZD
          7?NNZO?MM?????M8ZNOO8M,?  MMMMMN~=MN,+MNMOO~?8OZN
         .I8?+N++M?+D??IZZDOOOM,O    MMMMN.=MMMN.$MD=7I?DONM
         ?NDM7+++NMI+??I$IODOM,$      MMMN+=OMMMM8IMM=7?INZO
        7$D++O++N++8++ZZZNOOO,+.       NMN===MMMMDDMMMDI,7OZ8
        ?++=7M++Z=++++N7NOOOZ:NNI,      NN+==MMMMMMO8MMN?.ZDN
       7?8++D+=M++M++?7$OOOZ,DMM:,.,     M+==MMMMMMZOMM,88IDND
       ??8D+?==N===++?7OOO87:   N7..,=  MM~==MMMMN$Z8+MMN$.O8O
       ?+O=M=8=I=$==+?$ZO8Z,$     7.,,:MMMZ?~:MM+I7ZM?MM+8O$DO
      Z?=++D=MM=~M==+7$8OOO,       Z+,:=OD,D$7,.=I7MMODMMNI+DON
      7?8++8==NM=N==+I$8M8M:       MD7~88O ,=78,.?MMMM=MMNI.8O8
      ID88+I==D==?==?IZOOO$~      .MMNZDZ~::.~D8,MMMMM,MMI$,ODN
      I?MONIM=DM====?7$8OO==      .MMNZ.?=~~:8M7:NMMMM.MM?O:ZOO
      I?8=+I++D7====+N$8OZ:+      MMDD87I?=~:,Z8:.7MMM.MM?8~ZOO
      7I8++INMD+M=++?$$DOZ+=     MM,,:887I+=:,Z8,.I$ZO.MMIO:ZDO
      DI8O+I++D++O++MIZOOOI~ .MI,,,,,:IZ7I?=O:OO.,7$ZO8DM$$,OOM
      Z88ODD++D++M+++8$OOOM:MN?:,,,,MMMZ,O+, MZ,DNNMMNDZMN?.DOD
      87???D?I??+++IMI$OOOZ,MM.      MMD+D8=....NNNMM7$MM8I?D8N
       Z77II???I????DI7O8OZ,I         N8~?7+~~:?NNMMM.MM?ZI$DO
       $7OIIIIIMM?I$M77$8OOM:         DZ~=+ZMO?I$MMM8IMMDI.8NO
       8D87DD7INIDM?8I7$8OOZ,8       .8~~~OO8NOI7MMN.MM=Z$IOOM
       .OZ$$D7N78M7INN$7OOOON~       NO:~8888MDI7MMN?MM8?,O8O
        DZN$$D8NN7DM77O7Z8OO8,+      D,:~888DNN=$O,?MM87.$DDM
         DO8D$$$$N8$$7Z$$88OOO:I    M8::888DNMMDZO?MM,7,ID8N
         .D8OODZZ$OZZ$$M$Z8OO8M:7  MM:,88DNNMMMND8MMNO,I88O=
          ODZ8ONOZNDZDZZZDZD8O8D:+MMMD8DNNMMMMMNMM $D.I8DOM
           NDDD8ODONOOOZZOZON8O88,=DZ$NNND:$=,MM$D8==78NON
            NNNNDO88N88OOOOMOD8OO8N~=O.+?IMMN .ND.=?8DOOM
              NNNNNN8N8D8888DDNDOO88M~=+IZ8Z?==+?IDD8O8D
               MNNNMNNMDN8DDDMDDDO88D8OM~+++??IDO8NONN+
                 MMNMNNNDNNNNNNNDDM88O8N888888DD88DNN
                  .MMMM8NMN8MNNNNMDDNN888OD8ODO8DDN
                     8MNMMMMNMNMMMNDDNND8N8DDNNNM
                          MMMMMMMMMMMMMMMMMNM.
                          ASCII
    puts "Here is your phrase. Guess away..."
  end

  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.show_score_multiplier(score, score_multiplier, category)
    puts "Category - #{category.name}"
    puts "Your score is: #{score}."
    puts "Your multiplier for this round is #{score_multiplier}"
    puts
  end

  def self.tries(letters_tried)
    puts "You've tried: #{letters_tried.join(" ")}"
  end

  def self.show_hidden_phrase(phrase_with_hidden_letters) # stay
    phrase_with_hidden_letters.each do |letter|
      if letter.hidden == true
        print "_"
      else
        print "#{letter.letter}"
      end
    end
    puts
    puts
  end

  def self.ask_for_user_input
    puts "Please guess one letter:"
    print "> "
  end
end
