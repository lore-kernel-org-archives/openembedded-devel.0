Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QyhlK-00048Z-FV for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 12:11:14 +0200
Received: from f053046058.adsl.alicedsl.de ([78.53.46.58]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qyhgh-0001sv-IM for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 10:06:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 12:06:22 +0200
In-Reply-To: <j3kn1n$tqr$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314785183.3769.22.camel@mattotaupa>
Mime-Version: 1.0
Subject: `PR = "r0"`: Add or not to add? (was: thunar-volman: Add initial recipe with version 0.6.0)
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
X-List-Received-Date: Wed, 31 Aug 2011 10:11:14 -0000
X-Groupsio-MsgNum: 33925
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-G4dgfn0vIyk5xjjrenIs"

--=-G4dgfn0vIyk5xjjrenIs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 31.08.2011, 09:15 +0200 schrieb Koen Kooi:
> Op 31-08-11 01:06, Andreas M=C3=BCller schreef:
> > * build & partially run tested on overo
> >=20
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de> --- .../thuna=
r-volman/thunar-volman_0.6.0.bb           |   12 ++++++++++++ 1 files chang=
ed, 12 insertions(+), 0 deletions(-) create mode 100644 meta-xfce/recipes-x=
fce/thunar-volman/thunar-volman_0.6.0.bb
> >=20
> > diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.b=
b b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb new file mo=
de 100644 index 0000000..ad11d84 --- /dev/null +++ b/meta-xfce/recipes-xfce=
/thunar-volman/thunar-volman_0.6.0.bb @@ -0,0 +1,12 @@ +DESCRIPTION =3D
> > "Automatic management of removable drives and media for thunar" +SECTIO=
N =3D "x11" +LICENSE =3D "GPLv2" +LIC_FILES_CHKSUM =3D "file://COPYING;md5=
=3D94d55d512a9ba36caa9b7df079bae19f" +DEPENDS =3D "exo gtk+ libxfce4ui libx=
fce4util xfconf libnotify" + +PR =3D "r0"

(Koen, your messages are still not displayed correctly. The line breaks
are missing. Could you check your setup? Your messages are the only ones
displaying that problem [1].)

> please remove PR in new recipes

Actually I would favor to leave them in. The manual also advises to do
this. To change that policy, I would favor a survey/poll so that not
every developers says something different as s/he sees best fit.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/034=
698.html

--=-G4dgfn0vIyk5xjjrenIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5eB54ACgkQPX1aK2wOHViVzgCeNZmBC/D3UN9vBeDw78aPL1m0
iGkAnjdNCgMt+5Mw9jCit+Y/QsHCv9Dy
=EfRz
-----END PGP SIGNATURE-----

--=-G4dgfn0vIyk5xjjrenIs--
