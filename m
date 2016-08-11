Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9799377208
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 11:44:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so864749wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=g2tb/oR9dzW9nBoiR+CzN7H7BpfEjsEeN9ZQhqWIs58=;
	b=COaOeB8iV3CHtQFRIRbuGwBMtXS9Lj0agAJnQBNEsEZLkdl/LTqIpyZ3N8zQCYfpzp
	SN1qfwz+EYYoL7PdhmubjmsTB/HC9qxDwois2ZMFvVm1bSiNbAPlFx+eictwb5nrOe6g
	xUf5yIsvjuFZXmxOv/WrjKOBTz1uY8sHZgQ3MVwupQeWhB0KKJCr+OV3KrlSDXFB1YTz
	PVEJhe97PwNG5hVYZ/DwQBs2pPHO9ZDTtFrs+4sIo5Y3C/kR1P/ARA9Z8xE2or86n1fE
	/Jcbr4CIVkZiGgky9C/I/b5INIs/e4Oq1Yud5pI//4K2cAT3DKwbwOd8skZkAKxeSWlv
	JvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=g2tb/oR9dzW9nBoiR+CzN7H7BpfEjsEeN9ZQhqWIs58=;
	b=bJcIr/kdgYcMqozHNt8NTszX7bjtLTucwWhz6ZFp9BBBAsv9p1rG26HDqvNiHpR/VD
	tfzzgBKm4ua+Jn5LB7g5gLhh1oK3doMFKW77eB4WP3hk9/GQBSN1q/1czKDSVO9v1YBH
	shQrY/ZU/lvrrPMNs0YssvBwhb2FqHT2bYLDiIZn9QQNAAZaz1yR8Z2csOYpqtt9ZjQy
	VN+Pu+hK9Ln5c7rjlcyTbySTGIZuYqAgky2Jxt7AzaS6eDZcejG1uBbiiBpCbivs11Et
	IfCmKlNxYTeMpPnjsDh6EfZBPGZ0DEzaoa27DqKJxq0r3hTPoueRN2Dsd/Op6SbBrdRW
	vM8Q==
X-Gm-Message-State: AEkoousqeaU5JtZBsLfSFbJ2htYK6pkCvQwUEP8v0ZJ9/DmTNywqk7LxD1DaRey4KqvsuA==
X-Received: by 10.194.168.197 with SMTP id zy5mr11320311wjb.112.1470915896906; 
	Thu, 11 Aug 2016 04:44:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id jd4sm2344196wjb.6.2016.08.11.04.44.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Aug 2016 04:44:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Aug 2016 13:44:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160811114455.7awdrth4kx43m24z@jama>
References: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH 1/2] gflags: New recipe
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
X-List-Received-Date: Thu, 11 Aug 2016 11:44:58 -0000
X-Groupsio-MsgNum: 62547
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="73hnrt5p7j7ccy3l"
Content-Disposition: inline

--73hnrt5p7j7ccy3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 12:10:45PM +0200, Ricardo Ribalda Delgado wrote:
> C++ library that implements commandline flags processing. It includes
> built-in support for standard types such as string and the ability to
> define flags in the source file in which they are used.
>=20
> Used optionally by glog
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/gflags/gflags_2.1.2.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-support/gflags/gflags_2.1.2.bb
>=20
> diff --git a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb b/meta-oe/rec=
ipes-support/gflags/gflags_2.1.2.bb
> new file mode 100644
> index 000000000000..ac8d2ceeaa8a
> --- /dev/null
> +++ b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "The gflags package contains a C++ library that implemen=
ts commandline flags processing. It includes built-in support for standard =
types such as string and the ability to define flags in the source file in =
which they are used"
> +
> +HOMEPAGE =3D "https://github.com/gflags/gflags"
> +
> +RDEPENDS_${PN} +=3D "bash"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dc80d1a3b623f72bb85a4c75b5=
56551df"
> +
> +SRC_URI =3D "git://github.com/gflags/gflags.git;;nobranch=3D1"

It's in "release" branch, so I'll replace ;;nobranch=3D1 with ;branch=3Drel=
ease when cherry-picking.

> +SRCREV =3D "1a02f2851ee3d48d32d2c8f4d8f390a0bc25565c"
> +S =3D "${WORKDIR}/git/"
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE=3D"-DBUILD_SHARED_LIBS=3DON"
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--73hnrt5p7j7ccy3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlesZTYACgkQN1Ujt2V2gBy/MwCfYyVzNTK4peGon5jtv0nmjArK
jikAnifGEThI2jFqAk5n+/vvM7wxaO+h
=zxn5
-----END PGP SIGNATURE-----

--73hnrt5p7j7ccy3l--
