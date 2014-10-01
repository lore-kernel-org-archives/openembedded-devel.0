Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id ECF3F65F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 15:21:02 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id ho1so945983wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I1kND4iSJiEyVWkXQ0JA6Nb41poKqjuiQvl+8H6L27U=;
	b=lbN605jmZijMgGpa5C2vY24F/STXE0qIOi6rqApFHsDkEDmz6Jfr/afirpB25CtTe7
	QjzSZD9iJcB526Cy9i/ie+QIaoaWku0nD4O8QuWluDdNA5E6xvG1rnBKXBvlZdEdVzKt
	OlD92TAyLvVi5gGaMvuSRtMWpgwwK/C8oNsAc953n2Q+H+eUNt2HNIZEMfpFAh8SXlK+
	MTS2zNb9k/g8Tk/loDHIhmSRNKSjLRsm9SvRFWDWesjMTygGXYAFO9z4wWEjqJhd2knP
	rvVbO0MBUJHjAJCcwzqp1iLThnaJ3qdzYtMVBd8aBuKdNhyoRuoEhLxjVLrW0EGeba4z
	BGBg==
X-Received: by 10.180.211.36 with SMTP id mz4mr15191331wic.39.1412176863568;
	Wed, 01 Oct 2014 08:21:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t9sm1481179wjf.41.2014.10.01.08.21.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 08:21:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Oct 2014 17:21:58 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141001152158.GE25706@jama>
References: <1411952961-5092-1-git-send-email-changhyeok.bae@lge.com>
MIME-Version: 1.0
In-Reply-To: <1411952961-5092-1-git-send-email-changhyeok.bae@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] gdal: update to version 1.11.0
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
X-List-Received-Date: Wed, 01 Oct 2014 15:21:12 -0000
X-Groupsio-MsgNum: 52327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p1zxN+PsucbyOM2v"
Content-Disposition: inline

--p1zxN+PsucbyOM2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2014 at 10:09:21AM +0900, Changhyeok Bae wrote:
> ---
>  .../gdal/{gdal_1.10.1.bb =3D> gdal_1.11.0.bb}        |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-navigation/gdal/{gdal_1.10.1.bb =3D> gdal_1.11.0.=
bb} (94%)
>=20
> diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/rec=
ipes-navigation/gdal/gdal_1.11.0.bb
> similarity index 94%
> rename from meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> rename to meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
> index 14f1a57..8526cee 100644
> --- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> +++ b/meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
> @@ -1,14 +1,14 @@
>  SUMMARY =3D "GDAL is a translator library for raster geospatial data for=
mats"
>  HOMEPAGE =3D "http://www.gdal.org/"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Db9bd75ae5af7ff87ab259be01=
21c4106"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D0952e17969fab12227096b522=
8f23149"
> =20
>  DEPENDS =3D "proj sqlite3 tiff"

Missing dependency on json-c and sqlite3 check doesn't seem to work correct=
ly

| checking for SQLite3 library >=3D 3.0.0... yes
| cat: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/i=
nclude/sqlite3.h: No such file or directory
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/g=
dal/1.11.0-r0/gdal-1.11.0/configure: line 25763: test: !=3D: unary operator=
 expected
| configure: WARNING: Can not find SQLITE_VERSION macro in sqlite3.h header=
 to retrieve SQLite version!
| checking for sqlite3_column_table_name in -lsqlite3... yes
| disabled
| checking Checking for DWGdirect... disabled
| configure: "IBM Informix DataBlade support disabled."
| configure: checking whether we should include ESRI SDE support...
|         ESRI SDE support not requested.
| checking for geos-config... /home/jenkins/oe/world/shr-core/tmp-glibc/sys=
roots/qemuarm/usr/bin/crossscripts/geos-config
| checking for GEOS version >=3D 3.1.0... yes
| checking for GEOSversion in -lgeos_c... yes
| configure: Using C API from GEOS 3.4.2
| checking for OpenCL support... no
| checking for FreeXL support... checking for json_object_set_serializer in=
 -ljson-c... yes
| using pre-installed libjson-c
| configure: error: could not find json-c/json.h
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/g=
dal/1.11.0-r0/gdal-1.11.0/config.log
| This file contains any messages produced by compilers while
| running configure, to aid debugging if configure makes a mistake.
|=20
| It was created by configure, which was
| generated by GNU Autoconf 2.69.  Invocation command line was


> =20
>  SRC_URI =3D "ftp://download.osgeo.org/gdal/${PV}/${BP}.tar.xz"
> =20
> -SRC_URI[md5sum] =3D "f354c614aea76e5630e4edbf06e5c292"
> -SRC_URI[sha256sum] =3D "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60=
b91639fb8d443791"
> +SRC_URI[md5sum] =3D "31f2c4a7230b40e5fdc3cf12a100f96b"
> +SRC_URI[sha256sum] =3D "b5186b5817e94743de1bceef66aeee1461687e14f73bf810=
34fcf0377eacbcc3"
> =20
>  inherit autotools-brokensep lib_package binconfig
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p1zxN+PsucbyOM2v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQsHBYACgkQN1Ujt2V2gBxCuACgslRs8yptHU1DlqAKB+XFLSOr
R50An0GnV+M1RESW08Uc0IKGwznp8iEZ
=6DF8
-----END PGP SIGNATURE-----

--p1zxN+PsucbyOM2v--
