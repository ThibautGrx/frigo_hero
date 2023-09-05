class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def voice
    items = Item.near(params[:Body])
    phone_number = params[:From]
    message = generate_message(items)
    TwilioService.send_message(phone_number, message)
  end

  private

    def generate_message(items)
      items_count = items.length
      items_selected = items.first(2)
      if items_selected.count.positive?
        result = items.map.with_index do |item, index|
          "#{index + 1}/#{item.description}/#{item.place}/#{item.user.phone}"
        end
        "#{items_count} Résultats, dont: #{result} Frigohero"
      else
        "Aucun produit ne se trouve à proximité, veuillez indiquer une autre adresse. Frigohero"
      end
    end
end
