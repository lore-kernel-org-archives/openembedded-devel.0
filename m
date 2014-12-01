Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 34A2D72201
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 13:33:25 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y19so14108114wgg.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 05:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VrspjRXEeo/2pGRKdQTrzIEqqSiKX6pN8zhlNkIXfnU=;
	b=hsNA31S0wMJtWwBtA85jYjTeEyFab/NrVQQX01x2Wltuwa/ihxLiZES0ygtdP/cKYG
	XqldI7OT9Gl8DuN3MTzyndpD3odyKIrO8/MOPCReF+ZhpzUfLyk0eQiTxg/9Ch8QCxZQ
	2+5cXmRR4tIx9Ry/8YvQpa8HJbpywhGUT9Rc1mgtR6WDw5rcHRNHW2sERvwwpSoxtyu9
	xvUEmdMIoqP529QltItKypMCDFTsLA5cabb21scr28/0xRKmf6AbOBoOb0Wp0qAGI9OZ
	LiNALFjTyy9U7DxZfhcPUqK3G0WDmdB+yqnixR7SP+zIKJLW6GWtSi7ax14wZQg/3wDT
	apnA==
X-Received: by 10.195.12.136 with SMTP id eq8mr90326198wjd.77.1417440803308;
	Mon, 01 Dec 2014 05:33:23 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	he3sm27617660wjc.15.2014.12.01.05.33.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 05:33:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Dec 2014 14:33:24 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141201133324.GB2466@jama>
References: <mailman.1269.1417437531.1406.openembedded-devel@lists.openembedded.org>
	<CAHPquwN5-Zy9=9rjZ-ktxibXX8VepN19qqu2JFRbkKMMsP_1fw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHPquwN5-Zy9=9rjZ-ktxibXX8VepN19qqu2JFRbkKMMsP_1fw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
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
X-List-Received-Date: Mon, 01 Dec 2014 13:33:36 -0000
X-Groupsio-MsgNum: 53125
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2014 at 05:27:15PM +0400, Petr Nechaev wrote:
> Updated comments to avoid confusion

This was meant only for master-next, right?

I've squashed it there to the update. Thanks

> ---------- Forwarded message ----------
> From: <openembedded-devel-owner@lists.openembedded.org>
> Date: Mon, Dec 1, 2014 at 3:38 PM
> Subject: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
> To: petr.nechaev@cogentembedded.com
>=20
>=20
> Only members may post to the list. Please subscribe and post again.
>=20
>=20
>=20
> ---------- Forwarded message ----------
> From: Petr Nechaev <petr.nechaev@cogentembedded.com>
> To: openembedded-devel@lists.openembedded.org
> Cc: Petr Nechaev <petr.nechaev@cogentembedded.com>
> Date: Mon, 1 Dec 2014 16:38:48 +0400
> Subject: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
> Updated comments to avoid confusion
>=20
> ---
> Petr

> From 215b81d31a9f78a6da3ee2ae070d3b82bdb5ea44 Mon Sep 17 00:00:00 2001
> From: Petr Nechaev <petr.nechaev@cogentembedded.com>
> Date: Mon, 1 Dec 2014 15:28:34 +0300
> Subject: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
>=20
> ---
>  conf/distro/include/qt5-versions.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/q=
t5-versions.inc
> index 7530a24..71ece94 100644
> --- a/conf/distro/include/qt5-versions.inc
> +++ b/conf/distro/include/qt5-versions.inc
> @@ -1,5 +1,5 @@
>  # Select which version you prefer by defining QT5_VERSION and including =
this file
> -# possible values now "5.3.2", "5.3.0+5.4.0-alpha1+git"
> +# possible values now "5.3.2", "5.3.0+5.4.0-rc1+git"
> =20
>  QT5_VERSION ?=3D "5.3.2"
> =20
> --=20
> 1.9.3
>=20

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlR8biQACgkQN1Ujt2V2gBwPgACgkVedlxbBkXqIDNCb8y6NVjdG
FFAAmwR2hHT/8lO+UzujuXwScC2s8/9Z
=ePGO
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
