Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EEC21731B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:03:58 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g62so4424564wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 06:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pDxJW7/b+E3chQ+CY2Ext+QGX6/vMhncRWC/Ctnq1eg=;
	b=ifsObFWdibjE9tc4R5n8eEcRNqA2OuSSwZapSRXp/R5/wN+CX9IS2d67WrTDAgAmBX
	i8eoEZysbAP72DaJjYZ7qSTUC3mKeFtzK039R+27qUvDPhNoJzP0e2RyheeKSuT3VOsv
	jvYqKnHuxt/4cj0SHe3h8meZiWnCqj5clvYdL/D7Fszuig4xMUoDXj5MawvteypGAHxm
	drOfPlBsDpQIha+CfFukdER3N0XyiwKaXsH/GkdgQBXXIzBrvjadXU9td9jGd4a/lu9Q
	E3/HtF3WSoVIWGg7C5Z6C3iZ4SenBPXATbGuoltqb5MGUzjiBQ9KtuV0kOaHzBZvMJpR
	b5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=pDxJW7/b+E3chQ+CY2Ext+QGX6/vMhncRWC/Ctnq1eg=;
	b=Pj1p/8xOMSZ/agq0abwf4mmB8o7RpnO+zBQ7fPcKXLnDBtEtt6Ramwzm1ny2Nuwt+/
	Me3QkAOM6tjHRQSMnRAQz1Q6XM1yIGGxnH975rn5RsgvuNYgDMw8rUcLT9GYOu4hsFE1
	Oyxu/3OXp4Co3li8zEbRdLQhzwOcNLTNYXy1adlcsDiH8Jn3O20K01JoK2PcLFTtz2TR
	lcpHHk/meeBHibkXqp+yFwHPO6IjO8U4TtH4tCCrSApHs8JQgrbt/nm9W+cWYM5hcSmt
	Nm0c0WsyZ7mNrQdoMnQoxr9lMnPDDELGg7Jv0KSf6swj2Mm8HOPmkyN0rjyErKrWCZlE
	bLHA==
X-Gm-Message-State: AG10YOSOPcgUwNJU+M3fl7JUl7P/xIBNC5nsJs5ATWUYZn3GdFbXuvle+tZQ5N6wIgLdrw==
X-Received: by 10.28.134.147 with SMTP id i141mr11868459wmd.87.1455113039090; 
	Wed, 10 Feb 2016 06:03:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v191sm3602662wme.1.2016.02.10.06.03.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Feb 2016 06:03:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Feb 2016 15:07:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160210140748.GC2609@jama>
References: <cover.1454879728.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1454879728.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 00/27][jethro V2] Pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Feb 2016 14:03:59 -0000
X-Groupsio-MsgNum: 59932
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Content-Disposition: inline

--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 07, 2016 at 01:22:47PM -0800, Armin Kuster wrote:
> please consider these changes for meta-openembedded jethro-next
>=20
> The following changes since commit 7bc138a365e20653ddfb9229561e3e9e50b89e=
e8:
>=20
>   cifs-utils: add PACKAGECONFIG for cifsidmap (2016-01-14 11:22:38 +0100)
>=20
> are available in the git repository at:
>=20
>   git://github.com/akuster/meta-openembedded akuster/jethro-next
>   https://github.com//tree/akuster/jethro-next
>=20
> Andreas M=FCller (1):
>   thunar: remove udisks from RRECOMMENDS
>=20
> Armin Kuster (5):
>   networkmanager: fix QA warning
>   qwt: Fix host-user-contaminated
>   php: Security fix CVE-2015-7803
>   php: Security fix CVE-2015-7804
>   php: Security fix CVE-2016-1903
>=20
> Christopher Larson (1):
>   lowpan-tools: add missing flex/bison deps
>=20
> Hongxu Jia (1):
>   postfix: fix clean broken issue
>=20
> Jackie Huang (3):
>   iscsitarget: split the kernel module into separate package
>   iscsitarget: skip the arch test for kernel modules
>   ncftp: fix build failures with ccdv
>=20
> Jens Rehsack (1):
>   waf-samba: enable parallel builds
>=20
> Joe Slater (1):
>   geoip: add ptest functionality
>=20
> Kai Kang (1):
>   xl2tpd: fix warnings with gcc 5
>=20
> Maciej Borzecki (1):
>   mozjs: fix linking issues on i586
>=20
> Mark Asselstine (1):
>   ctdb: Fix rootfs creation errors
>=20
> Martin Jansa (2):
>   ctdb: add dependency on libldb
>   terminus-font: update perl-native-runtime dependency

This breaks terminus-font build in jethro, because perl-native-runtime
was renamed only in oe-core master.

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'hostperl-runtime-native' (but meta-oe/meta-oe/reci=
pes-graphics/terminus-font/terminus-font_4.38.bb DEPENDS on or otherwise re=
quires it)
ERROR: Required build target 'terminus-font' has no buildable providers.
Missing or unbuildable dependency chain was: ['terminus-font', 'hostperl-ru=
ntime-native']

I'll drop this change from jethro-next, but we need to find a way to
better test these changes.

> Qi.Chen@windriver.com (1):
>   quagga: fix segment fault when stopping ospf6d
>=20
> Robert Yang (4):
>   nbd: use BPN in Files
>   cim-schema-exper: fix host-user-contaminated
>   ctdb: add PACKAGECONFIG for libtdb
>   netkit-ftp: fixed invalid symlink
>=20
> Ruslan Bilovol (1):
>   wireshark: update SRC_URI link to sources
>=20
> Wenzong Fan (1):
>   samba: add PACKAGECONFIG for valgrind
>=20
> Yi Zhao (2):
>   logwatch: fix host-user-contaminated
>   orrery: fix host-user-contaminated
>=20
>  .../21-add-config-option-without-valgrind.patch    |  63 ++++++++++
>  .../recipes-connectivity/samba/samba_4.1.12.bb     |   2 +
>  .../ncftp-configure-use-BUILD_CC-for-ccdv.patch    |  32 +++++
>  .../recipes-daemons/ncftp/ncftp_3.2.5.bb           |   7 +-
>  .../recipes-daemons/postfix/postfix.inc            |   2 +
>  .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  13 +-
>  .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   |   2 +-
>  ...heck-ospf6-before-using-it-in-ospf6_clean.patch |  28 +++++
>  .../recipes-protocols/quagga/quagga_0.99.24.1.bb   |   1 +
>  .../recipes-protocols/xl2tpd/xl2tpd.inc            |   4 +-
>  .../fix-inline-functions-errors-with-gcc-5.x.patch | 134 +++++++++++++++=
++++++
>  .../cim-schema/cim-schema-exper_2.39.0.bb          |   1 +
>  .../cim-schema/cim-schema-final_2.40.0.bb          |   1 +
>  ...rvice-ensure-the-PID-directory-is-created.patch |  25 ++++
>  meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |  11 +-
>  .../recipes-support/geoip/files/run-ptest          |  11 ++
>  .../recipes-support/geoip/geoip_1.6.6.bb           |  38 ++++++
>  .../lowpan-tools/lowpan-tools_git.bb               |   2 +-
>  meta-networking/recipes-support/nbd/nbd_3.11.bb    |   6 +-
>  .../recipes-support/wireshark/wireshark_1.12.8.bb  |   2 +-
>  meta-oe/classes/waf-samba.bbclass                  |   4 +
>  .../networkmanager/networkmanager_1.0.4.bb         |   1 +
>  .../php/php-5.6.12/CVE-2015-7803.patch             |  85 +++++++++++++
>  .../php/php-5.6.12/CVE-2015-7804.patch             |  64 ++++++++++
>  .../php/php-5.6.12/CVE-2016-1903.patch             |  55 +++++++++
>  meta-oe/recipes-devtools/php/php_5.6.12.bb         |   6 +-
>  .../recipes-extended/logwatch/logwatch_7.4.1.bb    |   1 +
>  ...010-fix-cross-compilation-on-i586-targets.patch |  46 +++++++
>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   1 +
>  .../terminus-font/terminus-font_4.38.bb            |   2 +-
>  meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   1 +
>  meta-oe/recipes-qt/qwt/qwt.inc                     |   1 +
>  meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb     |   2 +-
>  33 files changed, 632 insertions(+), 22 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.=
12/21-add-config-option-without-valgrind.patch
>  create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-con=
figure-use-BUILD_CC-for-ccdv.patch
>  create mode 100644 meta-networking/recipes-protocols/quagga/files/0001-o=
spf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
>  create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-i=
nline-functions-errors-with-gcc-5.x.patch
>  create mode 100644 meta-networking/recipes-support/ctdb/ctdb/service-ens=
ure-the-PID-directory-is-created.patch
>  create mode 100644 meta-networking/recipes-support/geoip/files/run-ptest
>  create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7803=
=2Epatch
>  create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2015-7804=
=2Epatch
>  create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/CVE-2016-1903=
=2Epatch
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0010-fix-cross-c=
ompilation-on-i586-targets.patch
>=20
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla7RDQACgkQN1Ujt2V2gBxxsgCgj91rIQrzYIbn0sAReO8Ehyt/
VIgAn2sEltgyiZxenKdWxthVAzf0C1+F
=1qr6
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--
