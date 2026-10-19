require "gosu"

class Game < Gosu::Window
    def initialize

        @screen_size = [640, 480] # @screen_size[0] = x, @screen_size[1] = y, bara så att jag kommer ihåg även fast det är ganska självklart

        super(@screen_size[0], @screen_size[1])
        self.caption = "Dodger"

        @dodger_width = 25      # Kombinera dessa till en array senare (kanske)
        @dodger_height = 25     # Kombinera dessa till en array senare (kanske)
        @dodger_x = @screen_size[0]/2 - @dodger_width/2
        @dodger_y = @screen_size[1]/2 - @dodger_height/2
        @move_spd = 5
        @current_move_spd = @move_spd
        @move_buttons_pressed = 0

        @fireball_width = 15    # Kombinera dessa till en array senare (kanske)
        @fireball_heigth = 15   # Kombinera dessa till en array senare (kanske)
        @fireball_universal_spd = 3
        @fireball_variation_pos = 0     # Hur stor variation ska spawn positionen utanför skärmen ha, högre siffror = mer variation (Kanske tar bort senare)
        @fireball_variation_size = 10    # Hur stor ska storleksvariationen hos elbollarna vara, bas = 15, högre siffror = mer variation
        @fireball_variation_spd = 0     # Hur stor ska hastigetens variation mellan eldbollarna vara, bas = @fireball_universal_spd, högre siffror = mer variation
        @fireballs = []
        
    end

    def spawn_fireball_left_side
        fireball_size = Gosu.random(30 - @fireball_variation_size/2, 30 + @fireball_variation_size/2)
        fireball_pos_x = Gosu.random(@fireball_variation_pos*-1, 0)
        fireball_pos_y = Gosu.random(0, height - @fireball_heigth)
        fireball_spd_x = @fireball_universal_spd
        fireball_spd_y = 0
        deletion_threshold = @screen_size[0] + @fireball_width

        @fireballs << {
            x: fireball_pos_x,
            y: fireball_pos_y,
            spd_x: fireball_spd_x,
            spd_y: fireball_spd_y,
            thresh: deletion_threshold,
            size: fireball_size
        }
    end

    #Funktionen nedan var en testfunktion:
#    def spawn_fireball
#        fireball_pos_x = Gosu.random(0, width - @fireball_width)
#        fireball_pos_y = Gosu.random(0, height - @fireball_heigth)
#        fireball_spd_x = 0
#        fireball_spd_y = 0
#
#        if fireball_pos_x > @screen_size[0] then fireball_spd_x = @fireball_universal_spd*-1 elsif fireball_pos_x < @screen_size[0] then fireball_spd_x = @fireball_universal_spd else fireball_spd_x = 0 end # Denna ger elbollen en hastighet baserat på vilken sida avskärmen eldbollen är på (funkar inte riktigt ännu)
#
#        @fireballs << {
#            x: fireball_pos_x,
#            y: fireball_pos_y,
#            spd_x: fireball_spd_x,
#            spd_y: fireball_spd_y
#        }
#    end

    def update
        (@dodger_x -= @current_move_spd; @move_buttons_pressed += 1) if Gosu.button_down?(Gosu::KB_LEFT)
        (@dodger_x += @current_move_spd; @move_buttons_pressed += 1) if Gosu.button_down?(Gosu::KB_RIGHT)
        (@dodger_y += @current_move_spd; @move_buttons_pressed += 1) if Gosu.button_down?(Gosu::KB_DOWN)
        (@dodger_y -= @current_move_spd; @move_buttons_pressed += 1) if Gosu.button_down?(Gosu::KB_UP)

        #if @dodger_x != width - @dodger_width || @dodger_y != height - @dodger_height  --- Detta kan jag rafinera senare, men tanken är att hastigheten inte ska sänkas ifall dodger är tryckt mot kanten
        if @move_buttons_pressed > 1 then @current_move_spd = @move_spd*0.7071; else @current_move_spd = @move_spd; end #*0.7071 gör att hypotenusan blir samma som jag vill att katetrarna ska vara
        #end

        @move_buttons_pressed = 0

        @dodger_x = @dodger_x.clamp(0, width - @dodger_width)
        @dodger_y = @dodger_y.clamp(0, height - @dodger_height)

        if Gosu.button_down?(Gosu::KB_SPACE)
            spawn_fireball_left_side
        end

        @fireballs.each do |fireball|
            fireball[:x] += fireball[:spd_x]
            fireball[:y] += fireball[:spd_y]
        end

        @fireballs.delete_if do |fireball|
            if fireball[:x] > fireball[:thresh]
                spawn_fireball_left_side
                true
            else
                false
            end
        end
    end

    def draw
        Gosu.draw_rect(@dodger_x, @dodger_y, @dodger_width, @dodger_height, Gosu::Color::BLUE)

        @fireballs.each do |fireball|
            Gosu.draw_rect(fireball[:x], fireball[:y], fireball[:size]/2, fireball[:size]/2, Gosu::Color::RED)
        end
    end
end



Game.new.show