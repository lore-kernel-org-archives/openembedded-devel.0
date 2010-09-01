Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OqneC-0006hD-2q for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 15:47:29 +0200
Received: from f053039179.adsl.alicedsl.de ([78.53.39.179]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Oqnda-0002U8-VM for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 13:46:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283346978-14041-1-git-send-email-i@minami.cz>
References: <1283346978-14041-1-git-send-email-i@minami.cz>
Date: Wed, 01 Sep 2010 15:46:00 +0200
Message-ID: <1283348760.4187.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] grub 0.97: fixing broken 256byte-inodes patch
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
X-List-Received-Date: Wed, 01 Sep 2010 13:47:30 -0000
X-Groupsio-MsgNum: 23001
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dzqy4svRCmy/bT7zXIzp"

--=-dzqy4svRCmy/bT7zXIzp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Michal,


thank you for your patch.

Am Mittwoch, den 01.09.2010, 15:16 +0200 schrieb Michal Minar:
> * original patch causes termination of grub with floating point exception=
,
>   when operating upon ext2 partitions

did it ever work with Ext2 partitions in OE? I guess =C8=A6ngstr=C3=B6m is =
using
it and Ext2 partitions and it is working there?

>  * the bug description came from:
>    http://bugs.gentoo.org/show_bug.cgi?id=3D220687
>  * fixed patch was done by RB <aoz.syn@gmail.com>

[=E2=80=A6]

Please take a look at the commit policy [1] and resent with a
Signed-off-by line. Please also update the patch queue [2].


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Commit_Policy
[2] http://wiki.openembedded.net/index.php/Patchwork

--=-dzqy4svRCmy/bT7zXIzp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkx+WRgACgkQPX1aK2wOHVg/kACfbA6Da4ZjtnWS9pqtfd5PvzFl
jKQAnAiHVwD9n9PUXoH4nqvUu95ALInM
=Jwt4
-----END PGP SIGNATURE-----

--=-dzqy4svRCmy/bT7zXIzp--
