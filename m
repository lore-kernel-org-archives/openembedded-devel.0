Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id B883960119
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 18:13:26 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id x3so48818760pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 11:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=ch9NYktOEbmk9c4dLCqxme7iYbr3iDdXDVLV92Np2wY=;
	b=F4VJhRUwBHURuC3xV8P9KWBIjlstSKRWzg10/LQJbTxH2yirNvTxCKb4shGU/KHMAJ
	uGox3UXVb/79HuBLktbAEjciNE8bsubOQJFWKG72xZeP+7wmpypCns2v472IP86tR6dS
	FyorI/IeuRwIPc+TQI5/f+LwD80VgUn9I1KF+DZwr5D5EfVkzKAjw4ihJis2vFH3bkPB
	qDngik35FANRaNbOb1+iRY709RiM+eKzgkZG9OSk5dlt9J5smUnD3z70dv9NdGsGo4m0
	MONDZI6KV5QaESFRYD8VLrXzkQvBXnmfpQkzvXgJIWQrufqQQm1y6IEgA+cozZiNbp2d
	wHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=ch9NYktOEbmk9c4dLCqxme7iYbr3iDdXDVLV92Np2wY=;
	b=ZsEET1P6x7tYuv5Ds7fq+yXn20RVIidZ4BOp13DoeaHXII7z2Z4PPdGvZ/cuHLPaHP
	brKXhYbP2VqGRMg9M+9Gtl2OkgLClPhjOQVljpZOzTmD5C769Wd2q29GTlsTCV1K8zsn
	uiwJE1znwfiAd5Opuzn+cKAc1h2O6lx/d9cGaTY0G7dxjoQJt3AhNVHiN+Bdnv9wSOFD
	qHjcMsxAOKZTbIh/w88kZccuNiY1cZ2fsgEOqOZXlEn9mPBmFmNYix0+erbNsviErV2r
	u6pGK62ty6zjesZGrUGpJtqGijTZ5yhoXtQHbG4dnRap6vVO1DCuJrTR2xqdq8FJjNCY
	ce3Q==
X-Gm-Message-State: AD7BkJKYR/2d1J93pqAf6Y/q+iZPI6b8zmL+itddSBAN7BeFYuoR+9jbBv8tJw/Dcp4lqQ==
X-Received: by 10.98.67.67 with SMTP id q64mr15524797pfa.44.1459361607304;
	Wed, 30 Mar 2016 11:13:27 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:153e:3940:320e:6ae3?
	([2601:646:8800:5a9a:153e:3940:320e:6ae3])
	by smtp.gmail.com with ESMTPSA id
	b74sm7520196pfd.24.2016.03.30.11.13.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2016 11:13:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1459236536-15190-1-git-send-email-rongqing.li@windriver.com>
Date: Wed, 30 Mar 2016 11:13:21 -0700
Message-Id: <A37ACF9C-1BF6-4EA2-AD21-26E62FD3CAE8@gmail.com>
References: <1459236536-15190-1-git-send-email-rongqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH][meta-oe] cpupower: add recipes
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
X-List-Received-Date: Wed, 30 Mar 2016 18:13:28 -0000
X-Groupsio-MsgNum: 60737
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A551ADF3-F921-43E6-9FB8-2AAEE225D103";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A551ADF3-F921-43E6-9FB8-2AAEE225D103
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 29, 2016, at 12:28 AM, rongqing.li@windriver.com wrote:
>=20
> From: Roy Li <rongqing.li@windriver.com>
>=20
> cpupower is tools to shows and sets processor power related values
>=20

it seems to be overriding CC, I wonder if this will work when sstate is =
shared over different build hosts
do we know if it works with sstate when sstate provider/consumer are =
using different directory structure for
workspace

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
> meta-oe/recipes-kernel/cpupower/cpupower.bb | 41 =
+++++++++++++++++++++++++++++
> 1 file changed, 41 insertions(+)
> create mode 100644 meta-oe/recipes-kernel/cpupower/cpupower.bb
>=20
> diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb =
b/meta-oe/recipes-kernel/cpupower/cpupower.bb
> new file mode 100644
> index 0000000..d53deac
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
> @@ -0,0 +1,41 @@
> +SUMMARY =3D "Shows and sets processor power related values"
> +DESCRIPTION =3D "cpupower is a collection of tools to examine and =
tune power \
> +saving related features of your processor."
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> +DEPENDS =3D "pciutils"
> +
> +inherit kernelsrc kernel-arch
> +
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> +do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
> +
> +PROVIDES =3D "virtual/cpupower"
> +
> +B =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +EXTRA_OEMAKE =3D '\
> +    -C ${S}/tools/power/cpupower \
> +    O=3D${B} \
> +    CROSS=3D${TARGET_PREFIX} \
> +    ARCH=3D${ARCH} \
> +    CC=3D"${CC}" \
> +    AR=3D"${AR}" \
> +'
> +do_compile() {
> +	unset CFLAGS
> +	oe_runmake all
> +}
> +
> +do_install() {
> +	unset CFLAGS
> +	oe_runmake DESTDIR=3D${D} install
> +	chown root:root ${D}/${libdir}/*
> +}
> +
> +python do_package_prepend() {
> +    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +RDEPENDS_${PN} =3D "bash"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_A551ADF3-F921-43E6-9FB8-2AAEE225D103
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb8F0UACgkQuwUzVZGdMxTWfwCfZ0UN0ArQ134KfqIPNw6fcXft
Fa0An1quz0QK2/hvli/aT8SlKbEKHKFl
=7lY8
-----END PGP SIGNATURE-----

--Apple-Mail=_A551ADF3-F921-43E6-9FB8-2AAEE225D103--
