Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzHvW-0000Td-Lh for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 01:15:54 +0100
Received: from f053046215.adsl.alicedsl.de ([78.53.46.215]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzHtv-0005ou-DE for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 00:14:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Mar 2011 01:14:13 +0100
Message-ID: <1300148053.3828.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] mango-lassi: Typo. s/ESCRIPTION/DESCRIPTION/
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
X-List-Received-Date: Tue, 15 Mar 2011 00:15:54 -0000
X-Groupsio-MsgNum: 30202
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Vm4RgoPD5tDg7pls331J"

--=-Vm4RgoPD5tDg7pls331J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 18 Feb 2011 00:32:01 +0100


Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Dear OE folks,


before I push this, could you please tell me, if a PR bump is needed.

I would say yes, since the description gets included in the package?


Thanks,

Paul


[1] http://www.openembedded.org/index.php/When_To_Bump_PR
---
 recipes/avahi/mango-lassi_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/avahi/mango-lassi_git.bb b/recipes/avahi/mango-lassi_g=
it.bb
index c2250d8..a1a4117 100644
--- a/recipes/avahi/mango-lassi_git.bb
+++ b/recipes/avahi/mango-lassi_git.bb
@@ -1,4 +1,4 @@
-ESCRIPTION =3D "Input sharing, the avahi way"
+DESCRIPTION =3D "Input sharing, the avahi way"
 DEPENDS =3D "avahi-ui libglade libnotify"
=20
 SRCREV =3D "73638817126a68d62f1233f6e6859ce75a259e93"
--=20
1.7.4.1


--=-Vm4RgoPD5tDg7pls331J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1+r1UACgkQPX1aK2wOHVg1BgCfR49fa2wA4CLQC3VWY5H6Z7DY
qI0An00L6katrUx+DM55mDndA2SeusET
=Mw5h
-----END PGP SIGNATURE-----

--=-Vm4RgoPD5tDg7pls331J--
