Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B16BE6B220
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 19:56:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6HJuKvW012495
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jul 2013 12:56:20 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 17 Jul 2013 12:56:19 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 479587FE4;
	Wed, 17 Jul 2013 15:56:19 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 07839410FD; Wed,
	17 Jul 2013 15:56:18 -0400 (EDT)
Date: Wed, 17 Jul 2013 15:56:18 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130717195618.GH31259@windriver.com>
References: <1373425923-19558-1-git-send-email-B40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1373425923-19558-1-git-send-email-B40290@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: b40527@freescale.com
Subject: Re: [meta-networking][PATCH] licences: Add netperf license
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
X-List-Received-Date: Wed, 17 Jul 2013 19:56:24 -0000
X-Groupsio-MsgNum: 45396
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G3juXO9GfR42w+sw"
Content-Disposition: inline

--G3juXO9GfR42w+sw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

-J.

[[oe] [meta-networking][PATCH] licences: Add netperf license] On 13.07.10 (=
Wed 11:12) Chunrong Guo wrote:

> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta-networking/conf/layer.conf  |    2 +
>  meta-networking/licenses/netperf |   43 ++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644 meta-networking/licenses/netperf
>=20
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
=2Econf
> index f75080a..14eb048 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -14,3 +14,5 @@ BBFILE_PRIORITY_networking =3D "5"
>  LAYERVERSION_networking =3D "1"
> =20
>  LAYERDEPENDS_networking =3D "core"
> +
> +LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> diff --git a/meta-networking/licenses/netperf b/meta-networking/licenses/=
netperf
> new file mode 100644
> index 0000000..3f3ceb2
> --- /dev/null
> +++ b/meta-networking/licenses/netperf
> @@ -0,0 +1,43 @@
> +
> +=20
> +              Copyright (C) 1993 Hewlett-Packard Company
> +                         ALL RIGHTS RESERVED.
> +=20
> +  The enclosed software and documentation includes copyrighted works
> +  of Hewlett-Packard Co. For as long as you comply with the following
> +  limitations, you are hereby authorized to (i) use, reproduce, and
> +  modify the software and documentation, and to (ii) distribute the
> +  software and documentation, including modifications, for
> +  non-commercial purposes only.
> +     =20
> +  1.  The enclosed software and documentation is made available at no
> +      charge in order to advance the general development of
> +      high-performance networking products.
> +=20
> +  2.  You may not delete any copyright notices contained in the
> +      software or documentation. All hard copies, and copies in
> +      source code or object code form, of the software or
> +      documentation (including modifications) must contain at least
> +      one of the copyright notices.
> +=20
> +  3.  The enclosed software and documentation has not been subjected
> +      to testing and quality control and is not a Hewlett-Packard Co.
> +      product. At a future time, Hewlett-Packard Co. may or may not
> +      offer a version of the software and documentation as a product.
> + =20
> +  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
> +      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
> +      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
> +      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
> +      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
> +      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
> +      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
> +      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
> +      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> + =20
> +  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
> +      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
> +      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
> +      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
> +=20
> +
--=20
-Joe MacDonald.
:wq

--G3juXO9GfR42w+sw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHm9uIACgkQPN8S4W6ZZne7kACcCkpAWv688/zKfwySQI5LWWXf
4Q0An1D3iVEGhHQ8N+1/ldT0ML6u4os/
=Yfm2
-----END PGP SIGNATURE-----

--G3juXO9GfR42w+sw--
