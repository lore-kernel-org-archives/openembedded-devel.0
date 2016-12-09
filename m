Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 91AB671CAA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Dec 2016 21:41:19 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so5882036wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2016 13:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SrFz57SLg+RLl2gfmzxofTDHlRmiK6oV46OULKBXYTo=;
	b=nTjJeHDYcIyD5Lm6bQauj3xNn2UKimrH3axQGA7dz4ETd/e0NOclP9ze+Q9Kgc0/L9
	F47YU0nEzpY70ZTulBnne8hjoq1L5hp9KJ4fjSRS/j+LZLdZTAj7BbrCVzBHD4xp6zVJ
	/+wYWR7xOl8IZdl70hOB7C/aXUAHfWdxTRmuI17S1Mwdt6YbHg4lfdEGU8tPFk6k+2kg
	PmmhzJxUVJqqxSCW5g8TOLBPI5cOL1Bp+KTJ2YgZjuUmi8PE09LkqwZlLXuqDEraHeZk
	KeCj6axDc+zDr7x0O2YZFrMXkNz+AuXrBMlkkOJw6LjrJUUUcogxKKAqa5T3Nd0MAs/x
	l3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SrFz57SLg+RLl2gfmzxofTDHlRmiK6oV46OULKBXYTo=;
	b=T8WJaFtHBhQrYEmcRWB1mIepFiwBueoLy9jFCctiRrfPg163XevE3hzV6mDYwCk24i
	pzTHVb13Qpk3oCcLju0YHxlkFLlNI3K/6dtmPIyfKHXhV+RPw9E9Xs7medM8lDYEb0q4
	HhiqCdaTPmBlCfOzqEFNI/HMkuaIZpF13h7bsu4tck5eHYsVGAY+ZBtpMVg+ZeRiOAUl
	FSLCtbIXRmDndIHtVrW3CcJopM7eV6q7GiXZZ20aJSDrn73gz857SJmBfHZfewT6LS/p
	ADHC4dd7CWb1bpNTGihPt74X0AFJlsVS1c8AlngU5tWwmhdJ0uFZUM9yN+xmKvIGYYsE
	Teiw==
X-Gm-Message-State: AKaTC00UGMwMnB7fui4FlL4SgePmsLNs9COY1/XMgnFReif1y56zCY+95CotqyGO5is1LQ==
X-Received: by 10.28.165.2 with SMTP id o2mr312029wme.38.1481319680631;
	Fri, 09 Dec 2016 13:41:20 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ba10sm44283469wjb.32.2016.12.09.13.41.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Dec 2016 13:41:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Dec 2016 22:41:21 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161209214121.GF3327@jama>
References: <20161206023625.12901-1-raj.khem@gmail.com>
	<20161206023625.12901-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161206023625.12901-3-raj.khem@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH 5/7] liboop: Add recipe
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
X-List-Received-Date: Fri, 09 Dec 2016 21:41:21 -0000
X-Groupsio-MsgNum: 64277
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RE3pQJLXZi4fr8Xo"
Content-Disposition: inline

--RE3pQJLXZi4fr8Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2016 at 06:36:23PM -0800, Khem Raj wrote:
> liboop is needed by ruli

liboop-1.0: liboop rdepends on readline, but it isn't a build dependency, m=
issing readline in DEPENDS or PACKAGECONFIG? [build-deps]
liboop-1.0: liboop rdepends on libpcre, but it isn't a build dependency, mi=
ssing libpcre in DEPENDS or PACKAGECONFIG? [build-deps]
liboop-1.0: liboop rdepends on glib-2.0, but it isn't a build dependency, m=
issing glib-2.0 in DEPENDS or PACKAGECONFIG? [build-deps]

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/liboop/liboop_1.0.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-oe/recipes-support/liboop/liboop_1.0.bb
>=20
> diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.bb b/meta-oe/recip=
es-support/liboop/liboop_1.0.bb
> new file mode 100644
> index 0000000..1af228e
> --- /dev/null
> +++ b/meta-oe/recipes-support/liboop/liboop_1.0.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Liboop is a low-level event loop management library for=
 POSIX-based operating systems"
> +HOMEPAGE =3D "http://liboop.org/"
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8b54f38ccbd44feb80ab90e01af8b=
700"
> +
> +SRC_URI =3D "http://ftp.debian.org/debian/pool/main/libo/liboop/liboop_$=
{PV}.orig.tar.gz"
> +
> +SRC_URI[md5sum] =3D "36cb971047d3af02369446f5e0b315a2"
> +SRC_URI[sha256sum] =3D "34d83c6e0f09ee15cb2bc3131e219747c3b612bb57cf7d25=
318ab90da9a2d97c"
> +
> +inherit autotools pkgconfig
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RE3pQJLXZi4fr8Xo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEslAAAKCRA3VSO3ZXaA
HBloAJ4pE6YJ2QSL+47k7us8ptXz6pSbMACeNjXy8zDo301SPOQ1SqSAyv63w8g=
=xuQN
-----END PGP SIGNATURE-----

--RE3pQJLXZi4fr8Xo--
