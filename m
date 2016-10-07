Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C018C607A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 15:13:19 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 190so3010538pfv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=qEfdXw5PXbZwkpdE/XHpzPlQ+zCRK/IXXeSoFiG7MSA=;
	b=fJPoc6b4NwEczyfU/E78a6Qo0fn376EZZa6+4Tdu/vg8Ism707tkbZr99+zZ3PYMn5
	DZISs4NEeJoikB6mPgAlRQWI+nwEqS+SptXgSnyphmXImM/exAU5yUBgpHDz4j1yoAfp
	77b8weN4wC2DM2sxySSnLGvYF/5uJGc2WS401fS+fSVh1eBfKYqMKo9jPT87YE3Sqkrh
	W9L4zrD5YEwuYeLXx92TfAeD/vNEZVvo8BCTbKD8a5rlA394IKtGgDPdVudG4I6wy9JM
	1hh/0QxTW1bnsAvuINB1YiHXlvxsjQfrqnYCHFYpAQhYvENi22Ao7wGfW3PKUV4xiILO
	JIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qEfdXw5PXbZwkpdE/XHpzPlQ+zCRK/IXXeSoFiG7MSA=;
	b=byDcH8kvB41AwXH7R02hU7j0IVHIUUGZyZDQ6YZB5ocOFH3DYG+TkeWCbvPB9tNL3T
	XdlDDrt0VXf50IXFqf/ERQHNo6U1sKqSHNZ3erWjBC9WwWu6GVLwRv4skfrnQQiVuITU
	EuUJGrRNcK4tdFrBFCnbWKgFRPx5gQV8gNIgaiwtGOJWMq4HETWcv2bR8q7OVuKdlkEc
	lOZpDDIXJUjHX9PNwg2SCzAXO8aRgDnKxoLQ8v7oeJF2LNWpR63ZMlqjjZ6HgNGMBJD2
	6PW1UTeOxrqDij0D5cAevpGmt+Vd3Wl2ooBReUfmprKz4Lq4opiulxv/Mt7O403E+KPE
	agVw==
X-Gm-Message-State: AA6/9Rk9syD7Jg00DxBotEPdcZ6xwq8KmXum38QPBjr1o/ZoRxaa8fGlpVjb8XowgGdyKA==
X-Received: by 10.98.43.17 with SMTP id r17mr29156556pfr.115.1475853200860;
	Fri, 07 Oct 2016 08:13:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:cd9d:6261:adca:4b85?
	([2601:646:8882:b8c:cd9d:6261:adca:4b85])
	by smtp.gmail.com with ESMTPSA id
	t190sm14262259pfb.34.2016.10.07.08.13.19
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Oct 2016 08:13:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <d2f7c268-61e6-04b1-07ea-7c749f2e5ca6@linux.vnet.ibm.com>
Date: Fri, 7 Oct 2016 08:13:18 -0700
Message-Id: <632342F2-FCE2-44B6-A188-1A4173637BA1@gmail.com>
References: <1475789066-4308-1-git-send-email-msbarth@linux.vnet.ibm.com>
	<ADEE5812-4155-4506-B9A5-3029E3B58CDB@gmail.com>
	<d2f7c268-61e6-04b1-07ea-7c749f2e5ca6@linux.vnet.ibm.com>
To: msbarth <msbarth@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3124)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 07 Oct 2016 15:13:19 -0000
X-Groupsio-MsgNum: 63412
Content-Type: multipart/signed;
	boundary="Apple-Mail=_002F0F83-EA5F-48C3-9F2C-B45708C879D9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_002F0F83-EA5F-48C3-9F2C-B45708C879D9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 7, 2016, at 7:58 AM, msbarth <msbarth@linux.vnet.ibm.com> =
wrote:
>=20
>=20
>=20
> On 10/06/2016 06:49 PM, Khem Raj wrote:
>>> On Oct 6, 2016, at 2:24 PM, Matthew Barth =
<msbarth@linux.vnet.ibm.com> <mailto:msbarth@linux.vnet.ibm.com> wrote:
>>>=20
>>> Signed-off-by: Matthew Barth <msbarth@linux.vnet.ibm.com> =
<mailto:msbarth@linux.vnet.ibm.com>
>>> ---
>>> meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc     | =
7 ++++---
>>> ...toconf-archive_2012.04.07.bb =3D> autoconf-archive_2016.09.16.bb} =
| 6 +++---
>>> 2 files changed, 7 insertions(+), 6 deletions(-)
>>> rename =
meta-oe/recipes-devtools/autoconf-archive/{autoconf-archive_2012.04.07.bb =
=3D> autoconf-archive_2016.09.16.bb} (61%)
>>>=20
>>> diff --git =
a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc =
b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>>> index 9399363..2b5df70 100644
>>> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>>> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>>> @@ -1,15 +1,16 @@
>>> +SUMMARY =3D "A collection of macros for GNU Autoconf"
>>> +DESCRIPTION =3D "The autoconf-archive set of macros extend the =
pre-defined \
>>> +capabilities within the complete autoconf tool set."
>>> LICENSE =3D "GPLv3"
>>> HOMEPAGE =3D "http://www.gnu.org/software/autoconf-archive/" =
<http://www.gnu.org/software/autoconf-archive/>
>>> SECTION =3D "devel"
>>> -
>>> DEPENDS +=3D "m4-native"
>>> DEPENDS_class-native =3D "m4-native gnu-config-native"
>>> DEPENDS_class-nativesdk =3D "m4-nativesdk gnu-config-nativesdk"
>>> -
>>> RDEPENDS_${PN} =3D "m4 gnu-config"
>>> RDEPENDS_${PN}_class-native =3D "m4-native gnu-config-native"
>>> RDEPENDS_${PN}_class-nativesdk =3D "m4-nativesdk =
gnu-config-nativesdk"
>>>=20
>>> -SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
>>> +SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>>>=20
>>> inherit autotools
>>> diff --git =
a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb=
 =
b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb=

>>> similarity index 61%
>>> rename from =
meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
>>> rename to =
meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>>> index 5baaecc..da648c2 100644
>>> --- =
a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb=

>>> +++ =
b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb=

>>> @@ -1,13 +1,13 @@
>>> require autoconf-archive.inc
>>>=20
>>> -
>>> PARALLEL_MAKE =3D =E2=80=9C"
>> Do we still need this ?
> Most likely for this package, no. I have built successfully a few =
times without, however since this was likely originally added due to a =
race condition that doesnt conclude it can be removed, so I left it in.

sometimes fixes may have landed upstream which fixes such issues. So we =
can get rid of it. if it does not cause the issue with parallel builds =
anymore
may be it should be removed

>>> LICENSE =3D "GPLv2 & GPLv3"
>>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504" =
<file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504>
>>>=20
>>> -SRC_URI[md5sum] =3D "e842c5b9fae021007bd70550362e5e80"
>>> -SRC_URI[sha256sum] =3D =
"040b443bf68efd52fbfcb294b556bfbbbfe432db78445ca25e0cfe2e88f96a14"
>>> +SRC_URI[md5sum] =3D "bf19d4cddce260b3c3e1d51d42509071"
>>> +SRC_URI[sha256sum] =3D =
"e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
>>>=20
>>> EXTRA_OECONF +=3D "ac_cv_path_M4=3Dm4"
>>> +
>>> BBCLASSEXTEND =3D "native nativesdk"
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>=20


--Apple-Mail=_002F0F83-EA5F-48C3-9F2C-B45708C879D9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEUEARECAAYFAlf3u44ACgkQuwUzVZGdMxTEIwCXRRv6exBkkryNgXgRrEEYcJh3
1gCePFEG7kvznQRga082pbtpJNMqtUo=
=d1t0
-----END PGP SIGNATURE-----

--Apple-Mail=_002F0F83-EA5F-48C3-9F2C-B45708C879D9--
