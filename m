Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7D96FFEA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:43:43 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id uo6so441992511pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 10:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=Z+Zc53Ku+xC/AhMEhWbiOr90EXWgLrjeW4O+gYvpdNI=;
	b=IlhRJFUPA9zXzVwGF1uXMxXW6idVEc3QlehBrmQU1hN29FVJynY7S9ytbbVO2yHM/F
	BW0hXOG2Egjpr24vsoIXCHu+jJbjSBtwkQvj2aR4wB0SEY8VJmPqsL0XjSYs0Rcw2LUP
	hoNcKrFWDxUB1OuKRRvc80ezQ0ARda3Zg2B2bXCxAtxe+rOoYK+rrXmChGVEwYubZVeG
	DeIS5GiSdRdQY6S8DsUfb+V3hXavP8JUcb0uq/6ttTNBRxJQzsiVEc73t1bTBkTv27jp
	Hd842104eFMhaepvffA0JBvrnqcCMl9MGw+3KtX95k1DEdv3zxIO01YBlODyeoUtM0iF
	VutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=Z+Zc53Ku+xC/AhMEhWbiOr90EXWgLrjeW4O+gYvpdNI=;
	b=YJl0H28MPHUAoGbWCN5wDDguQAxYXJn9wYwdMHWk+tOgS5ZKxqrTYM3/eYGsJSSfDw
	pM+gJjKVcFranVTN5+gUECZP6kWh2ZHTEnKA74ZZitZE4wmiZh9K8WwN/TDv0KdyAp5j
	4+JUVQzGqKjxf6nLCHQXR9ea3TmQ0Q6ovfLaXhqFKBcbSYbs6JWcz4MLA3WSEGZfxUax
	a2t6Q1COY0ABFfKKczDG8HXdLkDWD2StDZ+Jac5gP5BvEfmwy6uNsfJYeu3+moOZ8LSa
	Qbpjqk3YK3jgXqjMIsS22qEKsgxyGpRKEkGIBe6w32Fnnt0kpYh3QzW78hJJoGgMsoAV
	bPkw==
X-Gm-Message-State: ALoCoQlsFKQNtlAaC1JYZj5E+XObXPcb5C90I5o/vozXdzMROFw9mPNztne+0id46aQ2W9hKim7UkE1gF7Ein8wbxNeGiD69sA==
X-Received: by 10.66.120.200 with SMTP id le8mr46496812pab.61.1453229024601;
	Tue, 19 Jan 2016 10:43:44 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:2cdb:35b7:1df4:399a?
	([2601:646:8802:5d5c:2cdb:35b7:1df4:399a])
	by smtp.gmail.com with ESMTPSA id
	73sm43212981pfm.10.2016.01.19.10.43.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 10:43:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453217976-27313-1-git-send-email-philip@balister.org>
Date: Tue, 19 Jan 2016 10:43:39 -0800
Message-Id: <B4D9EF0F-52D7-4425-999C-B32D50EC72AE@gmail.com>
References: <1453217976-27313-1-git-send-email-philip@balister.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-oe][PATCHv3] thrift: Add recipe for Apache Thrift.
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
X-List-Received-Date: Tue, 19 Jan 2016 18:43:44 -0000
X-Groupsio-MsgNum: 59599
Content-Type: multipart/signed;
	boundary="Apple-Mail=_091F1B36-BA29-452E-97CB-55D392351AB4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_091F1B36-BA29-452E-97CB-55D392351AB4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 19, 2016, at 7:39 AM, Philip Balister <philip@balister.org> =
wrote:
>=20
> * Run tested cpp bindings with GNU Radio Control Port.

Thrift has compiler framework so I think it should go into =
recipes-devtools
also make it more granular on packaging the compiler separately then the =
libraries
and bindings.

>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
> .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 34 =
++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
> create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb =
b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
> new file mode 100644
> index 0000000..7c8f407
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "Apache Thrift"
> +DESCRIPTION =3D  "A software framework, for scalable cross-language =
services development"
> +HOMEPAGE =3D "https://thrift.apache.org/"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3De4ed21f679b2aafef26eac82ab0c2cbf"
> +
> +DEPENDS =3D "thrift-native boost python libevent flex-native =
bison-native \
> +           glib-2.0 openssl"
> +
> +SRC_URI =3D =
"git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=3Dhttps \
> +"
> +SRCREV =3D "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
> +S =3D "${WORKDIR}/git"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +inherit pkgconfig cmake pythonnative
> +
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +export BUILD_SYS
> +export HOST_SYS
> +
> +EXTRA_OECMAKE =3D "-DWITH_QT4=3DOFF -DWITH_QT5=3DOFF"
> +EXTRA_OECMAKE_class-native =3D "-DWITH_QT4=3DOFF -DWITH_QT5=3DOFF \
> +             -DBUILD_TESTING=3DOFF -DBUILD_EXAMPLES=3DOFF =
-DWITH_CPP=3DOFF"
> +EXTRA_OECMAKE_class-nativesdk =3D "-DWITH_QT4=3DOFF -DWITH_QT5=3DOFF =
\
> +             -DBUILD_TESTING=3DOFF -DBUILD_EXAMPLES=3DOFF =
-DWITH_PYTHON=3DOFF"
> +
> +do_install_append () {
> +	ln -sf thrift ${D}/${bindir}/thrift-compiler
> +}
> +
> --
> 2.5.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_091F1B36-BA29-452E-97CB-55D392351AB4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaeg94ACgkQuwUzVZGdMxT0PgCfRZJpG6YMP+GLm1yBju71TcTf
r+4An1mXAXvZeypEyh4H1y7pFuvFL15O
=DqVA
-----END PGP SIGNATURE-----

--Apple-Mail=_091F1B36-BA29-452E-97CB-55D392351AB4--
