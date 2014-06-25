Return-Path: <joe@deserted.net>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8558165CD5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 01:19:34 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id y20so1041914ier.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 18:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Us41XJfZXcaggexMzfGMiWIE/Y2BXy4MscM1k0NHRE8=;
	b=SajzSYssm1r0XBOgCgIyZ5H7a/3HrtvDeufBIoechrlNP8y5EeA9lHBlVkQIaT1Q3j
	p7Qvb24vyyDENYbwODy8Qpi9DZIsMEqz3tt/qXeqViE97sjYkNFDmII3QROPJGjqS6vJ
	4Cr+VmMdKdDeubwv2ECD/2jXd8zZITsSBS+KglMRu8EOPXbg8I/r3iHx3o691KNh28sU
	DnoxVrRZwG+ahR39v9wJBq6k6Bx80FfPvTYpfjMwBiHcSFvrYh1eBzmROP+Q8FfYAIMZ
	0hYXOyioLomdDdwOsU6vzkqULF0RuNMhTejjuPRKDhADQolXh+CE760xAq3bj8fDuJdW
	UEOw==
X-Gm-Message-State: ALoCoQmviK2PffGhjIZHZuMKfSVUd97VxHa/2ce8NBu4NYsLzmFxLak69UKrgomSO91beL67ShEE
X-Received: by 10.42.98.145 with SMTP id s17mr66324icn.73.1403659175088;
	Tue, 24 Jun 2014 18:19:35 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id o19sm2240374igi.20.2014.06.24.18.19.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 18:19:34 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id F396F168543; Tue, 24 Jun 2014 21:19:32 -0400 (EDT)
Date: Tue, 24 Jun 2014 21:19:32 -0400
From: Joe MacDonald <joe@deserted.net>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140625011930.GB31512@deserted.net>
References: <1402596658-17371-1-git-send-email-fcooper@ti.com>
	<20140616031308.GA29515@deserted.net>
	<8F29D6B095ED194EA1980491A5E029710C6D711A@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6D711A@DFLE08.ent.ti.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] ptpd: update to 2.3.0
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
X-List-Received-Date: Wed, 25 Jun 2014 01:19:43 -0000
X-Groupsio-MsgNum: 50563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] ptpd: update to 2.3.0] On 14.06.24 (Tue =
17:49) Cooper Jr., Franklin wrote:

> ping

Thanks for the reminder, I'd missed this one.  Looking at it now.

-J.

>=20
> > -----Original Message-----
> > From: Joe MacDonald [mailto:joe@deserted.net] On Behalf Of Joe MacDonald
> > Sent: Sunday, June 15, 2014 10:13 PM
> > To: Cooper Jr., Franklin
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH] ptpd: update to 2.3.0
> >=20
> > This gave me a bit of trouble, I'll circle back to it tomorrow, probabl=
y.
> >=20
> > -J.
> >=20
> > [[oe] [meta-networking][PATCH] ptpd: update to 2.3.0] On 14.06.12 (Thu
> > 13:10) Franklin S. Cooper Jr wrote:
> >=20
> > > ---
> > >  .../ptpd/ptpd-2.2.0/ld-as-needed.patch             |   37 ----------=
----------
> > >  .../ptpd/{ptpd_2.2.0.bb =3D> ptpd_2.3.0.bb}          |   21 ++++++--=
---
> > >  2 files changed, 11 insertions(+), 47 deletions(-)  delete mode
> > > 100644
> > > meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> > >  rename meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb =3D>
> > > ptpd_2.3.0.bb} (57%)
> > >
> > > diff --git
> > > a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> > > b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> > > deleted file mode 100644
> > > index 7d5251b..0000000
> > > ---
> > > a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> > > +++ /dev/null
> > > @@ -1,37 +0,0 @@
> > > -Patch from http://patch-tracker.debian.org/package/ptpd
> > > -
> > > -Description: Fix ld --as-needed
> > > - This patch fixes the order of gcc arguments to fix ld --as-needed
> > > -Author: Roland Stigge <stigge@antcom.de>
> > > -Bug-Debian: http://bugs.debian.org/607583
> > > -
> > > -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > ----
> > > - src/Makefile |    4 ++--
> > > - 1 files changed, 2 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/src/Makefile b/src/Makefile -index a672625..88a2fc8
> > > 100644
> > > ---- a/src/Makefile
> > > -+++ b/src/Makefile
> > > -@@ -40,7 +40,7 @@ CFLAGS +=3D -DDBG_SIGUSR2_CHANGE_DEBUG
> > > -
> > > - CFLAGS +=3D -DPTP_EXPERIMENTAL
> > > -
> > > --LDFLAGS+=3D -lm -lrt
> > > -+LIBS +=3D -lm -lrt
> > > -
> > > - PROG =3D ptpd
> > > - SRCS =3D ptpd.c arith.c bmc.c protocol.c display.c\ -@@ -63,7 +63,7=
 @@
> > > TAGFILES =3D GPATH GRTAGS GSYMS GTAGS cscope.in.out cscope.out
> > > cscope.po.out
> > > - all: $(PROG)
> > > -
> > > - $(PROG): $(OBJS)
> > > --	$(CC) -o $@ $(OBJS) $(LDFLAGS)
> > > -+	$(CC) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)
> > > -
> > > - $(OBJS): $(HDRS)
> > > -
> > > ---
> > > -1.7.4
> > > -
> > > diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> > > b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > > similarity index 57%
> > > rename from meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> > > rename to meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > > index f2e895d..1febbb1 100644
> > > --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> > > +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > > @@ -6,23 +6,24 @@ time coordination of LAN connected computers."
> > >  HOMEPAGE =3D "http://sourceforge.net/projects/ptpd"
> > >  SECTION =3D "network"
> > >  LICENSE =3D "BSD"
> > > -LIC_FILES_CHKSUM =3D
> > "file://../COPYRIGHT;md5=3D3d8ac2c46c116bce2d2ad838b6cf3491"
> > > +LIC_FILES_CHKSUM =3D
> > "file://COPYRIGHT;md5=3D4019cad2b3cd55f22ea819ffad6ccd41"
> > >
> > > -PR =3D "r1"
> > > +DEPENDS =3D "libpcap"
> > >
> > > -SRC_URI =3D
> > "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.ta=
r.gz
> > \
> > > -           file://ld-as-needed.patch;striplevel=3D2 \
> > > -"
> > > +PR =3D "r0"
> > >
> > > -SRC_URI[md5sum] =3D "c63a3a149d30c710773ccb02df5782a3"
> > > -SRC_URI[sha256sum] =3D
> > "f2266a22db84318d8b9ce266ea83772c03438c31f4993fa9643fa675a07c26b4"
> > > +inherit autotools
> > >
> > > -S =3D "${WORKDIR}/ptpd-${PV}/src"
> > > +SRC_URI =3D
> > "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-
> > ${PV}.tar.gz"
> > > +
> > > +S =3D "${WORKDIR}/ptpd-${PV}"
> > > +SRC_URI[md5sum] =3D "f5e931b4a229705ff0dbdfe22490566b"
> > > +SRC_URI[sha256sum] =3D
> > "1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7"
> > >
> > >  EXTRA_OEMAKE =3D ""
> > >
> > >  do_install() {
> > >      install -d ${D}${bindir} ${D}${mandir}/man8
> > > -    install -m 0755 ptpd2 ${D}${bindir}
> > > -    install -m 0644 ptpd2.8 ${D}${mandir}/man8
> > > +    install -m 0755 ${S}/src/ptpd2 ${D}${bindir}
> > > +    install -m 0644 ${S}/src/ptpd2.8 ${D}${mandir}/man8
> > >  }
> > > --
> > > 1.7.0.4
> > >
> > --
> > -Joe MacDonald.
> > :wq
--=20
-Joe MacDonald.
:wq

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlOqI6IACgkQwFvcllog0XxgKQCfd7A/DtCMrOhfo8noASnWoWdd
ALIAoKlB9Eo8UHIoQGK3wzlCJtickogg
=XO9Y
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
