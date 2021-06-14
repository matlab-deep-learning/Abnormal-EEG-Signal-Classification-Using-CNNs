classdef identityLayer < nnet.layer.Layer

    properties
        % (Optional) Layer properties.

        % Layer properties go here.
    end

    properties (Learnable)
        % (Optional) Layer learnable parameters.

        % Layer learnable parameters go here.
    end
    
    methods
        function layer = identityLayer(name)
            layer.Name = name;
            layer.Description = 'Identity';

        end
       function Z = predict(~, X)
            Z = X;
       end
    end
end
