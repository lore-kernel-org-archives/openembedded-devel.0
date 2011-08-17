Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qtdql-0005r5-2a for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 12:59:55 +0200
Received: from f053037177.adsl.alicedsl.de ([78.53.37.177]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QtdmO-00042R-3I for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 10:55:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <j2fqml$jor$4@dough.gmane.org>
References: <1313556715-28652-1-git-send-email-pespin.shar@gmail.com>
	<j2fqml$jor$4@dough.gmane.org>
Date: Wed, 17 Aug 2011 12:55:17 +0200
Message-ID: <1313578517.10573.101.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/2] lightmediascanner: added recipe for v0.4.3
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
X-List-Received-Date: Wed, 17 Aug 2011 10:59:55 -0000
X-Groupsio-MsgNum: 33666
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GV8wG+fmt+sk8BH2cnAy"

--=-GV8wG+fmt+sk8BH2cnAy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 17.08.2011, 09:30 +0200 schrieb Koen Kooi:

> Op 17-08-11 06:51, Pau Espin Pedrol schreef:
> > Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com> --- .../recipes=
-efl/e17/lightmediascanner_0.4.3.0.bb   |   29 ++++++++++++++++++++ 1 files=
 changed, 29 insertions(+), 0 deletions(-) create mode 100644 meta-efl/reci=
pes-efl/e17/lightmediascanner_0.4.3.0.bb
> >=20
> > diff --git a/meta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb b/me=
ta-efl/recipes-efl/e17/lightmediascanner_0.4.3.0.bb new file mode 100644 in=
dex 0000000..dd0b283 --- /dev/null +++ b/meta-efl/recipes-efl/e17/lightmedi=
ascanner_0.4.3.0.bb @@ -0,0 +1,29 @@ +DESCRIPTION =3D "Lightweight media
> > scanner meant to be used in not-so-powerful devices" +SECTION =3D "libs=
/multimedia" +AUTHOR =3D "Profusion"
>=20
> Maybe profusion.mobi might be clearer

According to their contact page the correct spelling is ProFUSION
[1][2].

[=E2=80=A6]


Thanks,

Paul


PS: Koen, somehow some of your messages seem to remove line breaks in
the citation.


[1] http://profusion.mobi/contact
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D29c4f7b=
7a2d5ff06e3c6573f9da2ac0e68800c06

--=-GV8wG+fmt+sk8BH2cnAy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5LnhUACgkQPX1aK2wOHVgehwCeNhsPH1/fTPuPuII6Qz1uEJPC
x1YAnAz4Kb6ofESUFIQOpckcVFkG73km
=UwzZ
-----END PGP SIGNATURE-----

--=-GV8wG+fmt+sk8BH2cnAy--
