Return-Path: <joe@deserted.net>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 268AB6BE71
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:13:11 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so892920eak.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=BpgX9WOD7Vz1w3qxWveSRz2l/QwkmqcW2hnGuB/kQlE=;
	b=Jb6Z4cdoDf2oBnqG2ye/qjbAOF2/N0kRAVD63ah+QE/n95Tb4tZcsFot0bHpAuWTI+
	QCAt50r3iGJTkra4CmIg01Yo/LDxuV2b0YA8N7x5jQdkQvxkBUpWs9zHmPEIAhTLToCq
	SaaUFcMLSVXeC/a56JYOc9ryt7YvH/HNfGfAIXI8kUkr9DlazacaIl+ZnlFBDSQkuhH1
	UGDiEKQIIdDLceSurcPV7UGxNMMoTWgdZYS9ksl89b8qx+MFfleYx46dcpHWurYB7vk3
	bChAsqt1fkKOxJVq6bLSDOyxwTSSkk/m0AX+7pGYO1RDmi2zvykUR0Tf4AoTBVYiO3al
	+oYg==
X-Gm-Message-State: ALoCoQmWUgG7k/d9GGp3s98ntVKAb0pJPvxUNoqoyzL1ShnUKXi3ryiZ0w1uRUasJAQKbvJkXyZJ
X-Received: by 10.14.8.72 with SMTP id 48mr13512420eeq.25.1378386793512;
	Thu, 05 Sep 2013 06:13:13 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id i1sm48619508eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:13:12 -0700 (PDT)
Date: Thu, 5 Sep 2013 09:13:08 -0400
From: Joe MacDonald <joe@deserted.net>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20130905131306.GI5086@deserted.net>
References: <CAOMwXhN2MBV=1pB7ZUsm+Qt7aN-c7tuOY8u5F3s8VrZ2iR5zJA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhN2MBV=1pB7ZUsm+Qt7aN-c7tuOY8u5F3s8VrZ2iR5zJA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] stunnel: Add 4.56 version
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
X-List-Received-Date: Thu, 05 Sep 2013 13:13:13 -0000
X-Groupsio-MsgNum: 46099
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BWWlCdgt6QLN7tv3"
Content-Disposition: inline

--BWWlCdgt6QLN7tv3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH] stunnel: Add 4.56 version] On 13.09.05 (Thu 0=
6:06) Laszlo Papp wrote:

> Seriously: ping?

Merged, thanks.

-J.

>=20
>=20
> On Wed, Sep 4, 2013 at 8:47 AM, Laszlo Papp <lpapp@kde.org> wrote:
>=20
>     Ping?
>=20
>=20
>     On Thu, Aug 22, 2013 at 8:07 PM, Laszlo Papp <lpapp@kde.org> wrote:
>=20
>         Signed-off-by: Laszlo Papp <lpapp@kde.org>
>         ---
>         =A0meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 14
>         ++++++++++++++
>         =A01 file changed, 14 insertions(+)
>         =A0create mode 100644 meta-networking/recipes-support/stunnel/
>         stunnel_4.56.bb
>=20
>         diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56=
=2Ebb b/
>         meta-networking/recipes-support/stunnel/stunnel_4.56.bb
>         new file mode 100644
>         index 0000000..0ee8cc8
>         --- /dev/null
>         +++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
>         @@ -0,0 +1,14 @@
>         +SUMMARY =3D "SSL encryption wrapper between remote client and lo=
cal
>         (inetd-startable) or remote server."
>         +SECTION =3D "net"
>         +LICENSE =3D "GPLv2"
>         +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D
>         f41ebed8571077706fee0b860c4d6666"
>         +DEPENDS =3D "openssl"
>         +
>         +SRC_URI =3D "https://www.stunnel.org/downloads/${BP}.tar.gz"
>         +
>         +SRC_URI[md5sum] =3D "ac4c4a30bd7a55b6687cbd62d864054c"
>         +SRC_URI[sha256sum] =3D
>         "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
>         +
>         +inherit autotools
>         +
>         +EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_INCDIR}' --disable-fi=
ps"
>         --
>         1.8.3.4
>=20
>   =20
>=20
>=20
>=20

--=20
-Joe MacDonald.
:wq

--BWWlCdgt6QLN7tv3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIog2IACgkQwFvcllog0XzpKQCbBdZHqGsmKszJYm/GYbSJqwAt
04QAnRgt0jMh8AXKgoNPNZWi7cS95LKh
=Kq0A
-----END PGP SIGNATURE-----

--BWWlCdgt6QLN7tv3--
