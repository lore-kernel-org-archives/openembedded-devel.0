Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1SVg4k-0004JE-Ix for openembedded-devel@lists.openembedded.org;
	Sat, 19 May 2012 11:35:59 +0200
Received: from f053035093.adsl.alicedsl.de ([78.53.35.93]
	helo=[192.168.178.20])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1SVfVI-0000Tg-DM; Sat, 19 May 2012 08:59:12 +0000
Message-ID: <1337417934.3976.13.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 May 2012 10:58:54 +0200
In-Reply-To: <1337018980-29630-1-git-send-email-Chase.Maupin@ti.com>
References: <1337018980-29630-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [2011.03-maintenance] Pull request 20120514
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
X-List-Received-Date: Sat, 19 May 2012 09:36:05 -0000
X-Groupsio-MsgNum: 38896
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-7S1WQltMo/9MXYwun9zg"

--=-7S1WQltMo/9MXYwun9zg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Chase,


Am Montag, den 14.05.2012, 13:09 -0500 schrieb Chase Maupin:

> Please pull the following commits that update the LICENSE field to
> list the actual license version for licenses like GPL and LGPL.  These
> patches have previously been sent to the list with each patch identifying
> where it was derived from.  I have also submitted patches for oe-core whe=
re
> appropriate.
>=20
> I'm looking for feedback on how to properly mark a package as having two
> licenses in oe-classic since "&" causes issues.  If these patches are OK
> then they can be pulled.  If there is a better way to mark the dual licen=
sing
> then I'll update them accordingly.
>=20
> The following changes since commit 36a56cbb69cda0c89f478e01183d61c6a66525=
c9:
>   Steffen Sledz (1):
>         icedtea6-native-1.7.10: backport S7103224
>=20
> are available in the git repository at:
>=20
>   http://arago-project.org/git/projects/arago-oe-amsdk.git update-license=
s
>=20
> Chase Maupin (69):
>       gnutls: update LICENSE setting

I would have liked to have split those up. Update the license and add
the inherit line.

>       libtasn1: update LICENSE setting
>       bonnie: Update LICENSE field version

It would have been great to have the changed license in the commit
message also.

[=E2=80=A6]

>       schroedinger: Update LICENSE field version

A change in `schroedinger.inc` is preferred in my opinion.

[=E2=80=A6]


Thanks,

Paul

--=-7S1WQltMo/9MXYwun9zg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk+3YM4ACgkQPX1aK2wOHVgIfQCeKg8jgpWYwTrL2fS2JIRnaQSp
M/8AnjyDdTt/8llLrxVr0XQy6Ktc55XO
=AEn6
-----END PGP SIGNATURE-----

--=-7S1WQltMo/9MXYwun9zg--
