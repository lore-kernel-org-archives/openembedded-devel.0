Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C5FEA727AB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 16:51:32 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so8502581wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 08:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2SWzUdYHOO/8IGUs7mEfE/diuCPTq2JPmQkDPiPeu30=;
	b=j4jsGDBIQ1ysWFION1ZzUOvPEZpI9qIWkyB5AXOmlwYVhOXGefr8da1kYk0ypbX8ab
	8tl/drXQy6DJiI/CPdLaw8flifEOpdYlMjJbrUb2k59l89EkXmqbxkZtI4g3Esew2luz
	eD2F/G2e4PbPjIpPJiNpnwSDrjzUfzWVkTNE0UamBHLKrwkPxCvmsZ+4/a4yVcA1LwsO
	O3/I4esgI/ZIcZA8aHfJmZ1YZZSusww1MA1Z1Ipkbu9bFsdXA/0uCfAKUNVvX5cNlAVT
	zSQ8Rt+SdKAazG1VUGBtcwR9nbrN2qA96KCAr8cRNpo5jgffXqJxalijiwKRmDUvSy8a
	SdIA==
X-Received: by 10.180.107.195 with SMTP id he3mr28681258wib.44.1419267092746; 
	Mon, 22 Dec 2014 08:51:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dn2sm4122940wib.14.2014.12.22.08.51.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Dec 2014 08:51:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Dec 2014 17:51:33 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141222165133.GF2465@jama>
References: <BLU436-SMTP205279D0490E10933874AE3D6560@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP205279D0490E10933874AE3D6560@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH v2] cyassl: removed "version 3.3.0" from summary
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
X-List-Received-Date: Mon, 22 Dec 2014 16:51:34 -0000
X-Groupsio-MsgNum: 53422
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Content-Disposition: inline

--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2014 at 09:21:19AM -0700, lchristina26 wrote:
> Signed-off-by: lchristina26 <lchristina26@hotmail.com>

Again doesn't remove 3.1.0 version, please read the patches before
sending them.

> ---
>  meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> index 715cf1f..b6f852d 100644
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> @@ -1,4 +1,4 @@
> -SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library, version 3.3.0"
> +SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library"
>  DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and \
>                 optimized for embedded and RTOS environments. It can be \
>                 Up to 20 times smaller than OpenSSL while still supportin=
g \
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSYTBUACgkQN1Ujt2V2gBwbmQCfUePHOwsec6Z+uLr2lKEQG3S1
maQAoIP0nTTmwOriJf6+rplGourlza8r
=vC53
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--
