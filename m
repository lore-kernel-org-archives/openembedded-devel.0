Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWSj0-0007za-L3 for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 12:55:50 +0100
Received: from f053037080.adsl.alicedsl.de ([78.53.37.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PWSir-0008KA-LK for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 11:55:41 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=BJKBab7h_oi4SwMVFuDdDFwW_AsJ8YpCsx9X6@mail.gmail.com>
References: <1293217389.4027.39.camel@mattotaupa>
	<1293232419.4027.53.camel@mattotaupa>
	<AANLkTi=BJKBab7h_oi4SwMVFuDdDFwW_AsJ8YpCsx9X6@mail.gmail.com>
Date: Sat, 25 Dec 2010 12:55:40 +0100
Message-ID: <1293278140.3694.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2 v2] xbmc: add `zlib` to `DEPENDS`
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
X-List-Received-Date: Sat, 25 Dec 2010 11:55:50 -0000
X-Groupsio-MsgNum: 27500
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GV2Xx5FT1UP7kEicT5b9"

--=-GV2Xx5FT1UP7kEicT5b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Khem,


Am Samstag, den 25.12.2010, 03:25 -0800 schrieb Khem Raj:

> Can you rebase your patches and send them as a single patch for xbmc plea=
se

do you mean squash patch 1/2 and patch 2/2. In this case I am a little
reluctant since in the future, when a newer upstream version is used
where patch 2/2 is included already, then one could just say, the patch
introduced in Patch 2/2 is not needed anymore, where the dependency
change in 1/2 will not go away.


Thanks,

Paul

--=-GV2Xx5FT1UP7kEicT5b9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0V27YACgkQPX1aK2wOHVjg6wCeJQHTnma+sSzAKwwNnXEPzhj7
pycAn09sKbqz7UbkS/Q8qNXvzMJqYrei
=r/A1
-----END PGP SIGNATURE-----

--=-GV2Xx5FT1UP7kEicT5b9--
