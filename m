Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB7F718E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 08:19:15 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w55so13843659wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 00:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O5rDVWG/e1/XZ2h+I2a4dqbYxqWKwWQk42DgJPvqCJU=;
	b=qjW4CKtLfJkDFBeM9t7YcrXzoGo/YDFziUtaFbBiI3YoejEByZhNiXV4ZZCWZfQS+2
	3rADZy8aioLgqtVdhkDMzddUoC0c4s0ERSvCPsdlQdluo+fCGFpOwLJ/IVToURs2nWVf
	nXhyrc6REtjfm+A2H9eMlYB1w2RRO2V1MYItb9dlXSM+0xo3FQbYT1cX6UTdVYZcKXnX
	ILfIeRMuR0uO6v934BL/c5IL8iynk85OtLaKpgT8KcB3JAP3A1/M8XwGNJp5VkOTnfEa
	8ui/pgbOgQ/NRncu86x238IKlpTs53aJSevuSt0O5Wq5X2MPwGlRJ4VqMmgeBtjnpmsK
	IGaw==
X-Received: by 10.194.2.178 with SMTP id 18mr4570453wjv.67.1422433156087;
	Wed, 28 Jan 2015 00:19:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p6sm4994837wjf.39.2015.01.28.00.19.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 00:19:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Jan 2015 09:19:16 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150128081916.GB2477@jama>
References: <cover.1422053452.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1422053452.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 00/11] [Dizzy next] pull merge request
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
X-List-Received-Date: Wed, 28 Jan 2015 08:19:16 -0000
X-Groupsio-MsgNum: 54002
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline

--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2015 at 02:53:40PM -0800, Armin Kuster wrote:
> Please consider this changes for meta-openembedded dizzy
>=20
> The following changes since commit 3b83aa44186fac44a679cd24a5ae64560cb411=
8f:
>=20
>   xf86-video-glamo: fix build with xserver 1.16 (2015-01-18 16:40:55 -080=
0)
>=20
> are available in the git repository at:
>=20
>   git://github.com/akuster/meta-openembedded akuster/dizzy-next
>   https://github.com/akuster/meta-openembedded/tree/akuster/dizzy-next

This branch contains also this commit:
pick 3b83aa4 xf86-video-glamo: fix build with xserver 1.16

which was already in previous dizzy-pull-request and we agreed to drop
it. So I've dropped it again, but please make sure that the pull branch
is matching with pull-request on ML.

>=20
> Belal, Awais (1):
>   iperf: fix out of tree configuration
>=20
> Jackie Huang (8):
>   meta-gnome: Add LAYERVERSION and LAYERDEPENDS
>   meta-perl: Add LAYERVERSION and LAYERDEPENDS
>   meta-python: Add LAYERVERSION and LAYERDEPENDS
>   meta-ruby: Add LAYERVERSION and LAYERDEPENDS
>   toolchain-layer: Add LAYERVERSION and LAYERDEPENDS
>   meta-efl: Add LAYERVERSION and LAYERDEPENDS
>   meta-filesystems: Add LAYERVERSION and LAYERDEPENDS
>   meta-gpe: Add LAYERVERSION and LAYERDEPENDS
>=20
> Otavio Salvador (1):
>   nbench-byte: Fix license QA error
>=20
> Qi.Chen@windriver.com (1):
>   xmlto: remove recipe as it's in OE core
>=20
>  meta-efl/conf/layer.conf                           |  6 +++
>  meta-filesystems/conf/layer.conf                   |  6 +++
>  meta-gnome/conf/layer.conf                         |  6 +++
>  meta-gpe/conf/layer.conf                           |  6 +++
>  meta-oe/licenses/nbench-byte                       | 10 +++++
>  .../iperf-2.0.5/0001-fix-out-of-tree-config.patch  | 52 ++++++++++++++++=
++++++
>  meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |  1 +
>  .../nbench-byte/nbench-byte_2.2.3.bb               |  2 +-
>  .../xmlto-0.0.25/obsolete_automake_macros.patch    | 12 -----
>  meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb      | 18 --------
>  meta-perl/conf/layer.conf                          |  6 +++
>  meta-python/conf/layer.conf                        |  6 +++
>  meta-ruby/conf/layer.conf                          |  6 +++
>  toolchain-layer/conf/layer.conf                    |  5 +++
>  14 files changed, 111 insertions(+), 31 deletions(-)
>  create mode 100644 meta-oe/licenses/nbench-byte
>  create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0001-fix-=
out-of-tree-config.patch
>  delete mode 100644 meta-oe/recipes-support/xmlto/xmlto-0.0.25/obsolete_a=
utomake_macros.patch
>  delete mode 100644 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTIm4QACgkQN1Ujt2V2gBzsdQCdFiH3noTKvLcVdnMUxc0Am5Gi
foAAoKA0NUcjP2AfJWAd/uWNRHO6mdZ2
=vS6X
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
