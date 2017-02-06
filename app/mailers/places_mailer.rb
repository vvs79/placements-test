class PlacesMailer < ApplicationMailer

  def place_created(place, user)
    @place = place
    mail to: user.email, subject: "Place created"
    mail to: 'vidoc1979@gmail.com', subject: "Place created"
  end

end
