module GuestsHelper
    def festival_id_field(guest)
      if guest.festival.nil?
        select_tag "guest[festival_id]", options_from_collection_for_select(Festival.all, :id, :name)
      else
        hidden_field_tag "guest[festival_id]", guest.festival_id
      end
    end
  end