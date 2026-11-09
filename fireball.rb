class Fireballs
    def initialize
        
    @fireball_width = 15    # Kombinera dessa till en array senare (kanske)
    @fireball_heigth = 15   # Kombinera dessa till en array senare (kanske)
    @fireball_universal_spd = 3
    @fireball_variation_pos = 0     # Hur stor variation ska spawn positionen utanför skärmen ha, högre siffror = mer variation (Kanske tar bort senare)
    @fireball_variation_size = 10    # Hur stor ska storleksvariationen hos elbollarna vara, bas = 15, högre siffror = mer variation
    @fireball_variation_spd = 0     # Hur stor ska hastigetens variation mellan eldbollarna vara, bas = @fireball_universal_spd, högre siffror = mer variation
    @fireballs = []

    end
    
end