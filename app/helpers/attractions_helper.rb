module AttractionsHelper
    def attr_name_label(user)
        if user.admin
            "Show "
        else
            "Go on "
        end
    end
end
