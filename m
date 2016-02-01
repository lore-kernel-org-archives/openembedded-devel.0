Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 94D71731EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 15:04:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r129so9551731wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 07:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8gazEPyyI+dsW0eSMyscFg9De4QACTE0nZMtyYSP3S0=;
	b=jnrIX9l4DhPz2+fDBSzAmfjGCcxCJ6sbRoQkxEgxycofjwhaBAnTARQTOKy1FgsAM1
	nfqMwUs1LTjb2O6Af0fBhpknE6ru/7e22IEZLBfq453JDJwx8AbQI8ccMKBXMdWfwtiU
	N9mw/jEEwfUIRr3pSPvKqDm1pcTvS4Q5rmv62XurzODmhQ2x6ztRNFWKcAJxFt8OwrZ2
	HUHh+K8LwDr6uM6e2fyp0AM4YJ5PJYmsTmYSR0/ScLnTdkuj0IjNHPPP1Fxrr0072wz2
	B/ivqvVJBZHYqBg/SLKSsiPA/6N3HZylcX8HGR1or+KxrY72+sI/ISGf9v18C4Pvu/bt
	WvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=8gazEPyyI+dsW0eSMyscFg9De4QACTE0nZMtyYSP3S0=;
	b=g1PI550VgDIbT5IwQTJJZAq/EY4C+XBDncXcmRaZ+YdJVRod1Mhi6JNyNuEWeWFjjq
	cb50mJ7NoTngknLYHqX+aIk5x+YyUc7a8GAhUs7nq0PBRTBw7LmArJq1d7a/K8nLCso+
	cp1sjdBZXNQMIHAYrzB0/wgnazCgZRN8EkvxpBF1XmI0binsJQM5CcsRNSo495QNkRr9
	meW+6vzWQJiSQoIHE8pTa8Xb4ILPCizmTKHQDpofp5Z/kM2nplFYSb7Yd8ao+R5r3wse
	pBU8a6M+EIZ5WqkVyERVPrk8BdF56xhzjUWqUlTkN8kJ4Rm9CqLA3OsI2drS/giYb4/a
	tYUg==
X-Gm-Message-State: AG10YOSJ+U3amqEMHfKOrEKH1q12MaaOgpWbZocybXfcrsYn0wE6AoduUwsbzbkrdxAidQ==
X-Received: by 10.28.45.73 with SMTP id t70mr11407463wmt.31.1454339064797;
	Mon, 01 Feb 2016 07:04:24 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ko2sm29474317wjc.9.2016.02.01.07.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 07:04:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2016 16:07:10 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160201150710.GC2639@jama>
References: <1453474271-26539-1-git-send-email-manuel.bachmann@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1453474271-26539-1-git-send-email-manuel.bachmann@iot.bzh>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: Re: [PATCH 1/2][meta-multimedia] gupnp: Update to 0.20.14
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
X-List-Received-Date: Mon, 01 Feb 2016 15:04:26 -0000
X-Groupsio-MsgNum: 59789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline

--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2016 at 03:51:11PM +0100, Manuel Bachmann wrote:
> From: Manuel Bachmann <mbc@iot.bzh>
>=20
> Update to latest version (required for latest Rygel).

Causes new QA warning:
gupnp-0.20.14: /usr/bin/gupnp-binding-tool_gupnp-dev contained in
package gupnp-dev requires /usr/bin/python, but no providers found in
its RDEPENDS [file-rdeps]

>=20
> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> ---
>  meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb |    8 -----=
---
>  meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb |    8 +++++=
+++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20=
=2E12.bb
>  create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20=
=2E14.bb
>=20
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb =
b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
> deleted file mode 100644
> index c8c6164..0000000
> --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.12.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require gupnp.inc
> -
> -SRC_URI =3D "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] =3D "c01aa6d3a78792b3a24591f036dd91f4"
> -SRC_URI[sha256sum] =3D "205d47b950a1b7190df1115f454cb38a44d71aacfec75d42=
87299e400e139b69"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f=
7e7 \
> -                    file://libgupnp/gupnp.h;beginline=3D1;endline=3D20;m=
d5=3Dd78a69d9b6e63ee2dc72e7b674d97520"
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb =
b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
> new file mode 100644
> index 0000000..ed07175
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
> @@ -0,0 +1,8 @@
> +require gupnp.inc
> +
> +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "63346ef90ac5cd925c3a941f51d8bca6"
> +SRC_URI[sha256sum] =3D "77ffb940ba77c4a6426d09d41004c75d92652dcbde86c84a=
c1c847dbd9ad59bd"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f=
7e7 \
> +                    file://libgupnp/gupnp.h;beginline=3D1;endline=3D20;m=
d5=3Dd78a69d9b6e63ee2dc72e7b674d97520"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlavdJ4ACgkQN1Ujt2V2gBwo2gCgi/suz2WUSYpSkQa/BDDOiu62
U74AnRxFszI1X2l+6KjRcY1tKi3ASWBt
=8Zxk
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
