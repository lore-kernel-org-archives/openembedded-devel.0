Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9359F65C5B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 23:49:37 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cd13so1763469pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2016 16:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=oxIVMnU1xTaNCl85bOERTLsitQzt5F6NQLptWy0aFno=;
	b=DSL6WTbSCM1AglBYYyYwtmOnDeOUQQMbGcQZy0RYruPSyxcMw6/iz1mwT9itb8XUJt
	MneqQn/Y98QOSkLHgfc6SpNZ3f4Fz8aK4Ym7V0rRF0ktF8vtIx/taepybcpyfOLWvY7c
	zBCObv84yYh6+U/PU1E/LPb6FiZqFuMk2Ed9YxMTNpECxhYcv+nSMKwEvT4McgsQVavh
	vvWfXtnFbdiHLxe/V32jLKctzR8BaO9/94KqMs0hRz8ZBJXH3ji1g/pVmsL9wyinD3bY
	8uChLTdGobHuy7LP6rMHfRSyX919Wrz7X8bL2pRvG1KM0cMED3iIreQYizOySWUoQ3eL
	B+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=oxIVMnU1xTaNCl85bOERTLsitQzt5F6NQLptWy0aFno=;
	b=SRw09REaAqk2obxS/p3GtePxoSDegp6J2UvW32Ig/PlnhCxX0oImHqNe0X0wiam5VV
	Te0uHrz/azCQOPFa9sfIRhgEFyCS+SnMZ9NYQ0aMUzl1NGRGOXNNClfPkcUvnjriytQB
	mMfKo8o6mTR47quKv6b2zc4rT6SBfs7WbibfCS1qBjquRneUdK0Eb6zneOLJcMlEsqpl
	4df4sgbgpj22iJUPDobv02/jV4Fd0vGaW3jKYvB2tCFcUy055AoLUi9XJBNOVE7MmHWf
	Vdh6vbA3WGd7O9RbC40TWcTYbLETVyn04aMCM1Qt7uBZKzw6D6EBMlO3vXDQ+2PkM8LQ
	Jpwg==
X-Gm-Message-State: AA6/9Rmvjuv3YFZ41+vQ1whWmHiosXyvQY1IShFrNiUi6mlOEVzXXxQAPXlMSoK/KoBUFw==
X-Received: by 10.66.246.13 with SMTP id xs13mr25794663pac.57.1475797779348;
	Thu, 06 Oct 2016 16:49:39 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:1891:a07b:2b72:a6d8?
	([2601:646:8882:b8c:1891:a07b:2b72:a6d8])
	by smtp.gmail.com with ESMTPSA id
	ps2sm25521929pab.31.2016.10.06.16.49.38
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Oct 2016 16:49:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1475789066-4308-1-git-send-email-msbarth@linux.vnet.ibm.com>
Date: Thu, 6 Oct 2016 16:49:38 -0700
Message-Id: <ADEE5812-4155-4506-B9A5-3029E3B58CDB@gmail.com>
References: <1475789066-4308-1-git-send-email-msbarth@linux.vnet.ibm.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Matthew Barth <msbarth@linux.vnet.ibm.com>
Subject: Re: [meta-oe][PATCH] autoconf-archive: 2012.04.07 -> 2016.09.16
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
X-List-Received-Date: Thu, 06 Oct 2016 23:49:37 -0000
X-Groupsio-MsgNum: 63397
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2E81031E-80C8-4343-AD2A-ECDB7D9C9F5B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2E81031E-80C8-4343-AD2A-ECDB7D9C9F5B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 6, 2016, at 2:24 PM, Matthew Barth <msbarth@linux.vnet.ibm.com> =
wrote:
>=20
> Signed-off-by: Matthew Barth <msbarth@linux.vnet.ibm.com>
> ---
> meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc     | 7 =
++++---
> ...toconf-archive_2012.04.07.bb =3D> autoconf-archive_2016.09.16.bb} | =
6 +++---
> 2 files changed, 7 insertions(+), 6 deletions(-)
> rename =
meta-oe/recipes-devtools/autoconf-archive/{autoconf-archive_2012.04.07.bb =
=3D> autoconf-archive_2016.09.16.bb} (61%)
>=20
> diff --git =
a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc =
b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> index 9399363..2b5df70 100644
> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> @@ -1,15 +1,16 @@
> +SUMMARY =3D "A collection of macros for GNU Autoconf"
> +DESCRIPTION =3D "The autoconf-archive set of macros extend the =
pre-defined \
> +capabilities within the complete autoconf tool set."
> LICENSE =3D "GPLv3"
> HOMEPAGE =3D "http://www.gnu.org/software/autoconf-archive/"
> SECTION =3D "devel"
> -
> DEPENDS +=3D "m4-native"
> DEPENDS_class-native =3D "m4-native gnu-config-native"
> DEPENDS_class-nativesdk =3D "m4-nativesdk gnu-config-nativesdk"
> -
> RDEPENDS_${PN} =3D "m4 gnu-config"
> RDEPENDS_${PN}_class-native =3D "m4-native gnu-config-native"
> RDEPENDS_${PN}_class-nativesdk =3D "m4-nativesdk gnu-config-nativesdk"
>=20
> -SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
> +SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>=20
> inherit autotools
> diff --git =
a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb=
 =
b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb=

> similarity index 61%
> rename from =
meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
> rename to =
meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
> index 5baaecc..da648c2 100644
> --- =
a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb=

> +++ =
b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb=

> @@ -1,13 +1,13 @@
> require autoconf-archive.inc
>=20
> -
> PARALLEL_MAKE =3D =E2=80=9C"

Do we still need this ?

>=20
> LICENSE =3D "GPLv2 & GPLv3"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
>=20
> -SRC_URI[md5sum] =3D "e842c5b9fae021007bd70550362e5e80"
> -SRC_URI[sha256sum] =3D =
"040b443bf68efd52fbfcb294b556bfbbbfe432db78445ca25e0cfe2e88f96a14"
> +SRC_URI[md5sum] =3D "bf19d4cddce260b3c3e1d51d42509071"
> +SRC_URI[sha256sum] =3D =
"e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
>=20
> EXTRA_OECONF +=3D "ac_cv_path_M4=3Dm4"
> +
> BBCLASSEXTEND =3D "native nativesdk"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_2E81031E-80C8-4343-AD2A-ECDB7D9C9F5B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlf24xIACgkQuwUzVZGdMxTGDACfdC/L4jW86xUMktbFfar9ZAEI
zhoAoJM54zfQvq9grLYGhj1xyeR1ueZj
=OB5V
-----END PGP SIGNATURE-----

--Apple-Mail=_2E81031E-80C8-4343-AD2A-ECDB7D9C9F5B--
