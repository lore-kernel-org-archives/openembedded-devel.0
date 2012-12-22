Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmVcH-0001rM-0H
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 21:24:17 +0100
Received: by mail-ea0-f174.google.com with SMTP id e13so2449653eaa.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 12:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qFvnP5hCJEZhQPTkus8A9tfbdtdnickNiP0LS0D338o=;
	b=DwDAXQTp/bZPMrSu+nYHZ4f8++y6u/1Pc0NYnB+3a96YQLr5Aa4ov3AccTtXK+/sFb
	K3vjYxc1posk2bqw4D0ZLFsIC2TxccBsSIHBEXEb/e4kDIhWO/2uqQ9kvrk5oA0CSUM6
	OZesx2I8iP2WDpSLkx1m3arMEp4f+GCI8FTR6Vk2bp4GeuZB9+r5drP7Bfs1ULH71TKa
	qe3fJkSe+9fNGPGQ8Qd5EvhLXRAaKeY/qUz1lbct+z4uVPn+Q5KiKc3TSEehgx/V6PAv
	dW77pbWn0VUOIdI9zxTImRSe/k8bVLdv2h0jGpbygOa1LE5y7bIfNoOTD5aIvDgULIiu
	J8aQ==
X-Received: by 10.14.219.3 with SMTP id l3mr42289450eep.5.1356206969429;
	Sat, 22 Dec 2012 12:09:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r1sm30206009eeo.2.2012.12.22.12.09.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 12:09:28 -0800 (PST)
Date: Sat, 22 Dec 2012 21:09:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20121222200925.GD8988@jama.palm1.palmone.com>
References: <20121220132241.10D7310354@opal>
MIME-Version: 1.0
In-Reply-To: <20121220132241.10D7310354@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : python-mako: install standalone, not as an egg
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
X-List-Received-Date: Sat, 22 Dec 2012 20:24:17 -0000
X-Groupsio-MsgNum: 42325
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline

--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 01:22:40PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 7f5ebfe5a893f873c3727c4d3db20c553ddd5a86
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D7f5ebfe5a893f873c3727c4d3db20c553ddd5a86
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Wed Dec 19 14:36:24 2012 +0000
>=20
> python-mako: install standalone, not as an egg
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

This is causing new QA issue, please fix that

python-mako-0.7.2: python-mako: Files/directories were installed but not
shipped
  /home
  /home/jenkins
  /home/jenkins/shr
  /home/jenkins/shr/shr-core-branches
  /home/jenkins/shr/shr-core-branches/shr-core
  /home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc
  /home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/sysroots
  /home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-l=
inux
  /home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-l=
inux/usr
  /home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-l=
inux/usr/bin
  /home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-l=
inux/usr/bin/mako-render

No idea why I haven't noticed it on first test..

Cheers,

>=20
> ---
>=20
>  .../recipes-devtools/python/python-mako_0.7.2.bb   |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-=
oe/recipes-devtools/python/python-mako_0.7.2.bb
> index 9113666..d2222d6 100644
> --- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> +++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> @@ -3,7 +3,7 @@ SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dda8dd26ed9751ee0cfdf9df1a16bb=
b54"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
>  SRC_URI[md5sum] =3D "e3c0a677aa4216da9e89ef8fa76cbafb"
> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/Mako-${PV}"
> =20
>  inherit distutils
> =20
> +DISTUTILS_INSTALL_ARGS =3D "--single-version-externally-managed \
> +                          --root=3D${D} \
> +                          --install-lib=3D${PYTHON_SITEPACKAGES_DIR}"
> +
>  RDEPENDS_${PN} =3D "python-threading \
>                    python-netclient \
>                    python-html \
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDWE3UACgkQN1Ujt2V2gBy2PQCfRhMtGmGEwYyMnJM4R4Qui7Us
S+MAoKz72oTxaoVVWaOgwlsYPCzg5m8p
=GjhG
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--
