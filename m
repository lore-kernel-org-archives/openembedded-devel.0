Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DE5D960DD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Sep 2014 20:28:27 +0000 (UTC)
Received: from svr-orw-fem-02.mgc.mentorg.com ([147.34.96.168])
	by relay1.mentorg.com with esmtp 
	id 1XR5Y4-0001qu-HR from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Sep 2014 13:28:28 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.2.247.3;
	Mon, 8 Sep 2014 13:28:28 -0700
Received: by burninator (Postfix, from userid 1000)	id 92E83580CED; Mon,  8
	Sep 2014 16:28:27 -0400 (EDT)
Date: Mon, 8 Sep 2014 16:28:27 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140908202827.GA2125@mentor.com>
References: <1409816677-19417-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1409816677-19417-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-networking][master-next] tcpslice: fix the license
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
X-List-Received-Date: Mon, 08 Sep 2014 20:28:34 -0000
X-Groupsio-MsgNum: 52026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Roy,

This is looking much better, but since tcpslice has not been merged to
master, can you squash this into a single commit and re-send?  My
understanding is that master-next isn't intended to be fast-forward only
and it's not as critical we preserve history there, and honestly, I'd
rather have one commit that introduces the recipe in a sane state from
day one.

-J.

[[oe] [PATCH][meta-networking][master-next] tcpslice: fix the license] On 1=
4.09.04 (Thu 15:44) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> After check the copyright in source file, the license is BSD-4-Clause
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b/=
meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> index e5e38b4..203d143 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "A tool for extracting parts of a tcpdump=
 packet trace."
>  HOMEPAGE =3D "http://www.tcpdump.org/related.html"
>  SECTION =3D "console/network"
> =20
> -LICENSE =3D "BSD"
> +LICENSE =3D "BSD-4-Clause"
>  LIC_FILES_CHKSUM =3D "file://tcpslice.c;endline=3D20;md5=3D99519e2e5234d=
1662a4ce16baa62c64e"
> =20
>  SRC_URI =3D "ftp://ftp.ee.lbl.gov/${BP}.tar.gz \
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDhFrAAoJEEn8ffcsOfaWc+AH+wbA2PB7VJjVbVYR7J17uHuE
+Mxc6wFXkxFT253efQvNlIe2Ue8ZsO+cmm0r9rRX1+7yLVMYo9eQeChVlGEWO8Cl
U6ugj4ddKus4FpG6E0xBZOxBjijzlnOXVVPkLv7bq16HfD15HhYsXeD9vENR62t/
+aAqNWD95sO3qKtSg8+VK7txisjXye8hdrpr3iUCWJX6RIAbKrdapDeKrA10o1nm
hp8NOlxg6ctc/ZT0prxeeUjrXxAlcuMruI35EQDKHUycKoSqBaMFreiIeANeKwPE
7cKhV7dxwbYeJ0qOrjVBibweVlv2yexawvb8bxVcbx/zDfsix4tEKWplfRpeBJA=
=1/Qt
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
