Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7si2-0006H0-I6 for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 18:37:15 +0200
Received: from f053035105.adsl.alicedsl.de ([78.53.35.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P7shW-0006XE-Vm for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 16:36:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <54D70760-5A2E-487E-8D2E-956AC7FCE4DF@mac.com>
References: <54D70760-5A2E-487E-8D2E-956AC7FCE4DF@mac.com>
Date: Mon, 18 Oct 2010 18:36:41 +0200
Message-ID: <1287419801.3735.6.camel@mattotaupa>
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
Subject: Re: WARNING: Deprecated usage of 'patch' url param
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
X-List-Received-Date: Mon, 18 Oct 2010 16:37:15 -0000
X-Groupsio-MsgNum: 25047
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-J4rRa3GXBkJBFJn8+2WA"

--=-J4rRa3GXBkJBFJn8+2WA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 18.10.2010, 21:54 +0530 schrieb Elvis Dowson:

>       What is the correct format for specifying patches to apply for OE r=
ecipes? I get a WARNING: Deprecated usage of 'patch' url param for ' *.bb' =
message

Please take a look at 6fe7cef [1].

If you proposed a better message and send a patch [2], it would be
welcomed.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D6fe7cef=
27069415f2eba36bc640cf59013d4979b
[2] http://wiki.openembedded.net/index.php/Commit_Policy

--=-J4rRa3GXBkJBFJn8+2WA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky8d4gACgkQPX1aK2wOHVhE+gCfZt+gVzNDREAnzH2isU16Lnfi
2a0An1jUNmroCA/IMC0m9PF7bXHmc51H
=j7aE
-----END PGP SIGNATURE-----

--=-J4rRa3GXBkJBFJn8+2WA--
