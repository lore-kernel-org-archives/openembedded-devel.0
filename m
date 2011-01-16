Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PeR5e-0003XZ-Tb for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 12:48:10 +0100
Received: from f053033090.adsl.alicedsl.de ([78.53.33.90]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PeR56-0007FC-Lt for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 11:47:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295138727-6516-1-git-send-email-lm@larsmichelsen.com>
References: <1295138727-6516-1-git-send-email-lm@larsmichelsen.com>
Date: Sun, 16 Jan 2011 12:47:35 +0100
Message-ID: <1295178455.5847.36.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] Added Europe/Berlin timezone to tzdata pkg
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
X-List-Received-Date: Sun, 16 Jan 2011 11:48:11 -0000
X-Groupsio-MsgNum: 28068
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bt5Ie+HDb3i2gmw8bnpE"

--=-bt5Ie+HDb3i2gmw8bnpE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Lars,


Am Sonntag, den 16.01.2011, 01:45 +0100 schrieb Lars Michelsen:
> I was missing the Europe/Berlin timezone in the tzdata package. So I
> added it to the package.
>=20
> Additionally increased the PR. Hope this OK for such a change - must
> admit that I am very new to OE.

thank you very much for your patch and welcome to OE.

Could you please resend your patch (`[PATCH v2]`) with the following two
points addressed.

1. The commit summary is standardized and should start with the package
name as documented in the commit policy [1].

	tzdata: package `Europe/Berlin` timezone

2. Although it probably does not matter, commit messages are normally
written from a neutral view point(?) and personal comments are added
after a `---` before the diff which starts also with `---`. When
applying your patch, these remarks are left out then.

> Signed-off-by: Lars Michelsen <lm@larsmichelsen.com>

[=E2=80=A6]

With these two issues addressed you can add

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

to the commit message when resending.


Thanks,

Paul


[1] http://wiki.openembedded.org/index.php/Commit_Policy
[2] http://wiki.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmb=
edded#Create_and_Commit_your_patch

--=-bt5Ie+HDb3i2gmw8bnpE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0y2tcACgkQPX1aK2wOHVhuCQCdGNKzsKUKQ+m3WClCj490QRQ2
UfQAn04mMTpr5uXlMmgO5/QJ49AXz8IL
=pK4D
-----END PGP SIGNATURE-----

--=-bt5Ie+HDb3i2gmw8bnpE--
