Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C39C260097
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 18:56:46 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Xgebv-0005po-Lm from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2014 11:56:47 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 21 Oct 2014 11:56:47 -0700
Received: by burninator (Postfix, from userid 1000)	id 94BA958103D; Tue, 21
	Oct 2014 14:56:46 -0400 (EDT)
Date: Tue, 21 Oct 2014 14:56:46 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141021185645.GD18243@mentor.com>
References: <1413514681-22187-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
In-Reply-To: <1413514681-22187-1-git-send-email-eduardo@monkey.io>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] PolarSSL: update package description
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Oct 2014 18:56:48 -0000
X-Groupsio-MsgNum: 52583
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline

--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] PolarSSL: update package description] On 14.=
10.16 (Thu 20:58) Eduardo Silva wrote:

> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  .../recipes-connectivity/polarssl/polarssl_1.3.8.bb    | 18 ++++++++++++=
+++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8=
=2Ebb b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> index d05f416..8ca1b1c 100644
> --- a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> +++ b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
> @@ -1,7 +1,19 @@
>  SUMMARY =3D "Lightweight crypto and SSL/TLS library"
> -DESCRIPTION =3D "PolarSSL is a fork of the abandonned project XySSL. It \
> -is a lean crypto library providing SSL and TLS support \
> -in your programs."
> +DESCRIPTION =3D "PolarSSL is a lean open source crypto library         \
> +for providing SSL and TLS support in your programs. It offers        \
> +an intuitive API and documented header files, so you can actually    \
> +understand what the code does. It features:                          \
> +                                                                     \
> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
> +   Camellia and XTEA                                                 \
> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
> +   ECDSA and ECDH                                                    \
> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
> + - Abstraction layers for ciphers, hashes, public key operations,    \
> +   platform abstraction and threading                                \
> +"
> =20
>  HOMEPAGE =3D "https://polarssl.org"
>  BUGTRACKER =3D "https://github.com/polarssl/polarssl/issues"
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJURqxtAAoJEEn8ffcsOfaWLOgH/j6JnL/mfcYs0rMhlzNlr4Uz
xhySWl8vFe9m2lqIoKPlMiW+x5gAwElirzmHloSW/3hLX7ZFSyfnF0FnrEL7W6M/
jEv2RP5b3wCPZDF0KUm6UNmVHEX9dDU8jcBRMal+XUlgEgezGngHYbHiiVGrcxhW
gMm9usO2M9/MRHj99KD8mMsdog+bee5rdpW+cKy0TPxDuFi2auFD0DorhArudas4
5Y9+e/+RIKXV5aeNSaMPyIM7aFUqEIQ6v64/4vS2AA1lZCi/3NEje+WvLxwbGQgC
S7ioLmN5d4ArfMGirxuE6um9jly/KWKOZ5uVMAYuKr3l4SGlvzbELu4fh/UZ9Hs=
=Q1j3
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
