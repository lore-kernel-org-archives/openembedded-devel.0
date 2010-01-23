Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYnZi-0005pA-8u for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 22:31:25 +0100
Received: from e178248110.adsl.alicedsl.de ([85.178.248.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYnXV-0004ny-T4 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 21:29:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1264265620.32767.19.camel@mattotaupa.wohnung.familie-menzel.net>
References: <201001230943.24210.holger+oe@freyther.de>
	<201001231056.17675.holger+oe@freyther.de>
	<1264258385.21187.29.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001231746.01739.holger+oe@freyther.de>
	<1264265620.32767.19.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Sat, 23 Jan 2010 22:29:03 +0100
Message-ID: <1264282143.3738.155.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: pwclient
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
X-List-Received-Date: Sat, 23 Jan 2010 21:31:25 -0000
X-Groupsio-MsgNum: 16122
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Tm38GVdyg/BV7NN1kXBA"

--=-Tm38GVdyg/BV7NN1kXBA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.01.2010, 17:53 +0100 schrieb Paul Menzel:
> Am Samstag, den 23.01.2010, 17:46 +0100 schrieb Holger Hans Peter Freythe=
r:
> > On Saturday 23 January 2010 15:53:05 Paul Menzel wrote:
> > > Dear Holger,
> >=20
> > > > I also have a new version of the
> > > > program I use attached... I will probably switch it to use pwclient=
 in
> > > > the future.
> > >=20
> > > Thank you for your effort and bringing up `pwclient`. It is so sad, t=
hat
> > > there exists a lot of tools and stuff one does not know about which
> > > could safe work and time for oneself. I wonder why others projects di=
d
> > > not face the same problems yet. Probably every project or developers
> > > wrote her/his own scripts (as OE did with `pw-am.sh`) and everyone
> > > reinvents the wheel.
> >=20
> > Well, I remembered that pwclient exists, so I went to the patchwork web=
site at=20
> > ozlabs.org but I could not find any reference to the tools (or the XML =
RPC=20
> > API). It was just a matter that writing my version was faster than the =
time I=20
> > would have to spent searching... :(.
>=20
> It seems to be available at [1] and in the Patchwork Git repository
> under `apps/patchwork/bin`.

I failed the first time trying to compose the help by myself, but
reading and trying [1] you find `pwclient` under the =C2=BBproject info=C2=
=AB page
[2] at the bottom [3] directly in our installation. There you can
download the configuration file [4] too.

> > I will probably give up on my version and now look into pw-am.sh.
>=20
> If the only problem was that you could not find `pwclient` I hope we can
> improve `pwclient`.


Thanks,

Paul

> [1] http://patchwork.ozlabs.org/help/pwclient/
[2] http://patchwork.openembedded.org/project/openembedded/
[3] http://patchwork.openembedded.org/help/pwclient/
[4] http://patchwork.openembedded.org/project/openembedded/pwclientrc/

--=-Tm38GVdyg/BV7NN1kXBA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktbah8ACgkQPX1aK2wOHVihtQCfdVGln6yxUZTZMRehf+DT7MyQ
82AAn3RldKRrNDAePyasVNog6pRqHZ5k
=0t53
-----END PGP SIGNATURE-----

--=-Tm38GVdyg/BV7NN1kXBA--
