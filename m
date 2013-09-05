Return-Path: <joe@deserted.net>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDF160FE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:09:16 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so895824eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=dICdYXYXzbftjGwvEGsVnFjeOPA0xJqd/nHZI1yCI1g=;
	b=BLcHUytk4aXMjluR5fdQmkYWf9yTd21AYxS/ndMCkDzOCCnEkUl4h2XZ0fLRFI30of
	t4pLSdIAVCkelLKeewW0410nF60LEJPNIlZsfkxzY3jnAProHkh2L2TuxiPD4Qlq/Tow
	/Em2OdPgdVQPmTHKMpzLlYVnXiNB0F61lcW4mTrWIA/SBKwHjYPJqJeOLoQLtB6RrTdk
	hP8r0x01u0WMcIspBMonI36DYTzLmNUE/oL6cGWu54/SfSDYSkH52recrvOPdWWRo8AO
	+K6CSwgUdBmMQpAB0MQ3brCToJx7xPlO04CWZlO44WfslU5Q3Loa/7/G53sFF5B++C7y
	D9PQ==
X-Gm-Message-State: ALoCoQkuO6VHLQn0hJf4PMGZ4fJQRauJ80k4KGfHXdqc75GcCMZssQp2i3yMhcs9LQWkX7GEv9T5
X-Received: by 10.15.48.197 with SMTP id h45mr13500736eew.0.1378386557455;
	Thu, 05 Sep 2013 06:09:17 -0700 (PDT)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	bn13sm48551560eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:09:16 -0700 (PDT)
Date: Thu, 5 Sep 2013 09:09:12 -0400
From: Joe MacDonald <joe@deserted.net>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20130905130910.GH5086@deserted.net>
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
X-List-Received-Date: Thu, 05 Sep 2013 13:09:16 -0000
X-Groupsio-MsgNum: 46097
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3ecMC0kzqsE2ddMN"
Content-Disposition: inline

--3ecMC0kzqsE2ddMN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH] stunnel: Add 4.56 version] On 13.09.05 (Thu 0=
6:06) Laszlo Papp wrote:

> Seriously: ping?

I guess I should've replied directly to this rather than burying my
follow-up on it in another thread.  Sorry.  It's been merged and is in a
small queue of other fixes and updates I'm about to push.

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

--3ecMC0kzqsE2ddMN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIognYACgkQwFvcllog0XxemQCffs+XR5r8/tYSR//NHgQGHMqE
8gUAn0qBqnWo6cGzxzF746cZVYHNzOqj
=IIqU
-----END PGP SIGNATURE-----

--3ecMC0kzqsE2ddMN--
