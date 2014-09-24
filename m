Return-Path: <joe@deserted.net>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id ABE1060167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 02:08:01 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id tp5so5419318ieb.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Wztz+xRvxp3KjMqB0tCB90JA0VZQlIqCIn0opM3HH0I=;
	b=lI+giWuIFyOvyYoow0kfinSD5A9Dj1Hkc/FFkJ36id5jb7FJsrneqTi5/mO20rwmH1
	47r5lbK0L/V0o7UzCBVYVotVWaBkAV85zlG3jqbYIL8Ol6UyFF7lbOemoI1KHjGL981T
	NjajKrWcg9TAvgqBti5NOnXXp6rHNbdK4jZwVYzcegRP2VbCHu8BHAEbJN78ksTpymR3
	thYVHj/+D7+KmqXAwCZJl225JpJWFePaVlzeNKSM60GWvr0dh2axL6nXBA0n4tJKEk4p
	zOir9xEaC0OYNSVqAvr4HtPZvBmlek28M3WKfX24xcVw+wTt+4PryjLSJMmQ6VehuafR
	wuew==
X-Gm-Message-State: ALoCoQljvreDenRS8ArGqSGRSAONstGTGWrvaTxhZGTGhcY4dHtbzT6palRIRwP6gY2eilO7oCbc
X-Received: by 10.50.87.99 with SMTP id w3mr8733327igz.4.1411524482031;
	Tue, 23 Sep 2014 19:08:02 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id ro6sm3190728igb.3.2014.09.23.19.08.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 19:08:01 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 066081685E4; Tue, 23 Sep 2014 22:08:01 -0400 (EDT)
Date: Tue, 23 Sep 2014 22:08:00 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140924020800.GF16953@deserted.net>
References: <1411154569-2625-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1411154569-2625-1-git-send-email-jslater@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH 1/1] radvd: update to 1.14
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
X-List-Received-Date: Wed, 24 Sep 2014 02:08:01 -0000
X-Groupsio-MsgNum: 52207
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H4SyuGOnfnj3aJqJ"
Content-Disposition: inline

--H4SyuGOnfnj3aJqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH 1/1] radvd: update to 1.14] On 14.09.19 (Fri =
12:22) Joe Slater wrote:

> No changes except to source version.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>

Merged, thanks.
-J.

> ---
>  .../recipes-daemons/radvd/radvd_1.14.bb            |    6 ++++++
>  .../recipes-daemons/radvd/radvd_1.9.8.bb           |    6 ------
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/radvd/radvd_1.14.bb
>  delete mode 100644 meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb
>=20
> diff --git a/meta-networking/recipes-daemons/radvd/radvd_1.14.bb b/meta-n=
etworking/recipes-daemons/radvd/radvd_1.14.bb
> new file mode 100644
> index 0000000..bf572e3
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/radvd/radvd_1.14.bb
> @@ -0,0 +1,6 @@
> +
> +require radvd.inc
> +
> +SRC_URI[md5sum] =3D "a257e05bd6a435ef948d3b407726d56f"
> +SRC_URI[sha256sum] =3D "3b16dd9ef3d6c8b889cdabfdb16c81db8bd61b0f1fc42f6a=
cc52d3cf300c6d07"
> +
> diff --git a/meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb b/meta-=
networking/recipes-daemons/radvd/radvd_1.9.8.bb
> deleted file mode 100644
> index 407eb43..0000000
> --- a/meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -PR =3D "r0"
> -
> -require radvd.inc
> -
> -SRC_URI[md5sum] =3D "7a96a38252c3964ee18bbc1fdeae25fa"
> -SRC_URI[sha256sum] =3D "645ccf1c9b16e769ff4179813712e580e2c8786d64a888d8=
afa1e296c057c1c1"
> --=20
> 1.7.3.4
>=20
--=20
-Joe MacDonald.
:wq

--H4SyuGOnfnj3aJqJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlQiJ4AACgkQwFvcllog0XyMywCgi37rOKxEpCZeJOLlZoyfrzaI
cPEAn1TDlQ2cNhX5dQvTM8wodeaNMPk6
=i4m2
-----END PGP SIGNATURE-----

--H4SyuGOnfnj3aJqJ--
