module UsersHelper
    def festival_id_field(guest)
      if guest.festival.nil?
        select_tag "user[festival_id]", options_from_collection_for_select(Festival.all, :id, :name)
      else
        hidden_field_tag "user[festival_id]", user.festival_id
      end
    end
  end