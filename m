Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E3E4A72A0B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 19:11:04 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Y8w0W-0005gB-Fo from Joe_MacDonald@mentor.com ;
	Wed, 07 Jan 2015 11:11:04 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Wed, 7 Jan 2015
	11:11:04 -0800
Received: by burninator (Postfix, from userid 1000)	id 123D658251B; Wed,  7
	Jan 2015 14:11:00 -0500 (EST)
Date: Wed, 7 Jan 2015 14:11:00 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150107191059.GG10013@mentor.com>
References: <1420325258-41206-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1420325258-41206-1-git-send-email-liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [V2 meta-networking] [PATCH 1/2] radiusclient-ng: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 07 Jan 2015 19:11:12 -0000
X-Groupsio-MsgNum: 53747
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VIOdPewhitSMo36n"
Content-Disposition: inline

--VIOdPewhitSMo36n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged both of these, thanks.
-J.

[[oe] [V2 meta-networking] [PATCH 1/2] radiusclient-ng: use BPN in SRC_URI]=
 On 15.01.03 (Sat 14:47) Robert Yang wrote:

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../radiusclient-ng/radiusclient-ng_0.5.6.bb       |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclie=
nt-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiuscl=
ient-ng_0.5.6.bb
> index 1fafe73..2350d4f 100644
> --- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0=
=2E5.6.bb
> +++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0=
=2E5.6.bb
> @@ -5,7 +5,7 @@ protocol (RFCs 2128 and 2139)."
>  HOMEPAGE =3D "http://sourceforge.net/projects/radiusclient-ng.berlios/"
>  SECTION =3D "Applications/Internet"
> =20
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/r/${PN}/${PN}_${PV}.orig.tar.gz \
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/r/${BPN}/${BPN}_${PV}.orig.tar.gz \
>     file://Modify-configure.in-and-etc-Makefile.am.patch \
>     file://config-site.radiusclient-ng-${PV}"
> =20
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--VIOdPewhitSMo36n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUrYS9AAoJEEn8ffcsOfaWW9QIAKTH8ipu0Sf1XhnwyNnfzM77
k/T9MvXTB9HzY/kel+ElrSHazBI03zcQyT4cU0PCrkoqwvNtkyVWqWJijSNnpN0l
SILHHKTLMzgsPFWFdhciUwpRpdta64xeDLwesftg2hjKtrYzqhmNV0H20ZPki9sN
5AyNUaCXOZQyaUJsSv7oTX6kJ0OHtTeGpBkz5x/ZOzochIhZtkSrTjdz5HxE+Cs3
nHpYoKFREPnzTCDET6o16osw2R+i1x52ZU4tVoYATr9BbAi9noS1IvrFNPq+RGkg
Ek8i3f8IFdrNXyty1JoQ5GwF3KgPI/fqIApCGh/krqtSYbhKVUVaz/4mz3MVde0=
=R8nY
-----END PGP SIGNATURE-----

--VIOdPewhitSMo36n--
