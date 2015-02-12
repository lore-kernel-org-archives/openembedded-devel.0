Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A3E9373372
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 03:22:09 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1YLkLy-0004ZR-Cn from Joe_MacDonald@mentor.com ;
	Wed, 11 Feb 2015 19:22:10 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 19:22:09 -0800
Received: by burninator (Postfix, from userid 1000)	id 54524581332; Wed, 11
	Feb 2015 22:22:09 -0500 (EST)
Date: Wed, 11 Feb 2015 22:22:09 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Kai Kang <kai.kang@windriver.com>
Message-ID: <20150212032209.GN30457@mentor.com>
References: <1423017959-7634-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1423017959-7634-1-git-send-email-kai.kang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] quagga: fix typo in systemd service file
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
X-List-Received-Date: Thu, 12 Feb 2015 03:22:11 -0000
X-Groupsio-MsgNum: 54200
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E+IgQzR66AIOcbjA"
Content-Disposition: inline

--E+IgQzR66AIOcbjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks Kai.

-J.

[[oe] [meta-networking][PATCH] quagga: fix typo in systemd service file] On=
 15.02.04 (Wed 10:45) Kai Kang wrote:

> Fix typo in systemd service file ripngd.service.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-networking/recipes-protocols/quagga/files/ripngd.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/files/ripngd.servic=
e b/meta-networking/recipes-protocols/quagga/files/ripngd.service
> index 936b81f..72562d5 100644
> --- a/meta-networking/recipes-protocols/quagga/files/ripngd.service
> +++ b/meta-networking/recipes-protocols/quagga/files/ripngd.service
> @@ -1,4 +1,4 @@
> -i[Unit]
> +[Unit]
>  Description=3DRIP routing daemon for IPv6
>  BindTo=3Dzebra.service
>  After=3Dzebra.service
> --=20
> 2.1.1
>=20
--=20
-Joe MacDonald.
:wq

--E+IgQzR66AIOcbjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU3BxgAAoJEEn8ffcsOfaWonwH/jVRB+7Ble/vIjBLRYkvRDk3
sdF+tZfhf+imkILpX9N4TtoKjiXEH9c0YWECe3GyJtwTosgbFwRHTt6TA/1trBNb
PpMuhthE39mcaXE0o9VqK4G88cG1VcutJm8xCjAOHsEnu8//hoIRuPqnCZEK9633
hClr8VBUZDTy5oIF3iz/giaFX6ee0+kV+j86hDpt1WihINVFe33yIyQiHFzODN0c
Q6QoKGNL65aOA037DhJPRY+3qyNfNHcFM92j2DWX5Ta8LrZNnOsSVftVWCak9lXN
YPwjJdwFyQS9crszq2Wq4ZuZgU+aHgDoPma0J3V6ls411xSVueeuMjCKearlNa4=
=9hJE
-----END PGP SIGNATURE-----

--E+IgQzR66AIOcbjA--
