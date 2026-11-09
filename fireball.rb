class Fireball
    def initialize
        @width = 15    # Kombinera dessa till en array senare (kanske)
        @height = 15   # Kombinera dessa till en array senare (kanske)
        
        randomize_spawn
        
        #variation_pos = 0     # Hur stor variation ska spawn positionen utanför skärmen ha, högre siffror = mer variation (Kanske tar bort senare)
        #variation_size = 10    # Hur stor ska storleksvariationen hos elbollarna vara, bas = 15, högre siffror = mer variation
        #variation_spd = 0     # Hur stor ska hastigetens variation mellan eldbollarna vara, bas = @fireball_universal_spd, högre siffror = mer variation
    end

    def randomize_spawn
        @pos_x = 0
        @pos_y = 50
        @spd_x = 3
        @spd_y = 3
       
    end

    def update
        @pos_x += @spd_x
        @pos_y += @spd_y

    end

    def draw
        Gosu.draw_rect(@pos_x, @pos_y, @width/2, @height/2, Gosu::Color::RED)
    end
    
end