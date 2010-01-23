Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYmHW-00027D-VU for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 21:08:34 +0100
Received: from e178248110.adsl.alicedsl.de ([85.178.248.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYmFK-0007mM-I0 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 20:06:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 21:06:13 +0100
Message-ID: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Official policy to list checksums
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
X-List-Received-Date: Sat, 23 Jan 2010 20:08:34 -0000
X-Groupsio-MsgNum: 16115
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-C5NYHU8NlnLG0qqhmIWz"

--=-C5NYHU8NlnLG0qqhmIWz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE hackers,


does [1] still describe the official policy to add checksums? Or is
putting them into the recipes preferred nowadays?

For example

        SRC_URI[whois.md5sum] =3D "18d74a07d711262b75f04a1c319bc833"
        SRC_URI[whois.sha256sum] =3D "fb13316c09ff9f98bd9af659d0789c9a09b97=
757f5c6c3dbfbc790250d5c5abc"

from [2].


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Checksums
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D310b2cd=
8919a13280b445537893c109b66c5275c

--=-C5NYHU8NlnLG0qqhmIWz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktbVrQACgkQPX1aK2wOHVg7jACfdnV1zT1XclfOMeP6lawIjVRk
d68An0W1+1e9Ju+Mb+r6ljv5MWRJ7GOH
=GcgE
-----END PGP SIGNATURE-----

--=-C5NYHU8NlnLG0qqhmIWz--
