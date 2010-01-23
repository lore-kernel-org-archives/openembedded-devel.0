Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYdJa-0005iu-3B for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:34:05 +0100
Received: from f053033135.adsl.alicedsl.de ([78.53.33.135]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYdHN-0007xn-Fy for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:31:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hhvu64$40s$1@ger.gmane.org>
References: <1262697583.3209.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<hhvu64$40s$1@ger.gmane.org>
Date: Sat, 23 Jan 2010 11:31:43 +0100
Message-ID: <1264242703.3630.18.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/1] Update unavailable whois 4.5.25 to available version 4.7.30.
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
X-List-Received-Date: Sat, 23 Jan 2010 10:34:05 -0000
X-Groupsio-MsgNum: 16072
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-8zgnHEAHdmm0F1y5hJIw"

--=-8zgnHEAHdmm0F1y5hJIw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 05.01.2010, 18:50 +0100 schrieb Rolf Leggewie:
> Paul Menzel wrote:
> > I noticed that whois cannot be build since the sources are not availabl=
e
> > anymore.
>=20
> Thank you for informing us of the problem.  I have published the sources
> for whois on the OE sources mirror now.  I think that is the preferred
> solution.

A late thank you.

Just for the record. Khem Raj wrote and committed a recipe for version
5.0.0 [1].


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D310b2cd=
8919a13280b445537893c109b66c5275c

--=-8zgnHEAHdmm0F1y5hJIw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkta0A8ACgkQPX1aK2wOHVjmHQCZAWL9AFg2YLHqrzVStLdNYSpL
7dQAnial93p60ECb3NuRqRuQuReO6jdc
=yqEM
-----END PGP SIGNATURE-----

--=-8zgnHEAHdmm0F1y5hJIw--
