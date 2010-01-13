Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NV160-00075x-Va for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 12:09:07 +0100
Received: from f053038039.adsl.alicedsl.de ([78.53.38.39]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NV13w-0002wS-Uc for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 11:06:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hik8s9$iop$1@ger.gmane.org>
References: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100110123923.GB6363@rhein.zuhause.netz>
	<1263156477.3423.6.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263249767.3308.236.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263296160.20557.136.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100113102738.GA15906@gmail.com>
	<1263379487.3228.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<hik8s9$iop$1@ger.gmane.org>
Date: Wed, 13 Jan 2010 12:06:54 +0100
Message-ID: <1263380814.3228.27.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [vdr] TARGET_CXXFLAGS do not include CXX_FLAGS from Makefile
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
X-List-Received-Date: Wed, 13 Jan 2010 11:09:08 -0000
X-Groupsio-MsgNum: 15643
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-haHp4NvT1f8UGW9ud68J"

--=-haHp4NvT1f8UGW9ud68J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 13.01.2010, 11:56 +0100 schrieb Koen Kooi:
> On 13-01-10 11:44, Paul Menzel wrote:
>=20
> > I did not define any CXXFLAGS. It looks like BitBake is setting them
> and
> > not respecting those in the Makefile.
>=20
> In 99.99% of the cases OE knows a while lot better which flags to
> use :)
> If upstream has the need for a specific flag, they should append it to
> CXXFLAGS in the makefile, not redefine CXXFLAGS.

Thanks for your answer. Now I know, what to tell.


Thanks,

Paul

--=-haHp4NvT1f8UGW9ud68J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktNqU4ACgkQPX1aK2wOHVgoQQCfeR31Cp1beLXEnOLr4/8VCaIh
oJMAoIPX6kKf/K01F66KPnLf1+xQ0L24
=qk61
-----END PGP SIGNATURE-----

--=-haHp4NvT1f8UGW9ud68J--
