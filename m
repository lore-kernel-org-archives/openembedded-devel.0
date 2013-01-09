Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TstVV-0005lb-MX
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 12:07:44 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so690547dak.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 02:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=fwkTRpcX6sogcooLHlU3K+Yvem2tF7GkGTzEmhUyq4k=;
	b=Y2Gy8Y+au5pZ/jl4RvRMyx9IFava2uRnE3xaFTdEyFaNpwDPQ8JHgEPSUttPfBLbLx
	24HFhCfhje8/4AGD5bIzUuChaVseAMH9KnvkPeHDn6GkhgrnzDPK9KJd+UV7sGxC8T+j
	99pB9f+AoXNmY7W2kKeOgn6NMp+tvJJ0/s0NBe00IZShuw4VS81ChsRc7NbW0u5+v3d6
	pwpFVCJ1ZiIOnr7G32lnC+E+OnYs3s4A7gIo+/zn1+BdIz/dcF3Kekb7PgPNrQXPpqyM
	ByuHrRtgS2IRow4bITVnFts+/WDhd/Da4cI7dzkbEaqWDLk3hfWg6y0PRSTrn4bPTs9D
	bJFQ==
X-Received: by 10.66.79.97 with SMTP id i1mr7197844pax.47.1357728749100;
	Wed, 09 Jan 2013 02:52:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id oi2sm41427690pbb.62.2013.01.09.02.52.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 02:52:27 -0800 (PST)
Date: Wed, 9 Jan 2013 11:52:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130109105232.GH3722@jama.palm1.palmone.com>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
	<1356098450-27475-5-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1356098450-27475-5-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][meta-multimedia][PATCH 5/6] wscan: add 20121111
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 11:07:44 -0000
X-Groupsio-MsgNum: 42591
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+G3HLlWI7eRTl+h"
Content-Disposition: inline

--k+G3HLlWI7eRTl+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2012 at 03:00:49PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../recipes-dvb/wscan/wscan_20121111.bb            |   16 ++++++++++++++=
++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb
>=20
> diff --git a/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb b/meta-m=
ultimedia/recipes-dvb/wscan/wscan_20121111.bb
> new file mode 100644
> index 0000000..9254c43
> --- /dev/null
> +++ b/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Wscan is an ATSC/DVB-C/S/T channel scanner that doesn't req=
uire an initial frequency table"
> +HOMEPAGE =3D "http://wirbel.htpc-forum.de/w_scan/index2.html"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4fa=
63a"
> +
> +SRC_URI =3D "http://wirbel.htpc-forum.de/w_scan/w_scan-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "30da05747fed9988e11ebc7745f5e71f"
> +SRC_URI[sha256sum] =3D "5e51e5f1c124a8ed70608b4dbf7376adb2b1bf6a48a65b74=
6076263b2589afe5"
> +
> +S =3D "${WORKDIR}/w_scan-${PV}"
> +
> +inherit autotools
> +
> +FILES_${PN} +=3D "${datadir}"

Some other changes in oe-core/meta-oe broke this wscan version too :/
| scan.c: In function 'set_frontend':
| scan.c:1819:44: error: 'DTV_DVBT2_PLP_ID' undeclared (first use in this f=
unction)
| scan.c:1819:44: note: each undeclared identifier is reported only once fo=
r each function it appears in
| make[1]: *** [scan.o] Error 1

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/qemuarm/20130=
109091926.log

Cheers,

> +
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k+G3HLlWI7eRTl+h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtS/AACgkQN1Ujt2V2gBwNqQCgk8p71fN1rRWWezv7LyUrqgXk
HPIAmwaEFnNzwwSn/UcyP5osMpntAUCw
=QQkm
-----END PGP SIGNATURE-----

--k+G3HLlWI7eRTl+h--
