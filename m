Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PW7v7-0004B6-Os for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 14:42:57 +0100
Received: from f053044232.adsl.alicedsl.de ([78.53.44.232]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PW7uz-0008VQ-Vl for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 13:42:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikA3awF9Ghc=Rgv5GUmfRxNLVD2XwW67wUvSiEM@mail.gmail.com>
References: <1290773704.28296.30.camel@mattotaupa>
	<AANLkTikA3awF9Ghc=Rgv5GUmfRxNLVD2XwW67wUvSiEM@mail.gmail.com>
Date: Fri, 24 Dec 2010 14:42:48 +0100
Message-ID: <1293198168.4027.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: xbmc: task `compile` fails with `/tools/TexturePacker/XBMCTex.cpp:394: undefined reference to `__lzo_init2'`
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
X-List-Received-Date: Fri, 24 Dec 2010 13:42:57 -0000
X-Groupsio-MsgNum: 27480
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-a5z4x0j3YrmWYqw6BuJG"

--=-a5z4x0j3YrmWYqw6BuJG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric,


Am Dienstag, den 30.11.2010, 07:53 +0100 schrieb Eric Colleu:
> Try to add this patch to your xbmc recipe:

[=E2=80=A6]

thank you for very much for your suggestion and I am sorry for my late
reply.

I found a similar commit upstream and sent a patch to this list some
minutes ago [1].


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-December/0=
28182.html

--=-a5z4x0j3YrmWYqw6BuJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0Uo1gACgkQPX1aK2wOHVjZ0gCfans0jDcZw2LXKvJSNIb4N1vi
GMgAnRU6hItBSe1HSrEE0Nhz7ZkoK0mD
=rhUZ
-----END PGP SIGNATURE-----

--=-a5z4x0j3YrmWYqw6BuJG--
