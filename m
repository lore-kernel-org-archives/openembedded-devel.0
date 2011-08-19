Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QuP1N-0001z7-QP for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 15:22:01 +0200
Received: from f053038167.adsl.alicedsl.de ([78.53.38.167]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QuOx3-00031e-58 for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 13:17:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1313666756.4016.76.camel@mattotaupa>
References: <1313604363-2973-1-git-send-email-pespin.shar@gmail.com>
	<1313666756.4016.76.camel@mattotaupa>
Date: Fri, 19 Aug 2011 15:17:21 +0200
Message-ID: <1313759841.3673.42.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: minimal-uclibc: ../../src/lib/.libs/liblightmediascanner.so: undefined reference to `libiconv_open' (was: [meta-efl] lightmediascanner: Add version 0.4.3.0 (initial recipe))
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
X-List-Received-Date: Fri, 19 Aug 2011 13:22:01 -0000
X-Groupsio-MsgNum: 33712
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-I2OWyCjpSmWR4HrTzRVe"

--=-I2OWyCjpSmWR4HrTzRVe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Pau,


Am Donnerstag, den 18.08.2011, 13:25 +0200 schrieb Paul Menzel:

[=E2=80=A6]

> Furthermore I just wanted to report that the build is failing with
> uClibc. I contacted upstream but I am not sure what the correct fix is.
> Please find my attempt attached.

The upstream developer Gustavo provided a patch and this seems to fix
the build issues. Could you test if the recipe in oe.dev [1] works for
you.


Thank you very much,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D29dc290=
49a2c1073456f22a94f6e67a647343a64

--=-I2OWyCjpSmWR4HrTzRVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5OYmEACgkQPX1aK2wOHVhhHgCdG+L1ztXx2+TNOMy3na6G91Q+
FigAn0V2nkKSWsBv26FfoeqZavQJMe8J
=3yWx
-----END PGP SIGNATURE-----

--=-I2OWyCjpSmWR4HrTzRVe--
