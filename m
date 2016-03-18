Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E5285602D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 13:30:14 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so31410990wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dKL+ngHowSQo8PONTmmJ+H8iZiRmXpC06Nb1CBGhfM0=;
	b=KGxyYcLweAEDAmJA3ob8cxriKXf2pu5gPup7UHHiGG3tj2lxDq+gcGyqP07v7pg0gO
	9r0WxuYud/lfaTJOZBxQ+G+8TE72NMnwYVFPZRvAbHELgkbBKkR2PLNEq8h66bpVncQL
	0YV+PxOfnLCOhwQAgNxy1LdI7dwIj4+rbGdpLh5YQD45RVbUh+r0owgKhzfsXrbNbWe9
	UIncQY0YQOchTfxB67AfrNs+cy7lSnh6P2CSqNJVJdS4tjgDc2iOSH8YrY1quM2dlexx
	Zhzek8kn7YQeN+alK9eVrl86AefjI2ObK+DwqLTHA8Vg7HxwxUXV73dEjCaFJ3MZ4Onc
	U0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dKL+ngHowSQo8PONTmmJ+H8iZiRmXpC06Nb1CBGhfM0=;
	b=HLI1oA+i2qxk03Kn6PP04D/QH/ABuLsb2KdxdD4ZkEoAz5UbWk5rU+FyWjOO0+SVdK
	LB/XMJkv9rGaMMexuqnnuur5oX/dqKpoISSjJB7SCbqGXvg1I0L9G0hmzEs8JAQjuhZ3
	LCn1dyvQLjwREMajLXv+V/3DrBNM8hy+aESrhGUTauvd/Q8+H0A5D1tD7Bp4+X8bOr5i
	LSIH5FP/+ApnA39vbaipXbM57GUeDJtrLvutye+F4DYUdnyMU1F7LLYIpZ7XU1I/30M6
	IwicEDmPWaKltWW/wUpfYqeA0+ljiGtprLgd+GJy4N8USV5jyzAzoGSoMqXeBQzikCnW
	8acA==
X-Gm-Message-State: AD7BkJJeySNdsdngx9C1uxKP84YpSG42A89NxZojCayf+g2QHbMQRvmBhogPNPOeeC4NCQ==
X-Received: by 10.28.186.214 with SMTP id k205mr43437095wmf.23.1458307814881; 
	Fri, 18 Mar 2016 06:30:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c144sm34795544wmd.12.2016.03.18.06.30.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 06:30:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Mar 2016 14:34:10 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160318133410.GB2555@jama>
References: <1458305944-3510-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1458305944-3510-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] ttf-pt-sans: add recipe
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
X-List-Received-Date: Fri, 18 Mar 2016 13:30:15 -0000
X-Groupsio-MsgNum: 60570
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2016 at 02:59:04PM +0200, Ioan-Adrian Ratiu wrote:
> PT Sans is an open source licensed font released in 2010 by ParaType.
> The ParaTypeFFL-1.3 license file has been submitted to OE-core.
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb  | 44 ++++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
>=20
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> new file mode 100644
> index 0000000..b7f4548
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
> @@ -0,0 +1,44 @@
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
> +inherit allarch fontcache

This cannot be allarch when it depends on TUNE_PKGARCH fontconfig, see
layer.conf and send v2.

> +RDEPENDS_${PN} =3D "fontconfig-utils"

This is already added by fontcache.bbclass.

> +
> +FONT_PACKAGES =3D "${PN}"

This is the default, why do you assign it here?

> +
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
> +
> --=20
> 2.7.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbsA9EACgkQN1Ujt2V2gByrPgCcDN42dgZzRNxQI3rarA0ScA9L
K+gAni+8MZ08fH75ZHujTXmKqCkEaa+C
=9XMV
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
