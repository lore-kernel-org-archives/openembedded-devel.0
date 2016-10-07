Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8F51A719E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 15:15:33 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id hh10so2884032pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=LtUDOwsneeBs0qZyA8kR3xmkBXm2aWoevXZFzwn4U4w=;
	b=jqK0esQ0b82yY8n8gzJ7K3xv4giHxZTdU+ioakePy8lxVA6dRZA4Qo70Hqvso0YDnk
	P4i7KsxQqJwUtrSzDVWKNoJQdN1EJURJ+scfUdQfT7G1qiLEQN2fjyk2YtZTQL9WTT8X
	I5Qm+iy5QTmVFTnBaMq9O1Xazo2d7L2sAzSZeLNMFeKf76dyCJwgJVKuWyPIGRBtdjtx
	HehTGoCD/ncpRwNTHiHPdvBgs6EfZ3U/dQYwIB2sDxA3fMJTz6Dgzd0WJKeaO+uzTRtM
	E0bX/stplCDNoQRJzU2+Y24jBSKSEFv7Z4hMgkzidF5ZeoOCpBd6bxBwnyIwmtKlvuyW
	Rk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=LtUDOwsneeBs0qZyA8kR3xmkBXm2aWoevXZFzwn4U4w=;
	b=I34ZQPbXJesZmyfUDkp+Goo/ROR7acSPrx3DiQeMlRoiPY+aZTk6Rdfn0H1gb4y6N3
	FBqRlAr8NCQ/V9y9MiCyQmxR4JC5mc34v0Ag91QH37PTU5Q6YOUfF5DLNzva45I1nhrd
	vulPoytgQQuXFozsyEFCoQbnLQZnZMSqRnwPGhPqSFXq7KAOfTQ+Yz5HbzetDfuN7Yxr
	aYZdLQX5ZjEVcOGURQtj7yFaUCrBZsFfJz3Ss0YxOGkfZplvIaIFXcHn7l00oHD3FNuQ
	6zYcfUAZMaCUpTCzkxQb99zNVnkDIPECiy82ECYKGQeveRpcsX31cSURfCBoQ0YZlz/G
	gywg==
X-Gm-Message-State: AA6/9Rmo+hx0RHrnectGE3CEuQk1eFeHqud301KSc+qikZYSbU8IxAiOUqd3NRKPJrZ2/A==
X-Received: by 10.66.78.9 with SMTP id x9mr30853702paw.201.1475853334558;
	Fri, 07 Oct 2016 08:15:34 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:cd9d:6261:adca:4b85?
	([2601:646:8882:b8c:cd9d:6261:adca:4b85])
	by smtp.gmail.com with ESMTPSA id
	p26sm14775056pfj.80.2016.10.07.08.15.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Oct 2016 08:15:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20161007085121.16502-2-igor.socec@pelagicore.com>
Date: Fri, 7 Oct 2016 08:15:32 -0700
Message-Id: <7F3E06C7-3B86-4BA4-B157-F06436A518C9@gmail.com>
References: <CAMKF1soNE54yHLS5tm25yZa68d=vitr7ETHjEWbqK10_-etxFw@mail.gmail.com>
	<20161007085121.16502-2-igor.socec@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH] jansson: update to 2.9
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
X-List-Received-Date: Fri, 07 Oct 2016 15:15:33 -0000
X-Groupsio-MsgNum: 63414
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3ED6843F-9183-4A91-BD52-B2CFCC56D049";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3ED6843F-9183-4A91-BD52-B2CFCC56D049
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 7, 2016, at 1:51 AM, Igor Socec <igor.socec@pelagicore.com> =
wrote:
>=20
> Improved build, tests and documentation.
>=20
> New features: functions and macros (*pack, *foreach, *string*, =
*alloc*)
>=20
> Security fixes: CVE-2013-6401
>=20
> Bugfixes:
> - Number parsing and overflows
> - Fix l_isxdigit() macro (#97).
> - Check for NULL key in json_object_get() and json_object_del() =
(#151).
> - Enhance hashtable seeding on Windows (#162).
> - json_unpack(): Allow mixing JSON_STRICT with optional keys (#162, =
#163).
> - Fix int/int32 mismatch (#142).
> - Parse subnormal numbers correctly (#202).
> - Fix a crash when parsing inputs consisting of very deeply nested =
arrays or objects (#282, #284).
> - Never convert numbers to integers in the parser when =
JSON_DECODE_INT_AS_REAL is set (#212).
> - Handle out-of-memory situations gracefully in the hashtable =
implementation (#298).
>=20
> Signed-off-by: Igor Socec <igor.socec@pelagicore.com>
> ---
> meta-oe/recipes-extended/jansson/{jansson_2.4.bb =3D> jansson_2.9.bb} =
| 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
> rename meta-oe/recipes-extended/jansson/{jansson_2.4.bb =3D> =
jansson_2.9.bb} (53%)
>=20
> diff --git a/meta-oe/recipes-extended/jansson/jansson_2.4.bb =
b/meta-oe/recipes-extended/jansson/jansson_2.9.bb
> similarity index 53%
> rename from meta-oe/recipes-extended/jansson/jansson_2.4.bb
> rename to meta-oe/recipes-extended/jansson/jansson_2.9.bb
> index c235729..455b374 100644
> --- a/meta-oe/recipes-extended/jansson/jansson_2.4.bb
> +++ b/meta-oe/recipes-extended/jansson/jansson_2.9.bb
> @@ -1,12 +1,12 @@
> SUMMARY =3D "Jansson is a C library for encoding, decoding and =
manipulating JSON data"
> HOMEPAGE =3D "http://www.digip.org/jansson/"
> LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D6946b728e700de875e60ebb453cc3a20"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D8b70213ec164c7bd876ec2120ba52f61=E2=80=9D

what changed in license?

>=20
> SRC_URI =3D =
"http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
>=20
> -SRC_URI[md5sum] =3D "c4629b89bf0432f3158c461e88fe0113"
> -SRC_URI[sha256sum] =3D =
"1fcbd1ac3d8b610644acf86a5731d760bb228c9acbace20a2ad0f23baec79b41"
> +SRC_URI[md5sum] =3D "84abaefee9502b2f2ff394d758f160c7"
> +SRC_URI[sha256sum] =3D =
"0ad0d074ca049a36637e7abef755d40849ad73e926b93914ce294927b97bd2a5"
>=20
> inherit autotools pkgconfig
>=20
> --
> 2.9.3
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_3ED6843F-9183-4A91-BD52-B2CFCC56D049
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlf3vBQACgkQuwUzVZGdMxQbvgCdEQhzbBJmpBNxwdWTosH762ZA
d58AoIYR9CHOR6hx1GG+AxLaveoQR79O
=LU1t
-----END PGP SIGNATURE-----

--Apple-Mail=_3ED6843F-9183-4A91-BD52-B2CFCC56D049--
