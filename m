Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NLyaX-00089e-3B for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 13:39:16 +0100
Received: from g229061088.adsl.alicedsl.de ([92.229.61.88]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NLyYn-000350-LS for openembedded-devel@lists.openembedded.org;
	Sat, 19 Dec 2009 12:37:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0912171402080.2265@localhost>
References: <alpine.LFD.2.00.0912171137010.30166@localhost>
	<4B2A77E5.1040804@balister.org>
	<alpine.LFD.2.00.0912171402080.2265@localhost>
Date: Sat, 19 Dec 2009 13:37:40 +0100
Message-ID: <1261226260.10861.20.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: should i submit detailed bugs for e2fsprogs and gnome-games?
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
X-List-Received-Date: Sat, 19 Dec 2009 12:39:16 -0000
X-Groupsio-MsgNum: 15130
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vNvOhi10KOm+og6O+/uj"

--=-vNvOhi10KOm+og6O+/uj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 17.12.2009, 14:02 -0500 schrieb Robert P. J. Day:
> On Thu, 17 Dec 2009, Philip Balister wrote:
>=20
> > I saw the gnome-games problem. Steve says he has a later version in
> > his repo, when he figure out some other things we hope that update
> > solves the problem.
>=20
>   but the e2fsprogs build problem is all mine, is it?  *sigh*.  i'll
> see what i can figure out.

Sorry, bad news for you Robert. My `bitbake beagleboard-demo-image` was
successful with a030c6b8e12445a266a8673efe589375baf93ccc (with local
commit to build Abiword without plugins) on a Debian Sid/unstable
system.


Good luck with your search. Bests,

Paul

--=-vNvOhi10KOm+og6O+/uj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkssyRQACgkQPX1aK2wOHVhJUgCfTuixumJTO/99gdfxtWEiu8fe
AP8An0xpbYD2BIRvMUtow4WEO7hrskuv
=i/3S
-----END PGP SIGNATURE-----

--=-vNvOhi10KOm+og6O+/uj--
