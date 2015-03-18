Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2A56013D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 11:56:46 +0000 (UTC)
Received: by wifj2 with SMTP id j2so37445551wif.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HpN/IeDczKA0NqTmeW6oNPLqzsvkfHN6sRaN2AT2veY=;
	b=mUOgFO40HinANCPZVR7OI5PQpj/+jhxbmgR37ZWvBS6ffdkpAvIcqLx6k6ZVp10aPr
	HN2lASCGifKqq1EhBMY2G4xiYNhoAXWO4HRbsWnbTx5egOYKTOsALOIGaYEsgQQHncIw
	SAncSQWbT/OsUe77rQhV97E33VeJ0bAzv04mSi29GV4B2EFrwX9kss82gnQs5BUwixEv
	xRd2/P+uo6daqgj5TFveKyrIfoQd5LLkZWQNKf/1ORwT00vKtd6rCaLx7XM9SEV1/3d+
	RPhycyZZ+tWk5YksbJWJTrFl8n1NuJJ+oXH9nMO4yZZRdJHphAio5jz6eZ2RXieGlsTd
	Ue4g==
X-Received: by 10.180.108.203 with SMTP id hm11mr5970865wib.49.1426679806714; 
	Wed, 18 Mar 2015 04:56:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vq9sm24184592wjc.6.2015.03.18.04.56.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Mar 2015 04:56:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Mar 2015 12:56:52 +0100
To: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>
Message-ID: <20150318115652.GB4738@jama>
References: <20150107190635.8482C5028F@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150107190635.8482C5028F@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [oe-commits] Joe MacDonald : GeoIP: update checksums
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
X-List-Received-Date: Wed, 18 Mar 2015 11:56:46 -0000
X-Groupsio-MsgNum: 54820
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 07:06:35PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: b5afd31f7637f8a206b720f332d115c5a395cafc
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Db5afd31f7637f8a206b720f332d115c5a395cafc
>=20
> Author: Joe MacDonald <joe_macdonald@mentor.com>
> Date:   Wed Jan  7 12:20:07 2015 -0500
>=20
> GeoIP: update checksums
>=20
> The raw IP databases have been updated, so for the time being just update
> the checksums.
>=20
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>

GeoIP.dat.gz was update again

ERROR: Fetcher failure for URL: 'http://geolite.maxmind.com/download/geoip/=
database/GeoLiteCountry/GeoIP.dat.gz;apply=3Dno;name=3DGeoIP-dat'. Checksum=
 mismatch!
File: '/home/jenkins/oe/world/shr-core/downloads/GeoIP.dat.gz' has md5 chec=
ksum 37c84ead332dda0362a5ac7b049b72d4 when 4bc1e8280fe2db0adc3fe48663b8926e=
 was expected
File: '/home/jenkins/oe/world/shr-core/downloads/GeoIP.dat.gz' has sha256 c=
hecksum 79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07 wh=
en 7fd7e4829aaaae2677a7975eeecd170134195e5b7e6fc7d30bf3caf34db41bcd was exp=
ected
If this change is expected (e.g. you have upgraded to a new version without=
 updating the checksums) then you can use these lines within the recipe:
SRC_URI[GeoIP-dat.md5sum] =3D "37c84ead332dda0362a5ac7b049b72d4"
SRC_URI[GeoIP-dat.sha256sum] =3D "79ff1099e96c2dc1c2539c9a18aaa13a9afd085ca=
e477df60d95f1644d42bc07"
Otherwise you should retry the download and/or check with upstream to deter=
mine if the file has become corrupted or otherwise unexpectedly modified.

ERROR: Function failed: Fetcher failure for URL: 'http://geolite.maxmind.co=
m/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=3Dno;name=3DGeo=
IP-dat'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/i586-oe-linux/geoip/1.6.0-r0/temp/log.do_fetch.11727
NOTE: recipe geoip-1.6.0-r0: task do_fetch: Failed
NOTE: recipe asio-1.10.1-r0: task do_patch: Started
ERROR: Task 485 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-net=
working/recipes-support/geoip/geoip_1.6.0.bb, do_fetch) failed with exit co=
de '1'

>=20
> ---
>=20
>  meta-networking/recipes-support/geoip/geoip_1.6.0.bb | 16 ++++++++------=
--
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/meta-=
networking/recipes-support/geoip/geoip_1.6.0.bb
> index 782d2e7..65e8362 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> @@ -18,17 +18,17 @@ SRC_URI =3D "http://www.maxmind.com/download/geoip/ap=
i/c/GeoIP-1.6.0.tar.gz;name=3Dt
>  SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
>  SRC_URI[tarball.sha256sum] =3D "075a0c2815cd099e9ec35c9569db716a3fefcdbb=
6a10dbfa1ce7c6cd48d4a635"
> =20
> -SRC_URI[GeoIP-dat.md5sum] =3D "53416cd33e556a8048ac522fc9a98e05"
> -SRC_URI[GeoIP-dat.sha256sum] =3D "a423a0c87bf9a78ef8d68153b424987c6bbdde=
c85b5f784ca747706f4df10361"
> +SRC_URI[GeoIP-dat.md5sum] =3D "4bc1e8280fe2db0adc3fe48663b8926e"
> +SRC_URI[GeoIP-dat.sha256sum] =3D "7fd7e4829aaaae2677a7975eeecd170134195e=
5b7e6fc7d30bf3caf34db41bcd"
> =20
> -SRC_URI[GeoIPv6-dat.md5sum] =3D "f1a4abf4015c0300267f4717c9d7ead2"
> -SRC_URI[GeoIPv6-dat.sha256sum] =3D "1a8e61732e39ac9d9acc20d648b2530d7bd0=
ff1c250f51fd18148931fbfe2830"
> +SRC_URI[GeoIPv6-dat.md5sum] =3D "aac7e6e9b141de80934ecee52daf7f56"
> +SRC_URI[GeoIPv6-dat.sha256sum] =3D "126fd2953eb193e60538e30b446561053038=
3f7a782745cacdca5ba6825f471c"
> =20
> -SRC_URI[GeoLiteCity-dat.md5sum] =3D "48af3b8a204d7c5f8e42a4f5f4dd1874"
> -SRC_URI[GeoLiteCity-dat.sha256sum] =3D "2f3f62f171c333cdd4e68534585e5197=
8cb3a12dc7b269786f50daf10071d7d6"
> +SRC_URI[GeoLiteCity-dat.md5sum] =3D "15a42c684c53d2309e6632a6d6e02531"
> +SRC_URI[GeoLiteCity-dat.sha256sum] =3D "5ec02a6d39d545c77ec12cc30c6a8856=
883d8f55522fc5cd4f25af80163c6b3c"
> =20
> -SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "a42504adfd8030c3a10f749191598b4a"
> -SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D "4a5eeaa4a9107e6ccdbe94ad1c7c98=
7dc70cd250cd40624ada1e3a03836bbbdb"
> +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "49d6ec946fa0a2575b5112a68d71f933"
> +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D "7a345e6cf0e59f8ab589ff15020241=
f0b03342dd04cc584f814c4f4700d49405"
> =20
> =20
>  LICENSE =3D "LGPL-2.1"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlUJaAQACgkQN1Ujt2V2gBx6ngCXauWW+Kc/kYzYNMot+pRIGO1/
gQCfXxUUwM99F4L81uGVhGEET3wWa58=
=DOCd
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
