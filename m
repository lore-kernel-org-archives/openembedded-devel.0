Return-Path: <joe@deserted.net>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4119260167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 02:06:25 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hn15so5731989igb.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=C+tUrupZfrv99FjDzf+Wnhe6LYOQNSWHq5WObbmpL5w=;
	b=TPBNabRjTA60oMjH90anhfyQkCrEAZiJ3tcmjCNDiH7AV/w94X1NUVJPZGp4lpr4kd
	mRA0NeuZ5r978Vg1g4dH57yty+gaWUpbk9PP2HaZ4efPIyO1la8iIS0NMXWBhsjLONvX
	A7By5aCD/hUWsiUEw8N/Q7BRyYsPkSD/lqUZoMwFIn060IQz58eZpz7pdr14VMgb0NXx
	UxzDYn/3B38Tk6UV0MmrrFhrIPd4HRD5peb7kak3qyNbdDpcng3fMwb7xwLlZGM4ML3m
	e+zjyEJecmwGQDEJBC9SOvOw32KkIgLNKeUHk6k5Yz7PRFW5/A0lmZ/njyVNWluV0JVl
	8q5Q==
X-Gm-Message-State: ALoCoQmKygL308snx1jwcL1Fy6m9uyFEzACypxEqqcplbe/49GS6NHdWhSyn+/OxLsiD394JAfii
X-Received: by 10.42.101.77 with SMTP id d13mr365943ico.53.1411524386649;
	Tue, 23 Sep 2014 19:06:26 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id x9sm3173123igl.10.2014.09.23.19.06.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 19:06:25 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id 89CC31685E4; Tue, 23 Sep 2014 22:06:24 -0400 (EDT)
Date: Tue, 23 Sep 2014 22:06:24 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140924020623.GD16953@deserted.net>
References: <1410923622-13103-1-git-send-email-b40869@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1410923622-13103-1-git-send-email-b40869@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: YangHaibo <b40869@freescale.com>
Subject: Re: [meta-networking][PATCH] pimd: add recipe for ssmping-0.9.1
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
X-List-Received-Date: Wed, 24 Sep 2014 02:06:28 -0000
X-Groupsio-MsgNum: 52205
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline

--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This hasn't been merged yet, I was wondering if there was a v2 coming
with a corrected commit short log and based on the install question.

Thanks.
-J.

[[oe] [meta-networking][PATCH] pimd: add recipe for ssmping-0.9.1] On 14.09=
=2E17 (Wed 11:13) YangHaibo wrote:

> Signed-off-by: YangHaibo <b40869@freescale.com>
> ---
>  meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ssmping/ssmping_0.9.1=
=2Ebb
>=20
> diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/m=
eta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
> new file mode 100644
> index 0000000..ec56024
> --- /dev/null
> +++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
> @@ -0,0 +1,10 @@
> +SUMMARY =3D "ssmping is a tool for checking whether one can receive SSM =
=66rom a given host"
> +HOMEPAGE =3D "http://www.venaas.no/multicast/ssmping/"
> +LICENSE =3D "ISC"
> +LIC_FILES_CHKSUM =3D "file://asmping.c;beginline=3D2;endline=3D11;md5=3D=
1ca8d1a1ca931e5cfe604ebf20a78b71"
> +
> +SRC_URI =3D "http://www.venaas.no/multicast/ssmping/${BP}.tar.gz"
> +SRC_URI[md5sum] =3D "ad8e3d13f6d72918f73be7e7975d7fad"
> +SRC_URI[sha256sum] =3D "22103a37eaa28489169a0927bc01e0596c3485fc4d29fc84=
56c07fd2c70fca6d"
> +
> +CFLAGS_prepend =3D "-D_GNU_SOURCE "
> --=20
> 1.9.2
>=20
--=20
-Joe MacDonald.
:wq

--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlQiJx8ACgkQwFvcllog0XwjeQCfUCImjEhZXqd10jP7HeLG8mI8
PbUAoKRyxrUnN5xOfdWff9XHHvHenacN
=7RGX
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
