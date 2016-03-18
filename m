Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF116FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 16:00:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p65so7553920wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/K6zCl55RwnLbzP/ZIMbjlxTYxDUhuiJhszxCi96VD8=;
	b=JQQc9sNvLCReCSn07PorNH02RZHvctcLcRTXR71OxqvXcGTO/7s4ojW/3x1m3KIf83
	qNGbxQ9KlPpbYHnRB6yXMrnvvO/2fnyUgdvjScsiyfUHG5G2n2CeGW06Z7/Wm/c7O6M0
	Qro8p1R3+O4qqtL5PnU/i6c2dd/iq0gFYj1yJuM+rBy/q4dMJL6OH3R/6ryUyhtTK923
	sInAZ3yfpXgLSCGSZ9aXzJnsJesUBE3249YpRwpN25beNAoIDBBWdsgieb2jUGPt+te3
	ZtrIPGaWsZ2zYPtliBHEjEDMpr9RYzRvSG47rWRlArjrfsbOL124gai83xTZjOFMhg/T
	+xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/K6zCl55RwnLbzP/ZIMbjlxTYxDUhuiJhszxCi96VD8=;
	b=N3kd4fxQPlEK09HwX+AcyBjqoHOiL1WWbXr+qCWVQlMKht9A//lN7zazlvRyi9bHCJ
	2Zw/8D3uO857T1HPa99TpKl+WejSCf2gjL5MntpN1CB2PSccxY8j0qDPlJRt4DodVUmv
	BwfIXQB5dllXsi6u4Dx3Lt6u65xP3l0KYbnZZ4FAEK8U5AMnZFHADxLtk6eDxCJW7Jsm
	TS72YBOrCEaYsh48+mQTfEorcMbVSYnpFFWD2aQp2tW5eHtjXe3sPNfBXFFaD4TzMtG4
	pDQYXgMgiTQ8ZAuKMf4CtVUJZmRMh09QDPHqOhn/sLSgIxkYTKVt4eGIvYddfouUjRvw
	sJOg==
X-Gm-Message-State: AD7BkJKLpDiLcVq1qYZs5xf6tCAeet9CWXceGgo7DAcz+da7xoAuA4Upu6GkFSqkbtNqJg==
X-Received: by 10.28.4.75 with SMTP id 72mr139064wme.78.1458316836616;
	Fri, 18 Mar 2016 09:00:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 63sm13291893wms.1.2016.03.18.09.00.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 09:00:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Mar 2016 17:04:31 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160318160431.GC2555@jama>
References: <1458313594-11011-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1458313594-11011-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] ttf-pt-sans: add recipe
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
X-List-Received-Date: Fri, 18 Mar 2016 16:00:37 -0000
X-Groupsio-MsgNum: 60576
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline

--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2016 at 05:06:34PM +0200, Ioan-Adrian Ratiu wrote:
> PT Sans is an open source licensed font released in 2010 by ParaType.
> The ParaTypeFFL-1.3 license file has been submitted to OE-core.
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb  | 39 ++++++++++++++++=
++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
>=20
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> new file mode 100644
> index 0000000..dcfa080
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "PT Sans Fonts"
> +DESCRIPTION =3D "The PT Sans TTF font set"
> +HOMEPAGE =3D "http://www.paratype.com/public/"
> +
> +SECTION =3D "x11/fonts"
> +
> +LICENSE =3D "ParaTypeFFL-1.3"
> +LIC_FILES_CHKSUM =3D "file://../PT%20Free%20Font%20License_eng.txt;md5=
=3Dd720f3a281ed81c3f4cfc465e11b1d0d"
> +
> +inherit fontcache

Still missing layer.conf additions.

Use 4 spaces for indentation.

> +# Downloading from fedora because upstream doesn't version its zip file
> +# and causes hash build failures
> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/paratype-pt-sans-fo=
nts/PTSans.zip/c3f5a0e20a75cf628387510a720924a7/PTSans.zip"
> +
> +SRC_URI[md5sum] =3D "c3f5a0e20a75cf628387510a720924a7"
> +SRC_URI[sha256sum] =3D "0164f824e03c32c99e8a225853ec168893a04a09ade132e9=
3a674e85ae033b2e"
> +
> +do_install () {
> +	install -d ${D}${datadir}/fonts/X11/TTF/
> +	cd ..
> +	for i in *.ttf; do
> +		install -m 0644 $i ${D}${prefix}/share/fonts/X11/TTF/${i}
> +	done
> +}
> +
> +FILES_${PN} +=3D "${datadir}"
> +
> +pkg_postinst_${PN} () {
> +        set -x
> +        for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
> +                mkfontdir $fontdir
> +                mkfontscale $fontdir
> +        done
> +        for fontdir in `find $D/usr/share/fonts/X11 -type d`; do
> +                mkfontdir $fontdir
> +                mkfontscale $fontdir
> +        done
> +}
> --=20
> 2.7.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbsJw8ACgkQN1Ujt2V2gBwRVACfRYchprK8DLu6vZHGP02KjQ0I
XeoAnizyWjtjYWefeOfYa9GCdN6sbgB3
=pR7R
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
