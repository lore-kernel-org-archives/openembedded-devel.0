Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 98C1E71482
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 15:20:42 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id x48so4974472wes.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zn/pqDNLaQfDdva3Y9Ht7im867mCUJacr5b3gd4ivXE=;
	b=B4SiCE/03TrswYfqnEys4sESgjan2Kchn2VNmYFrqa0rjBSxQhUEyX1FiC3t3BbyNK
	epmO43gpwylD6VmurO+S5P31Es6EcsFiI0rGIREeIaTxguKr2ID+dVk4JdTXrLFsucnP
	SjYcz8bfHjVMxe30GSG+kCTuNtvkONiQhtudpx8++zhIcxJUBu0U4uD9SNFZZhD7stLQ
	RBzC1YyjlBnoJ0iis7uow7xC7WX2OWux0QqFAZ1Y5jUAL3GftmZCfKTMOLHUg+AMKlO/
	Xy7aQKoVhIBbZNvjeqsjIVAhyucXHz07WEjmzgMZ02qsraplp76q83L0dxaIS64zR3AB
	qvLQ==
X-Received: by 10.194.171.228 with SMTP id ax4mr8689946wjc.3.1411572043097;
	Wed, 24 Sep 2014 08:20:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eq9sm6098504wic.20.2014.09.24.08.20.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 08:20:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Sep 2014 17:21:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140924152128.GK25706@jama>
References: <BLU436-SMTP33002726F1A5BBA17F19CBD6C80@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP33002726F1A5BBA17F19CBD6C80@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] cyassl: version 3.2.0 release
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
X-List-Received-Date: Wed, 24 Sep 2014 15:20:45 -0000
X-Groupsio-MsgNum: 52218
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLauP2uySp+9cKYP"
Content-Disposition: inline

--SLauP2uySp+9cKYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2014 at 04:00:01PM -0600, lchristina26 wrote:
> This release includes bug fixes and several new features
> which we think will be beneficial to our user and customer base.

ERROR: Fetcher failure for URL: 'http://www.yassl.com/cyassl-3.2.0.zip'.
Checksum mismatch!
File: '/home/jenkins/oe/world/shr-core/downloads/cyassl-3.2.0.zip' has
md5 checksum a80493c224ff86e45dc333c06d5edb88 when
72477eb50697e759d309c49cb1aef18a was expected
File: '/home/jenkins/oe/world/shr-core/downloads/cyassl-3.2.0.zip' has
sha256 checksum
e6c026f4fa8acb156f768f82251052dd1c8c7ee35ef907707ddaf84e15b38b31 when
85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e was
expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within the
recipe:
SRC_URI[md5sum] =3D "a80493c224ff86e45dc333c06d5edb88"
SRC_URI[sha256sum] =3D
"e6c026f4fa8acb156f768f82251052dd1c8c7ee35ef907707ddaf84e15b38b31"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.

ERROR: Function failed: Fetcher failure for URL:
'http://www.yassl.com/cyassl-3.2.0.zip'. Unable to fetch URL from any
source.
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/cya=
ssl/3.2.0-r0/temp/log.do_fetch.7148
NOTE: recipe cyassl-3.2.0-r0: task do_fetch: Failed

>=20
> Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
> ---
>  .../recipes-connectivity/cyassl/cyassl_3.2.0.bb        | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.=
2.0.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> new file mode 100644
> index 0000000..0c0cac2
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "CyaSSL Embedded SSL Library"
> +DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and \
> +               optimized for embedded and RTOS environments. It can be \
> +               Up to 20 times smaller than OpenSSL while still supportin=
g \
> +               a full TLS 1.2 client and server."
> +HOMEPAGE =3D "http://www.yassl.com/yaSSL/Products-cyassl.html"
> +BUGTRACKER =3D "http://github.com/cyassl/cyassl/issues"
> +SECTION =3D "libs/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> +
> +SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> +SRC_URI[sha256sum] =3D "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2ad=
c16d2507b5d0b03e"
> +
> +inherit autotools
> +
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

--SLauP2uySp+9cKYP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQi4XgACgkQN1Ujt2V2gBxn6ACcCsGY9IkLhRGwr3MlIgreQopO
yxAAoLFvl5FffG1FvHRLEjYdLF2HI7Yy
=s9AK
-----END PGP SIGNATURE-----

--SLauP2uySp+9cKYP--
