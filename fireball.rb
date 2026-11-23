class Fireball
    def initialize(dodger_x, dodger_y)
        @width = 15    # Kombinera dessa till en array senare (kanske)
        @height = 15   # Kombinera dessa till en array senare (kanske)
        
        warning(dodger_x, dodger_y)
        
        #variation_pos = 0     # Hur stor variation ska spawn positionen utanför skärmen ha, högre siffror = mer variation (Kanske tar bort senare)
        #variation_size = 10    # Hur stor ska storleksvariationen hos elbollarna vara, bas = 15, högre siffror = mer variation
        #variation_spd = 0     # Hur stor ska hastigetens variation mellan eldbollarna vara, bas = @fireball_universal_spd, högre siffror = mer variation
    end

    def warning(dodger_x, dodger_y)
        @warning_height = 20
        @warning_width = 20

        angle = Gosu.random(0,2 * Math::PI)
        radius = 100

        @warning_pos_x = dodger_x + Math.cos(angle) * radius
        @warning_pos_y = dodger_y + Math.sin(angle) * radius
        
        randomize_spawn(dodger_x, dodger_y, angle)
    end

    def randomize_spawn(dodger_x, dodger_y, angle)
        radius = 450
        @pos_x = dodger_x + Math.cos(angle) * radius
        @pos_y = dodger_y + Math.sin(angle) * radius
        @spd_x = Math.cos(angle) * -10
        @spd_y = Math.sin(angle) * -10
    end

    

    #def randomize_spawn
    #    @pos_x = 0
    #    @pos_y = Gosu.random(460, 20)
    #    @spd_x = Gosu.random(3,6)
    #    @spd_y = 0
    #end

    def update
        @pos_x += @spd_x
        @pos_y += @spd_y

        
    end

    def draw
        Gosu.draw_rect(@pos_x, @pos_y, @width/2, @height/2, Gosu::Color::RED)
        Gosu.draw_rect(@warning_pos_x, @warning_pos_y, @warning_width/2, @warning_height/2, Gosu::Color::RED)
    end
    
end