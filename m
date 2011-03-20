Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1Pqf-0004re-Ey for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 22:07:41 +0100
Received: from f053042114.adsl.alicedsl.de ([78.53.42.114]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q1Pox-0002PB-Ft for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 21:05:55 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D8640EC.6080102@gmail.com>
References: <1299591298.3785.126.camel@mattotaupa>
	<1300205205.4123.6.camel@mattotaupa>
	<AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>
	<1300364903.3950.21.camel@mattotaupa>
	<1300402006.17833.14.camel@mattotaupa>
	<AANLkTi=xe7p694-8-bnGV85H59M-tJvTUnwm6TgCFPZk@mail.gmail.com>
	<1300449625.3830.47.camel@mattotaupa>
	<20110319183329.GA14868@sakrah.homelinux.org>
	<1300583444.7379.1.camel@mattotaupa> <4D85835F.7070002@gmail.com>
	<1300616160.3950.4.camel@mattotaupa>  <4D8640EC.6080102@gmail.com>
Date: Sun, 20 Mar 2011 22:05:54 +0100
Message-ID: <1300655154.3808.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] xfce_session_4.6.{1, 2}: explicitly pass the path of `iceauth`
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
X-List-Received-Date: Sun, 20 Mar 2011 21:07:41 -0000
X-Groupsio-MsgNum: 30452
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bEvJi7j2xuPaT7uEtgr+"

--=-bEvJi7j2xuPaT7uEtgr+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 20.03.2011, 11:01 -0700 schrieb Khem Raj:
> > That it is not a build time dependency and therefore only needed during
> > runtime. I thought the pathes of programs during compile time do not
> > matter since the build host and the host where it gets installed differ
> > when cross compiling.
>=20
> OK I see its a runtime dependency( not compile time/configure time) then=
=20
> its ok but I think we need to have iceauth in RDEPENDS too I think.

Yes, `iceauth` is already included into `RDEPENDS` and I left it there.


Thanks,

Paul

--=-bEvJi7j2xuPaT7uEtgr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2GbCwACgkQPX1aK2wOHVhQiwCfSV/WshaTElZ9mzF4phACrqOx
dIkAn32rFpzRHetaKtcBx5Tyit2KyB68
=ytFO
-----END PGP SIGNATURE-----

--=-bEvJi7j2xuPaT7uEtgr+--
