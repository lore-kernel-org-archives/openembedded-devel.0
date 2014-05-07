Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id E20D6605F4;
	Wed,  7 May 2014 17:03:01 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id ld13so1125137vcb.12
	for <multiple recipients>; Wed, 07 May 2014 10:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uaE0UGGiBhrN767k4MDI9/KW2lZNviZ7pSyCtIQdTck=;
	b=sSiF5VwXbk81NOlhIg3tcOETQYb5xcz932klR39k0DFihhvx4snuEE0ps4EJtwSrH1
	GMdkpcNX3stY1A/7Q8nPpmzdHElvfxLJ2C438rHMLW7UDWpCAjaFH+xlsFQfgCen4WET
	f4cvejYSWxRdrMReGFZEyz69oM5BgMOXvGFVGPydsDDg2bBlvBWtCL5vZFTimRjM/7Qc
	s++l9qQBau1xh1HROC0z5Z15wancZPp442rNcKw6gatBKQG1e5I/7KSEeVABZ4TFa/zv
	zYaYlEivuYZazXcPgQxKbx7x78aymdjwQrsbhkXyapsSLqBFIIZ7ZviGRHd8+8n0m/Sj
	YseA==
X-Received: by 10.58.94.135 with SMTP id dc7mr1734898veb.66.1399482182385;
	Wed, 07 May 2014 10:03:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	it5sm3721240vdb.24.2014.05.07.10.03.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 10:03:01 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 May 2014 19:03:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140507170323.GJ30955@jama>
References: <20140506170131.8C631503BF@opal.openembedded.org>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA6CC1@IRSMSX105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CEA6CC1@IRSMSX105.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Cristian Iorga : taglib: upgrade to 1.9.1
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
X-List-Received-Date: Wed, 07 May 2014 17:03:04 -0000
X-Groupsio-MsgNum: 49777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dwWFXG4JqVa0wfCP"
Content-Disposition: inline

--dwWFXG4JqVa0wfCP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 06:19:11AM +0000, Iorga, Cristian wrote:
> Is it just me, or this mailing list doubles the messages?
> I received two messages with the taglib upgrade...
> /Cristian Iorga
> YP
> Intel Corporation

master-next is often rebased and e-mail it's sent for all master..master-ne=
xt patches when rebased branch is pushed.

I haven't noticed any unexpected duplicates in my e-mail folders.

>=20
> -----Original Message-----
> From: openembedded-commits-bounces@lists.openembedded.org [mailto:openemb=
edded-commits-bounces@lists.openembedded.org] On Behalf Of git@git.openembe=
dded.org
> Sent: Tuesday, May 6, 2014 8:02 PM
> To: openembedded-commits@lists.openembedded.org
> Subject: [oe-commits] Cristian Iorga : taglib: upgrade to 1.9.1
>=20
> Module: openembedded-core.git
> Branch: master-next
> Commit: 6c06a67c1a94ebc81f9bbbd71bbb512539eacdaf
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6c06a67c1a94ebc81f9bbbd71bbb512539eacdaf
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Fri May  2 17:15:11 2014 +0300
>=20
> taglib: upgrade to 1.9.1
>=20
> - Updated website;
> - Updated tarball location;
> - Switched to BP variable;
> - Improved source dir definition;
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  .../taglib/{taglib_1.8.bb =3D> taglib_1.9.1.bb}              | 14 +++++-=
--------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-support/taglib/taglib_1.8.bb b/meta/recipes-sup=
port/taglib/taglib_1.9.1.bb
> similarity index 64%
> rename from meta/recipes-support/taglib/taglib_1.8.bb
> rename to meta/recipes-support/taglib/taglib_1.9.1.bb
> index 7327bc8..0ecb444 100644
> --- a/meta/recipes-support/taglib/taglib_1.8.bb
> +++ b/meta/recipes-support/taglib/taglib_1.9.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Library for reading and editing the meta-data of popular au=
dio formats"
>  SECTION =3D "libs/multimedia"
> -HOMEPAGE =3D "http://developer.kde.org/~wheeler/taglib.html"
> +HOMEPAGE =3D "http://taglib.github.io/"
>  LICENSE =3D "LGPLv2.1 | MPL-1"
>  LIC_FILES_CHKSUM =3D "file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008=
b364516c \
>                      file://COPYING.MPL;md5=3Dbfe1f75d606912a4111c90743d6=
c7325 \ @@ -8,15 +8,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LGPL;md5=3D4=
fbd65380cdd255951079008b364516c \
> =20
>  DEPENDS =3D "zlib"
> =20
> -PR =3D "r1"
> -# http://developer.kde.org/~wheeler/files/src/taglib-${PV}.tar.gz
> -SRC_URI =3D "https://github.com/downloads/taglib/taglib/taglib-1.8.tar.g=
z \
> -           "
> +SRC_URI =3D "http://taglib.github.io/releases/${BP}.tar.gz"
> +SRC_URI[md5sum] =3D "0d35df96822bbd564c5504cb3c2e4d86"
> +SRC_URI[sha256sum] =3D "72d371cd1419a87ae200447a53bff2be219283071e80fd12=
337928cc967dc71a"
> =20
> -SRC_URI[md5sum] =3D "dcb8bd1b756f2843e18b1fdf3aaeee15"
> -SRC_URI[sha256sum] =3D "66d33481703c90236a0a9d1c38fd81b584ca7109ded04922=
5f5463dcaffc209a"
> -
> -S =3D "${WORKDIR}/taglib-${PV}"
> +S =3D "${WORKDIR}/${BP}"
> =20
>  inherit cmake pkgconfig binconfig
> =20
>=20
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dwWFXG4JqVa0wfCP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNqZ1sACgkQN1Ujt2V2gBz1GACdFW7rRWEh6Dd4qhihpYjRi5JT
VzoAmwT7zGMkl9ghpcqdZyIhVGQWj/Nf
=rDoS
-----END PGP SIGNATURE-----

--dwWFXG4JqVa0wfCP--
