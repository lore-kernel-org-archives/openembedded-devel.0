Return-Path: <joe@deserted.net>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id DC60F6F8BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 20:28:50 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id a108so3486073qge.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 13:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=29zhB1Fa1vDvzeZaLbOvzz3uyw5KC7uE+jHD5mKhZro=;
	b=IFFoSnlkMRrYkJP2y+rNe+5Hr2Gi3uNas1mfKHqdwVXQZ4dG/h2pyB2naOVzPM1WZM
	Ie68C8iaoVpCGtSc1w3+LNy1QE+3ehXQrcPA8fqCZl9kYOzLPxGlUyrynVcCd599bGNF
	xpv6eX0zJ5PaLu3r+ilOYVigdz7/cvCBzvmLHaJhZVccHDk+O+AM0A3qcO88rH7KXGKV
	SD7vS7hEfhHTeDL7/ERv3hGzmIR9HNUlpXVAxik4vPf2lx5oxmxLArilNEkiTXC3qxhz
	kIG1h2WGNKfZ0SY3rKwtw8glJQYIRX2g5W4lFPj7l7gGxl7Sg7HlSgDB1t8++mRSZHkR
	xSyQ==
X-Gm-Message-State: ALoCoQlEtfITRVwjbPlQ7bYNqavHxUY6v4Zc6lJxNMHY/9o2T7q+zlu1oC9V1r2Lc8fGHvBNKUjI
X-Received: by 10.224.123.212 with SMTP id q20mr4686972qar.95.1395952131145;
	Thu, 27 Mar 2014 13:28:51 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id r4sm5782708qat.16.2014.03.27.13.28.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 13:28:48 -0700 (PDT)
Date: Thu, 27 Mar 2014 16:28:45 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140327202841.GE15666@deserted.net>
References: <cover.1395130693.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1395130693.git.hongxu.jia@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH 0/1] netcf: fix gnulib not found in sysroots while using a shared sstate cache
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
X-List-Received-Date: Thu, 27 Mar 2014 20:28:52 -0000
X-Groupsio-MsgNum: 48873
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Content-Disposition: inline

--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH 0/1] netcf: fix gnulib not found in sysroots =
while using a shared sstate cache] On 14.03.18 (Tue 16:21) Hongxu Jia wrote:

> The following changes since commit 3c5bd3a077d04c140d774d258ac9f2652dda26=
69:
>=20
>   phpmyadmin: update to 4.1.9 (2014-03-17 10:46:59 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib hongxu/fix-netcf
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/fix-netcf
>=20
> Hongxu Jia (1):
>   netcf: fix gnulib not found in sysroots while using a shared sstate
>     cache
>=20
>  meta-networking/recipes-support/netcf/gnulib_git.bb | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> --=20
> 1.8.1.2
>=20
--=20
-Joe MacDonald.
:wq

--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlM0ifkACgkQwFvcllog0Xy0xgCfdJ3BJYlfBhgunUUqG6lNo3Ur
XIEAoKhkFcK7dFtlNOo38T2UejxiYChp
=ciIy
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--
