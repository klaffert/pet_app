class ApplicationController < ActionController::API

    def encode_token(payload)
        JWT.encode(payload, "dbioearkldnboiasdjkfasboidfubasdogkla;srmhsogixdfzx'pofk*#&%$#*(&Djgdklgjdfskgjsie3")
    end

end
