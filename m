Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 914B4607A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:51:06 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id zm5so9489106pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=nqO1/V5fAel+dIsn/2ZYhBT/b+53i3orik5PBtGgbnw=;
	b=WbQfPnzyxLuo2zDwWPaBrhDXM0Mm2+Osq3FWu5uNqZ5jjc7rD4okGhGUioq02ywJHR
	1xctL+fH9ZallGdVJdFQ/PhlKmjO2aRY83ruMrlEk+hGoJgBH9xXhGVvY/q1dB8hFYTz
	U+XiQ1ljUV9RVLDk19nlFIn/tDi2kZGZKjRhfbn20lca3dQ2kqQadB2y1SBk5TFY02k5
	bkQhzxBHWWEQlArJRAbp+Xn2PBvIoVS6Lp2HIi3la4iS0K1Tkt5kIwu9ShydcHoBcTrU
	v2QnB4Dy/rQqs5h1B+fT54/SbwLXDm6fPX7YnuJxqF8UAwtc7zZ1rEeJbpaz6W7lbnm7
	1bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=nqO1/V5fAel+dIsn/2ZYhBT/b+53i3orik5PBtGgbnw=;
	b=S1TBjTeqzUUg+8l6aW/liAcJKhaqy+Yc/wqfDIevu/7nYt1r4SKc/gJ3ntpV4BaOU8
	DD/VfLPIu1v+1ybh6uToS7lb/7dXmoqeZ4fl8iGEZYYWiUXr8o/7R/27NDAIf5mKHxeg
	cle72KRtd7nL28YhUPWYNumsUbuWdK8qlwxK4a/Y07RlwlYxs5bldu8XpHhD55hfbfbh
	DfzRiF/Jq0sun1ZOnstZnBHPrd/dLsteHJNv1sQOKDbLG5DyLfdGKVheGwHOQqvj/p4/
	OlN9LQda4FWmsOAvIPN9J/X2m1kgLPvT3Vo5JzOh0MpnhA917WCh0L1JU/T2l6FpcDKy
	J1VQ==
X-Gm-Message-State: AOPr4FXMdkKeJCgInj5BFSEoBERtxsgJcrzn/g34MQe/tzABZms4EGUuy0RXkf4k5SGSGw==
X-Received: by 10.66.149.194 with SMTP id uc2mr5110518pab.116.1461689462898;
	Tue, 26 Apr 2016 09:51:02 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:b93e:176b:d03b:ac8e?
	([2601:646:8800:5a9a:b93e:176b:d03b:ac8e])
	by smtp.gmail.com with ESMTPSA id
	e87sm38305452pfb.76.2016.04.26.09.51.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 09:51:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1461660218-2313-1-git-send-email-daicy.fnst@cn.fujitsu.com>
Date: Tue, 26 Apr 2016 09:50:54 -0700
Message-Id: <CEC3C9D8-666A-4041-91D5-5BBD1ECECC1B@gmail.com>
References: <CAJTo0LYJ=9m9z4-4pE6dD2mRZNGVzGte5ktCYEWP4Bw58qAd6w@mail.gmail.com>
	<1461660218-2313-1-git-send-email-daicy.fnst@cn.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH v3] hwdata: add new recipe
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
X-List-Received-Date: Tue, 26 Apr 2016 16:51:08 -0000
X-Groupsio-MsgNum: 61181
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A011A68A-8020-4FEE-8DCA-0F19F5CC0593";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A011A68A-8020-4FEE-8DCA-0F19F5CC0593
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 26, 2016, at 1:43 AM, Dai Caiyun <daicy.fnst@cn.fujitsu.com> =
wrote:
>=20
> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
> meta-oe/recipes-support/hwdata/hwdata_0.288.bb | 21 =
+++++++++++++++++++++
> 1 file changed, 21 insertions(+)
> create mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.288.bb
>=20
> diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.288.bb =
b/meta-oe/recipes-support/hwdata/hwdata_0.288.bb
> new file mode 100644
> index 0000000..67199e9
> --- /dev/null
> +++ b/meta-oe/recipes-support/hwdata/hwdata_0.288.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "Hardware identification and configuration data"
> +HOMEPAGE =3D "http://git.fedorahosted.org/git/hwdata.git"
> +SECTION =3D "System/Base"
> +
> +LICENSE =3D "GPL-2.0+"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D1556547711e8246992b999edd9445a57"
> +SRC_URI =3D =
"https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "f3fa1c5edb66ce5b376d95e772b2d303"
> +SRC_URI[sha256sum] =3D =
"56fc26275b102e538fcfcf9c1093a09f476a1ea8d4e0c733d3c578442923693d"
> +
> +do_configure() {
> +    ${S}/configure --datadir=3D${datadir} --libdir=3D${libdir}
> +}

is it using autotools ? if so then inherit autotools might be a good =
options
and remove the do_ functions here.

> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +FILES_${PN} =3D "${libdir}/* \
> +               ${datadir}/* "
> --
> 1.9.1
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_A011A68A-8020-4FEE-8DCA-0F19F5CC0593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcfnHUACgkQuwUzVZGdMxT9OQCfYyQ+0pvBRKRdHS9fpaODZX6/
uCUAn0m6TnSX1ILl+RVn93li0DPrBC6a
=GikG
-----END PGP SIGNATURE-----

--Apple-Mail=_A011A68A-8020-4FEE-8DCA-0F19F5CC0593--
