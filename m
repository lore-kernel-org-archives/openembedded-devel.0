Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RHLyX-0008Gg-Tm for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 22:45:57 +0200
Received: from f053040166.adsl.alicedsl.de ([78.53.40.166]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RHLt3-0001ne-8b for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 20:40:17 +0000
Message-ID: <1319229593.3448.4.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 22:39:53 +0200
In-Reply-To: <CAMKF1srCM1QpLmAAr13qbAsD0_PZUx9zLWP==tQMBcy=+ck5Dw@mail.gmail.com>
References: <CAMKF1srCM1QpLmAAr13qbAsD0_PZUx9zLWP==tQMBcy=+ck5Dw@mail.gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: Keeping patch status uptodate in patchwork
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
X-List-Received-Date: Fri, 21 Oct 2011 20:45:57 -0000
X-Groupsio-MsgNum: 34976
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Tmr6m3Joxpu/Lulb8Lgc"

--=-Tmr6m3Joxpu/Lulb8Lgc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Khem,


Am Freitag, den 21.10.2011, 10:20 -0700 schrieb Khem Raj:

> I would like to request the patch submitter to change the status of
> patches appropriately particularly case where manual intervention will
> be needed
>=20
> 1. When you send pull request the cover letter is not marked accepted
> automatically so when pull request is merged please mark it so.

I am guessing the cover letters could be filtered out automatically? It
should not be useful to track those in our patch queue since they do not
contain any patch. Is there a Python guru who can send a patch to
Patchwork upstream?

> 2. When multiple versions of patches V1, V2, V3 are sent then the
> versions that don't get applied should be marked as superseded.

Very true.

> It will greatly help in keeping the patchwork clean and layer
> maintainers and the data it represents will be lot more relevant.

Please refer (new) patch submitters to the Wiki page [1].


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Patchwork

--=-Tmr6m3Joxpu/Lulb8Lgc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6h2JkACgkQPX1aK2wOHVhYxgCfS4a8FgTLUWXzC+gBNajbfbDl
i5MAn0P7vW6kL7V/E3dccRFuMszNFryP
=52O1
-----END PGP SIGNATURE-----

--=-Tmr6m3Joxpu/Lulb8Lgc--
