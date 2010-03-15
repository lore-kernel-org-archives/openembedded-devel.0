Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nr6wF-0001x4-EU for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 10:50:19 +0100
Received: from f053034098.adsl.alicedsl.de ([78.53.34.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nr6tL-00024s-Ts for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:47:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 10:46:53 +0100
Message-ID: <1268646413.3759.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] enna: Remove `recipes/e17/enna/.mtn2git_empty`.
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
X-List-Received-Date: Mon, 15 Mar 2010 09:50:19 -0000
X-Groupsio-MsgNum: 17631
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-V50vU9whIfKhxzB/Akaf"

--=-V50vU9whIfKhxzB/Akaf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

`.mtn2git_empty` is the only file in `recipes/e17/enna/` and seems have ori=
ginated from the Monotone to Git transition.

Since no useful files are in this directory remove it completely.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 0 files changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 recipes/e17/enna/.mtn2git_empty

diff --git a/recipes/e17/enna/.mtn2git_empty b/recipes/e17/enna/.mtn2git_em=
pty
deleted file mode 100644
index e69de29..0000000
--=20
1.7.0

--=-V50vU9whIfKhxzB/Akaf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkueAg0ACgkQPX1aK2wOHVhB2ACfScHgxBsWFdzdEqjn213Ddzua
jmkAnieVCkS8xMyzZtXJa10BGbNM2Rc8
=ds7B
-----END PGP SIGNATURE-----

--=-V50vU9whIfKhxzB/Akaf--
