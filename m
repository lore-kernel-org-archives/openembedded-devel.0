Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC0765C66
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 19:13:53 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Y8w3G-0006V0-FL from Joe_MacDonald@mentor.com ;
	Wed, 07 Jan 2015 11:13:54 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Wed, 7 Jan 2015
	11:13:54 -0800
Received: by burninator (Postfix, from userid 1000)	id 1F88458251B; Wed,  7
	Jan 2015 14:13:50 -0500 (EST)
Date: Wed, 7 Jan 2015 14:13:50 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: leimaohui <leimaohui@cn.fujitsu.com>
Message-ID: <20150107191349.GJ10013@mentor.com>
References: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/2] add new recipes for GeoIP
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
X-List-Received-Date: Wed, 07 Jan 2015 19:13:53 -0000
X-Groupsio-MsgNum: 53750
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gw4vLALk08fVJy3V"
Content-Disposition: inline

--gw4vLALk08fVJy3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.  I had to update the checksums because the geoip
databases had been updated.  I think this is likely to continue to
happen, so I'm going to send out a proposal soon on how to work around
this once I see it working for myself.

-J.

[[oe] [meta-networking][PATCH 0/2] add new recipes for GeoIP] On 15.01.05 (=
Mon 10:39) leimaohui wrote:

> From: leimh <leimaohui@cn.fujitsu.com>
>=20
> geoip: allow you to look up information about a given IP address.
> geoipupdate: can download and update the GeoLite Legacy databases.
>=20
> leimh (2):
>   GeoIP: add recipe
>   geoipupdate: add new recipe
>=20
>  .../recipes-support/geoip/geoip_1.6.0.bb           | 58 ++++++++++++++++=
++++++
>  .../geoip/geoipupdate-2.1.0/GeoIP.conf             | 11 ++++
>  .../geoip/geoipupdate-2.1.0/geoipupdate.cron       |  5 ++
>  .../recipes-support/geoip/geoipupdate_2.1.0.bb     | 30 +++++++++++
>  4 files changed, 104 insertions(+)
>  create mode 100644 meta-networking/recipes-support/geoip/geoip_1.6.0.bb
>  create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.1=
=2E0/GeoIP.conf
>  create mode 100644 meta-networking/recipes-support/geoip/geoipupdate-2.1=
=2E0/geoipupdate.cron
>  create mode 100644 meta-networking/recipes-support/geoip/geoipupdate_2.1=
=2E0.bb
>=20
> --=20
> 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--gw4vLALk08fVJy3V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUrYVtAAoJEEn8ffcsOfaWfjQIAKcmJEhtkTX/7AITJsUGhiOq
rjSBoxbSyHbhuvpXRi/VCA+Y+6ide1TeGTZE2cidiiNKOMdu9rXXbvLZD/+m4aeT
RdQ5Jd4r1VEcVqMBag+SFq97u/JuV7+l/VC9dEdK/3BvlwUt4vu1RtayYesmz74D
+KfK89hCKhqMlB1IWc6rZYsJSJxCgqgPLKRF2D0WbXzbm+Z3P4Xkt3ieu0nLcGPM
jZBVOjtx9Vp31l6lCXbp+PEKnWdWcEaakiVgND2fQNELT9EoH+zJseHSJzv0OtfR
wg50lbRKXyF9NtG7SG1o2G2xPou0yLl+ZTR/khBeoZ1JNNWxyTd91DuHDrwDh6E=
=2n1w
-----END PGP SIGNATURE-----

--gw4vLALk08fVJy3V--
