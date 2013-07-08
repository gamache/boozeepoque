require 'pp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @event_inquiry = EventInquiry.new
    @contact = Contact.new
    @photos = %w( babeation.jpg julep.jpg smokinboles.jpg
                  battedlashes.jpg kitchensurfing.jpg solsticepunch.jpg
                  bloodorangedrink.jpg launchharmpour.jpg starsatnight.jpg
                  bostondotcomdrink.jpg lingosmenu.jpg strawberryholly.jpg
                  cognaccompharm.jpg lingossetup.jpg swaneebday.jpg
                  cognaccompmeg.jpg manhattan.jpg swirlandslice.jpg
                  donjuliocomp.jpg milowsky.jpg tableandtulipmh.jpg
                  equinoxpunch.jpg mojitos.jpg tikinight.png
                  equinoxpunch2.jpg molassesrocker.jpg tomwaitsdrink.jpg
                  freshmint.jpg morninggloryfarm.jpg tools.jpg
                  grapefruitpunch.jpg noreaster.jpg ttginpour.jpg
                  haireparty.jpg peachykeen.jpg ttinvite.jpg
                  halloween.jpg picklebacktoast.jpg ttmenu.png
                  harmcognac.jpg porchdrink.jpg virginwatermelon.jpg
                  herbgarden.jpg robertsshower.jpg watermelonmarg.jpg
                  hoedown.jpg singriaandlemonade.jpg
                  hoedownmenu.jpg slutcrackersweet.jpg )
  end

  def event_inquiry
    @inq = EventInquiry.create(event_inquiry_params)
    Notifier.event_inquiry(@inq).deliver
    respond_to do |format|
      format.html {redirect_to '/'}
      format.json {render json: @inq, status: 201}
    end
  end

  def contact
    @contact = Contact.create(contact_params)
    respond_to do |format|
      format.html {redirect_to '/'}
      format.json {render json: @contact, status: 201}
    end
  end

private

  def event_inquiry_params
    params.require(:event_inquiry).permit(EventInquiry::PARAMS)
  end

  def contact_params
    params.require(:contact).permit(Contact::PARAMS)
  end

end
