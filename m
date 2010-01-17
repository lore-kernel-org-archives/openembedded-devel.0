Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWcdt-00032W-Kp for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 22:26:44 +0100
Received: from g225080206.adsl.alicedsl.de ([92.225.80.206]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWcbl-0004Je-Vl for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 21:24:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.1001171511300.7174@localhost>
References: <alpine.LFD.2.00.1001171141210.11393@localhost>
	<hivjon$vmv$1@ger.gmane.org>
	<009501ca97a2$bd9bc940$38d35bc0$@Willis@Distant-earth.com>
	<alpine.LFD.2.00.1001171511300.7174@localhost>
Date: Sun, 17 Jan 2010 22:24:28 +0100
Message-ID: <1263763468.5353.14.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: beagleboard-demo-image, and the evil that is "gnome-games"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jan 2010 21:26:45 -0000
X-Groupsio-MsgNum: 15822
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-afnw19s+JudizXSdlCVQ"

--=-afnw19s+JudizXSdlCVQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 17.01.2010, 15:20 -0500 schrieb Robert P. J. Day:
> On Sun, 17 Jan 2010, John Willis wrote:
>=20
> > I personally don't favour taking packages out of an image if there
> > are build issues on a small subset of systems. I think Phil (or
> > someone else) suggest you consider contributing your build logs to
> > OESTATS/TinderBox
> > (http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success=
_and_
> > failure_reports) at least with that setup you leave a reference the
> > failing logs in bug reports/mails so people can have a look into all
> > the gory details :).
>=20
>   in fact, on friday, i posted to this list that gnome-games was
> broken under my environment, and also left a link to the full log file
> contents here:
>=20
>   http://pastebin.com/mcaa647b
>=20
> so anyone was free to see that.  and so far (unless i'm mistaken), in
> the midst of all the feedback, the one thing i haven't read is anyone
> saying, "hmmmm, you're right, there seems to be a problem."

As far as I know, nobody wrote that you made all this up.

>   for over a month now, i've reported this, i've described my build
> environment in detail, and i've made the contents of the build log
> file publicly available.  at this point, i've given up on this package
> and removed it from my bb-demo-image build because i just don't care
> about it anymore.  if it ever gets fixed, by all means, let me know.
> but please stop whining that i just haven't jumped through enough
> hoops to suit some people.

Sorry Robert, I disagree. Of course I also sent my logs to the list and
I was lucky that someone helped me. But unfortunately it looks like we
are not knowledgeable/smart enough to be able to fix things by
ourselves. No single person on this list owes us something and has to
help us, since they do it out of kindness/free will to help us. We can
always contact a business and pay them get our stuff fixed. Then we can
demand that these payed people fix the problem.

If we do not spent any money, we can only try to ease the live of the
developers as much as possible in using their tools or gather and
condense/edit the available information in such a way, that the
developers do not waste their time doing trivial things.

The developers did not set up a bugtracker without a reason and because
we depend on them we should do as they say. If we want to or not.


Thanks,

Paul

--=-afnw19s+JudizXSdlCVQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktTgAwACgkQPX1aK2wOHVg14ACdGbZSS9YHHGU+NHkUXEZIqxG7
foQAn3V2RubHPhRPu+ywHpFk3qeGXmmJ
=7lOG
-----END PGP SIGNATURE-----

--=-afnw19s+JudizXSdlCVQ--
