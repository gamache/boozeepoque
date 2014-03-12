require 'pp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @event_inquiry = EventInquiry.new
    @contact = Contact.new
    #@photos = %w( babeation.jpg julep.jpg smokinboles.jpg
                  #battedlashes.jpg kitchensurfing.jpg solsticepunch.jpg
                  #bloodorangedrink.jpg launchharmpour.jpg starsatnight.jpg
                  #bostondotcomdrink.jpg lingosmenu.jpg strawberryholly.jpg
                  #cognaccompharm.jpg lingossetup.jpg swaneebday.jpg
                  #cognaccompmeg.jpg manhattan.jpg swirlandslice.jpg
                  #donjuliocomp.jpg milowsky.jpg tableandtulipmh.jpg
                  #equinoxpunch.jpg mojitos.jpg tikinight.png
                  #equinoxpunch2.jpg molassesrocker.jpg tomwaitsdrink.jpg
                  #freshmint.jpg morninggloryfarm.jpg tools.jpg
                  #grapefruitpunch.jpg noreaster.jpg ttginpour.jpg
                  #haireparty.jpg peachykeen.jpg ttinvite.jpg
                  #halloween.jpg picklebacktoast.jpg ttmenu.png
                  #harmcognac.jpg porchdrink.jpg virginwatermelon.jpg
                  #herbgarden.jpg robertsshower.jpg watermelonmarg.jpg
                  #hoedown.jpg singriaandlemonade.jpg
                  #hoedownmenu.jpg slutcrackersweet.jpg )
    @photos = %w(
      1013078_511275678945792_460605884_n.jpg
      1013854_623380264401999_1288627179_n.jpg
      1150221_538456299561063_362271637_n.jpg
      12109_623380227735336_412150245_n.jpg
      1272405_561158260624200_1957603282_o.jpg
      1375022_625618980844794_926235692_n.jpg
      1424492_586170844789608_1683608219_n.jpg
      1477523_598565300216829_248144220_n.jpg
      1497630_611101525629873_927923715_n.jpg
      15076_487194601353900_1911926963_n.jpg
      1520647_606372109436148_726868335_n.jpg
      1555404_608219305918095_821195689_n.jpg
      1555542_608218505918175_531529446_n.jpg
      1557510_608218479251511_794938685_n.jpg
      1625598_627898393950186_1113380205_n.jpg
      1662646_626397540766938_721008932_n.jpg
      1782109_623380194402006_1660700737_n.jpg
      1794569_622956124444413_1496286419_n.jpg
      23358_525837057489654_313384653_n.jpg
      543912_479701255436568_866929137_n.jpg
      564480_477649022308458_1424931304_n.jpg
      577251_533724656700894_1530559543_n.jpg
      644142_561967670543259_185152027_n.jpg
      75934_623380147735344_1531112212_n.jpg
      855_500830713323622_1753682541_n.jpg
      946064_590574004349292_768531422_n.jpg
      971065_498272836912743_1972106414_n.jpg
      998525_514222188651141_595959324_n.jpg
      NationalMargaritaDay.jpg
    )
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
