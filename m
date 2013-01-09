Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1Tsx0x-0003UL-E8
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 15:52:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r09Eb9hD002852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Jan 2013 06:37:09 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 9 Jan 2013 06:37:08 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 0B7FF7FCE;
	Wed,  9 Jan 2013 09:35:31 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 4311624157; Wed,
	9 Jan 2013 09:37:07 -0500 (EST)
Date: Wed, 9 Jan 2013 09:37:07 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130109143706.GA5259@windriver.com>
References: <1357709696-874-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1357709696-874-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] ntp: fix license to kill a warning
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
X-List-Received-Date: Wed, 09 Jan 2013 14:52:36 -0000
X-Groupsio-MsgNum: 42601
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][PATCH] ntp: fix license to kill a warning] On 13.01.09 (=
Wed 13:34) rongqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> LICENSE is case sensitive
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index b3586dc..d93f22d 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -5,10 +5,10 @@ another server or reference time source, such as a radi=
o \
>  or satellite receiver or modem."
>  HOMEPAGE =3D "http://support.ntp.org"
>  SECTION =3D "console/network"
> -LICENSE =3D "ntp"
> +LICENSE =3D "NTP"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dfea4b50c33b18c2194b4b1c9ca5=
12670"
> =20
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
> =20
>  SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-$=
{PV}.tar.gz \
>             file://tickadj.c.patch \

Merged, thanks.

--=20
-Joe MacDonald.
:wq

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDtgJIACgkQPN8S4W6ZZneC0wCfVjFc5ABRwDOz9jyz6ePM2UNz
LgIAn2r4TYY8RieKIt18ZCdg554HFbbF
=jnBg
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
