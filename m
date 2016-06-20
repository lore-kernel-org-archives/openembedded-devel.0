Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6C06FFEF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 10:05:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a66so7629895wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gtxCcmrxRn4OwC3moT5dml8rPK8FZ8AegUDhZwR80Pg=;
	b=h/S11g+4hq0WoUAMaC4T+l+7LElypegpl1tkjStvq9/4pB7iugG0RaRxoyfM3EIro2
	4CWtSTv28SysbPRnRPe8LWCCmbwBCKNs+lekUDqFZ8ek9g3KO2pFrb42199lH4CtIP+g
	DEBAsL/94KKFQ5jX17JoPcESfrjwYFcYug3enDjnrNuP0zksXKNWcIs6rl08JflEMVsI
	Zmz5zS8+3I8rhrBF1Yzyoxk/pdVLJyuxhBoWRzLTdaAgKby2WVUEwSwR5DCpXGb1+agF
	4F3LulCswGY8js5FbUZULhhXHaT8AY5y5DuDmcMhCkqS3f+IeoW53O6tz1Tk3vxuS9uR
	oiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gtxCcmrxRn4OwC3moT5dml8rPK8FZ8AegUDhZwR80Pg=;
	b=HAEWr58WAB7aURdnn5pAY5WlFT3NMwORebCjW5+bEbPd0cpwYU67WU+wQbXf/TfZvG
	+47Vp1GCp38NRhJvgRS3+Uei6kiTinIPTZsAKx9NgFW3Tga7TAW6YjUq4l9lzxnj14nn
	6Z91TMEgwufQWLVTL+Bc3etRbpflQ4uJrrgd0AN6nzoK1xUCqE+PQUqD0AS1FMT6f4E3
	1noM5C7rhl0n3DrJDCfMdbHHRLZ958ukfIcKzGyMxb69iPvePdiMnLkx4D3tCNx56c/M
	Ipt1fpGq9N05DXL95Kjr9q/nrkE58LM0Ed9jQ1+hsWLZ/Wp6lWqnWuV0LUoKUWJ8e2KA
	F0dg==
X-Gm-Message-State: ALyK8tJZqhmxuBCCTIH6KVqF8CAL6XmHhcbIMuw50OxAcfdWSUEhRdbikrP2DpUsHf5arQ==
X-Received: by 10.194.133.98 with SMTP id pb2mr13546290wjb.144.1466417104199; 
	Mon, 20 Jun 2016 03:05:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	li10sm18265230wjb.5.2016.06.20.03.05.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Jun 2016 03:05:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Jun 2016 12:05:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160620100509.GB2584@jama>
References: <1465999821-29203-1-git-send-email-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1465999821-29203-1-git-send-email-pascal.bach@siemens.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-oe][PATCH] poco: update to 1.7.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2016 10:05:04 -0000
X-Groupsio-MsgNum: 61888
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 04:10:21PM +0200, Pascal Bach wrote:
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta-oe/recipes-support/poco/{poco_1.7.1.bb =3D> poco_1.7.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/poco/{poco_1.7.1.bb =3D> poco_1.7.3.bb} (=
96%)
>=20
> diff --git a/meta-oe/recipes-support/poco/poco_1.7.1.bb b/meta-oe/recipes=
-support/poco/poco_1.7.3.bb
> similarity index 96%
> rename from meta-oe/recipes-support/poco/poco_1.7.1.bb
> rename to meta-oe/recipes-support/poco/poco_1.7.3.bb
> index 135d2aa..75e0997 100644
> --- a/meta-oe/recipes-support/poco/poco_1.7.1.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.7.3.bb
> @@ -17,8 +17,8 @@ SRC_URI =3D " \
>      file://run-ptest \
>     "
> =20

Fails to fetch:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.qemux86.201=
60616_201549.log//2_max/failed/poco.log

ERROR: poco-1.7.3-r0 do_fetch: Fetcher failure for URL: 'https://github.com=
/pocoproject/poco/archive/poco-1.7.3-release.tar.gz'. Checksum mismatch!
File: '/home/jenkins/oe/world/shr-core/downloads/poco-1.7.3-release.tar.gz'=
 has md5 checksum d27c7aace6ada216f34133b26e524327 when 6b979d7d9c1751c2e06=
3338cb5ea8977 was expected
File: '/home/jenkins/oe/world/shr-core/downloads/poco-1.7.3-release.tar.gz'=
 has sha256 checksum 65d997ce6e4e7efb0af9052038f4476ab48b09557125b8da28da64=
60ae98c79c when af75f279c9eac35b39fc998d8d20dc45d5bef91eb75851ff99d948ca128=
c7740 was expected

> -SRC_URI[md5sum] =3D "a4b755d47303b20a0e2586f281d05a36"
> -SRC_URI[sha256sum] =3D "6dbbc2018912ad9af6af96f605933ed91354a1e7423e5dbd=
04d8e9a2b2d15c05"
> +SRC_URI[md5sum] =3D "6b979d7d9c1751c2e063338cb5ea8977"
> +SRC_URI[sha256sum] =3D "af75f279c9eac35b39fc998d8d20dc45d5bef91eb75851ff=
99d948ca128c7740"
> =20
>  S =3D "${WORKDIR}/poco-poco-${PV}-release"
> =20
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldnv9QACgkQN1Ujt2V2gBybcwCfQzJBGyMEn73F4k7Lgxuz6T1H
404AnijElHppptlX+eX+pMALSgcWjPAk
=UYys
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
