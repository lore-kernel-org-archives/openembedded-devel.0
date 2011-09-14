Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3qT7-00027E-Mz for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 16:29:41 +0200
Received: from f053036201.adsl.alicedsl.de ([78.53.36.201]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3qOF-0008BO-3b for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 14:24:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2011 16:24:32 +0200
In-Reply-To: <1eb2612347e83d9906021429768912fcd036951a.1316006259.git.otavio@ossystems.com.br>
References: <cover.1316006259.git.otavio@ossystems.com.br>
	<1eb2612347e83d9906021429768912fcd036951a.1316006259.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316010273.6686.105.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/1] xorg-xserver-common.inc: usr ${datadir} instead of /usr/share
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
X-List-Received-Date: Wed, 14 Sep 2011 14:29:41 -0000
X-Groupsio-MsgNum: 34222
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-/oLzdQJsfclq7Ku//ULk"

--=-/oLzdQJsfclq7Ku//ULk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 14.09.2011, 13:18 +0000 schrieb Otavio Salvador:

There is a typo in the commit summary: s/usr/use/.

What distributions do not use `/usr/`?

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> ---
>  .../xorg-xserver/xorg-xserver-common.inc           |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-/oLzdQJsfclq7Ku//ULk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5wuSAACgkQPX1aK2wOHVjo4QCfUHKy4aGVZynxG+Vz6r2oZ6g0
kYYAn3OVWPnVuz3CQyE31EunkkIg7FT4
=duu+
-----END PGP SIGNATURE-----

--=-/oLzdQJsfclq7Ku//ULk--
