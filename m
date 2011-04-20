Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCY33-0000JD-G5 for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 16:06:29 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCY1J-0007pC-5I for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 14:04:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303307478.3979.60.camel@mattotaupa>
References: <20110419093343.GB2989@rhein.zuhause.netz>
	<201104201534.51856.pgsellmann@portner-elektronik.at>
	<1303307478.3979.60.camel@mattotaupa>
Date: Wed, 20 Apr 2011 16:04:08 +0200
Message-ID: <1303308248.3979.63.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH 2/2] orc: add version 0.4.11
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
X-List-Received-Date: Wed, 20 Apr 2011 14:06:29 -0000
X-Groupsio-MsgNum: 31373
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-VKJjTTgOKuIp1xhAnyKH"

--=-VKJjTTgOKuIp1xhAnyKH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 20 Apr 2011 11:50:37 +0200

This version is build tested using `angstrom-2010.x` and `minimal{,-uclibc}=
` for `MACHINE =3D "beagleboard"`. `schroedinger_1.0.9.bb` also seems to bu=
ild fine with this version.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/orc/orc_0.4.11.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 recipes/orc/orc_0.4.11.bb

diff --git a/recipes/orc/orc_0.4.11.bb b/recipes/orc/orc_0.4.11.bb
new file mode 100644
index 0000000..e101068
--- /dev/null
+++ b/recipes/orc/orc_0.4.11.bb
@@ -0,0 +1,4 @@
+require orc.inc
+
+SRC_URI[orc.md5sum] =3D "b8b0b148d319422c3ad250c29483b3c4"
+SRC_URI[orc.sha256sum] =3D "6ec60521a11339eda36f1e2210d08ae95010d769575e47=
1aaf365b89bca8d031"
--=20
1.7.4.4


--=-VKJjTTgOKuIp1xhAnyKH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2u59gACgkQPX1aK2wOHVhD0wCfWtCDWtM5XJBqbVY8n5t0gjfz
Rv8An14GbNc1NrI1pEdz/AV35JKGFFBf
=mr6S
-----END PGP SIGNATURE-----

--=-VKJjTTgOKuIp1xhAnyKH--
