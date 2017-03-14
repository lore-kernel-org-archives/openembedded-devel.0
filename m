Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id DA49477815
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:31:40 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id u48so127810819wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 09:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oG/O43NM7opjt6n/BW3C8vUCd6mRayBHOdEB85kV04A=;
	b=okcCLpmSBjYE+RlI7xcd0oI/JzMmbsIal+uCcgl7gy1cGK86lspwlUCI6ciZBsfo6m
	qXhMV6w06pW0sH+Ial3fgQ9r2C1EXaK1nMKKz0q956Fv5A+8Ce6Qq9qlh0y6HuGhDgjS
	yHzvfu4d2OjsFR1pygNZakYxxMLwlA3MbecguRN1R29vM8VHT7JX318HgShVBCvltZGE
	Dn4R9N0er09ChsYYeg7NuHKo6oj/04dbj1eyctC/eqLweMhJH1vmL1PDxIG//iXrUYiD
	ntVGM63MwnGjYUafIbiFgH+mvlkj2DLW/kfUTTuIMOJWxzd3EFAMUrCxTNI2AV4JkMI6
	n9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oG/O43NM7opjt6n/BW3C8vUCd6mRayBHOdEB85kV04A=;
	b=tQVOcCxo+RN1fpRBspGTOtG150PMSKwnUS+uqdjjW0SaBhzaBGEzlRoMviib7E00ot
	A38A7z4sYev9aqE0u1fmsEYG1/sD0wiRiXfsFd/qv9q+kNgJjsxB5K9bNaDyC6kwtzZR
	zRUMwvmyVJZYChtfajyAttGwYyH2r+UoLUNoEE6th+cJVs4N/N2Co+H7Y6qDaVIJ0hlW
	ze3yrJC//SwLONozbUjCHBOPNeQGHhms1/UHCIoeZezceYrXQqZozxvhXgNnuDCUCqsz
	j3OoENM6s70SE9e/fP+UAQD3RmzLW2atycyq6yO2YSIKcSAbb9IGZVcu69ucwsDwNgln
	XTmg==
X-Gm-Message-State: AMke39ku4eDl7SSzHFnd3nX3hxLbMk/tpkDWNsv9tMSxKmkQrUbyZ7KLbhNgAE2UPJFn6Q==
X-Received: by 10.223.133.6 with SMTP id 6mr34310371wrh.57.1489509101090;
	Tue, 14 Mar 2017 09:31:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	10sm29790657wrw.13.2017.03.14.09.31.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Mar 2017 09:31:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Mar 2017 17:31:45 +0100
To: akuster808 <akuster808@gmail.com>
Message-ID: <20170314163145.GC3917@jama>
References: <cover.1488813805.git.akuster808@gmail.com>
	<06247ffe-64ab-f5ab-76a7-9a18441f1fe8@gmail.com>
MIME-Version: 1.0
In-Reply-To: <06247ffe-64ab-f5ab-76a7-9a18441f1fe8@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/62] morty pull request
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
X-List-Received-Date: Tue, 14 Mar 2017 16:31:48 -0000
X-Groupsio-MsgNum: 65789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline

--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2017 at 02:29:54AM -0700, akuster808 wrote:
> Please merge meta-openembedded morty-next to morty.

Pushed, thanks!

> regards,
>=20
> Armin
>=20
>=20
>=20
> -------- Forwarded Message --------
> Subject: 	[PATCH 00/62] morty pull request
> Date: 	Mon, 6 Mar 2017 10:31:15 -0500
> From: 	Armin Kuster <akuster808@gmail.com>
> To: 	akuster808@gmail.com, openembedded-devel@lists.openembedded.org
>=20
>=20
>=20
> Please consider these changes for morty
>=20
> The following changes since commit 1efa5d623bc64659b57389e50be2568b1355d5=
f7:
>=20
>    gpsd: fix multilib build (2016-12-03 07:45:12 -0800)
>=20
> are available in the git repository at:
>=20
>    git://git.openembedded.org/meta-openembedded-contrib akuster/morty-next
>    http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dakuste=
r/morty-next
>=20
> Andreas M=FCller (4):
>    libtdb: fix SRC_URI - http has gone
>    libtevent: fix SRC_URI - http has gone
>    gnome-system-monitor: fix build after update of gnome c++ bindings
>    lmsensors: fix fetch and unblacklist
>=20
> Andreas Oberritter (3):
>    imagemagick: use correct major version in program suffix
>    samba: Avoid timeout for nmbd if started offline with systemd
>    samba: conditionalize sed call for onnode
>=20
> Andrej Valek (1):
>    libupnp: Fix out-of-bound access in create_url_list() (CVE-2016-8863)
>=20
> Andr=E9 Draszik (1):
>    meta_oe_security_flags: disable PIE for libdbus-c++
>=20
> Armin Kuster (11):
>    wireshark: update package to 2.2.4
>    wireshark: fix build issue
>    tcpdump: update to 4.9.0 for security fixes
>    netkit-ruser: update SRC_URI
>    ipsec-tools: change SRC_URI fetcher.
>    fetchmail: update SRC_URI
>    libdnet: update SRC_URI
>    python-sqlalchemy: fix SRC_URI
>    lm_sensors: update SRC_URI
>    exfat-utils: update SRC_URI
>    libdnet: Update SRC_URI to fix checksum errors
>=20
> Chai, Chong Yi (1):
>    libtalloc: fix SRC_URI to use https instead of http
>=20
> Chen Qi (3):
>    inetutils: fix alternative priority to avoid conflict
>    netcat-openbsd: fix ALTERNATIVE_PRIORITY to avoid conflict
>    tftp-hpa: fix ALTERNATIVE_PRIORITY to avoid conflict
>=20
> Haiqing Bai (1):
>    crda: check the word size of target instead of host machine.
>=20
> Jackie Huang (3):
>    squid: disable gnu atomic operations for mipsel
>    chrony: remove unrecognized option ipv6
>    samba: fix the hardcoded path in init script
>=20
> Jason Wessel (1):
>    tsock: Make use of LDFLAGS
>=20
> Joe Slater (1):
>    ntp: update to version 4.8p9
>=20
> Kai Kang (7):
>    samba: Fix qa issue and update ctdb-tests
>    samba: correct sub-package name for multilib
>    curlpp: fix qa issue of do_configure
>    postfix: add dependency icu
>    pimd: update SRC_URI
>    ctdb: update SRC_URI
>    openl2tp: update SRC_URI
>=20
> Khem Raj (10):
>    libvdpau: Disable PIE
>    mpv: Add PACKAGECONFIG for vaapi
>    meta_oe_security_flags.inc: Disable PIE for luajit
>    samba: Fix build with musl
>    crda: Fix build with clang
>    vlc: Add packageconfig for vdpau
>    mpv: Add libvdpau to DEPENDS
>    ipsec-tools: Fix build with clang
>    inetutils: Disable rsh, rcp, rlogin on musl
>    hplip: Fix build with clang
>=20
> Li Zhou (2):
>    net-snmp: fix snmptrap to use clientaddr from snmp.conf.
>    net-snmp: snmplib, UDPIPv6 transport: Add a missing return statement
>=20
> Mark Asselstine (2):
>    dnsmasq: read the conf files found in dnsmasq.d
>    dnsmasq: allow for dnsmasq instances to reuse default dnsmasq.conf
>=20
> Martin Jansa (1):
>    libxml++: fix LICENSE
>=20
> Max Krummenacher (1):
>    tinymembench: fix QA warning for GNU_HASH
>=20
> Nicolas Ferre (1):
>    nbench-byte: fix project URL
>=20
> Oleksandr Kravchuk (3):
>    wireshark: update to 2.2.3
>    tcpdump: upgrade to 4.8.1
>    iperf3: update to 3.1.3
>=20
> Ricardo Ribalda Delgado (1):
>    gflags: Fix fetch URL
>=20
> Robert Yang (2):
>    inetutils: do_configure: fix "Argument list too long"
>    lftp: do_configure: fix "Argument list too long"
>=20
> Thomas PERROT (1):
>    makedumpfile: add ARM into COMPATIBLE_HOST
>=20
> Zheng Ruoqin (1):
>    wireshark: 2.2.1 -> 2.2.2
>=20
>   .../recipes-utils/exfat-utils/exfat-utils_1.2.3.bb |   5 +-
>   .../gnome-system-monitor_2.28.2.bb                 |   2 +
>   .../libupnp/libupnp/CVE-2016-8863.patch            |  57 ++++++++++
>   .../recipes-connectivity/libupnp/libupnp_1.6.19.bb |   1 +
>   meta-multimedia/recipes-multimedia/vlc/vlc.inc     |   7 +-
>   .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch  |  58 +++++++++++
>   .../recipes-connectivity/crda/crda/make.patch      |  25 +++++
>   .../use-target-word-size-instead-of-host-s.patch   |  34 ++++++
>   .../recipes-connectivity/crda/crda_3.18.bb         |   8 +-
>   .../inetutils/inetutils_1.9.4.bb                   |  22 +++-
>   .../recipes-connectivity/lftp/lftp_4.7.3.bb        |   2 +
>   .../recipes-connectivity/libdnet/libdnet_1.12.bb   |   2 +-
>   ...void-timeout-for-nmbd-if-started-offline-.patch |  31 ++++++
>   .../samba/samba-4.4.5/samba-4.2.7-pam.patch        |  36 +++++++
>   .../samba-4.3.9-remove-getpwent_r.patch            |  87 ++++++++++++++=
++
>   .../recipes-connectivity/samba/samba_4.4.5.bb      |  32 +++++-
>   .../recipes-daemons/postfix/postfix.inc            |   4 +-
>   .../recipes-daemons/squid/squid_3.5.20.bb          |   1 +
>   .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |   2 +-
>   .../netkit-rusers/netkit-rusers_0.17.bb            |   4 +-
>   ...ix-snmptrap-to-use-clientaddr-from-snmp.c.patch |  48 +++++++++
>   ...IPv6-transport-Add-a-missing-return-state.patch |  29 ++++++
>   .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |   2 +
>   .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |   2 +-
>   .../recipes-protocols/tsocks/tsocks_1.8beta5.bb    |   3 +
>   .../recipes-support/chrony/chrony_2.4.bb           |   2 +-
>   meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb |   2 +-
>   .../recipes-support/curlpp/curlpp_0.7.3.bb         |   1 +
>   .../dnsmasq/files/dnsmasq-noresolvconf.service     |   2 +-
>   .../dnsmasq/files/dnsmasq-resolvconf.service       |   2 +-
>   .../recipes-support/dnsmasq/files/dnsmasq.conf     |   2 +-
>   .../recipes-support/fetchmail/fetchmail_6.3.26.bb  |   2 +-
>   .../ipsec-tools/0001-Fix-build-with-clang.patch    | 115 ++++++++++++++=
+++++++
>   .../ipsec-tools/ipsec-tools_0.8.2.bb               |   3 +-
>   .../recipes-support/libtalloc/libtalloc_2.1.8.bb   |   2 +-
>   .../recipes-support/libtdb/libtdb_1.3.10.bb        |   2 +-
>   .../recipes-support/libtevent/libtevent_0.9.29.bb  |   2 +-
>   .../recipes-support/netcat/netcat-openbsd_1.105.bb |   2 +-
>   .../ntp/{ntp_4.2.8p8.bb =3D> ntp_4.2.8p9.bb}         |   4 +-
>   meta-networking/recipes-support/pimd/pimd_2.1.8.bb |   2 +-
>   .../tcpdump/tcpdump/add-ptest.patch                |  25 ++---
>   .../tcpdump/{tcpdump_4.7.4.bb =3D> tcpdump_4.9.0.bb} |   9 +-
>   .../{wireshark_2.2.1.bb =3D> wireshark_2.2.4.bb}     |   7 +-
>   .../conf/distro/include/meta_oe_security_flags.inc |  13 +++
>   meta-oe/recipes-benchmark/iperf3/iperf3_git.bb     |   4 +-
>   .../nbench-byte/nbench-byte_2.2.3.bb               |   4 +-
>   .../tinymembench/tinymembench_git.bb               |   2 +
>   meta-oe/recipes-core/libxml/libxml++_2.38.1.bb     |   2 +-
>   ...de-cups-ppd.h-for-missing-ppd-definitions.patch |  42 ++++++++
>   meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |   1 +
>   .../makedumpfile/makedumpfile_1.6.0.bb             |   2 +-
>   meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb   |   3 +-
>   meta-oe/recipes-support/gflags/gflags_2.1.2.bb     |   7 +-
>   .../imagemagick/imagemagick_7.0.2.bb               |  46 ++++-----
>   .../recipes-support/lm_sensors/lmsensors_3.4.0.bb  |   8 +-
>   .../python/python-sqlalchemy_0.7.9.bb              |   5 +-
>   56 files changed, 738 insertions(+), 91 deletions(-)
>   create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp=
/CVE-2016-8863.patch
>   create mode 100644 meta-networking/recipes-connectivity/crda/crda/fix-i=
ssues-when-USE_OPENSSL-1.patch
>   create mode 100644 meta-networking/recipes-connectivity/crda/crda/make.=
patch
>   create mode 100644 meta-networking/recipes-connectivity/crda/crda/use-t=
arget-word-size-instead-of-host-s.patch
>   create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4=
=2E5/0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch
>   create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4=
=2E5/samba-4.2.7-pam.patch
>   create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.4=
=2E5/samba-4.3.9-remove-getpwent_r.patch
>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/=
0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/=
0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
>   create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-to=
ols/0001-Fix-build-with-clang.patch
>   rename meta-networking/recipes-support/ntp/{ntp_4.2.8p8.bb =3D> ntp_4.2=
=2E8p9.bb} (97%)
>   rename meta-networking/recipes-support/tcpdump/{tcpdump_4.7.4.bb =3D> t=
cpdump_4.9.0.bb} (85%)
>   rename meta-networking/recipes-support/wireshark/{wireshark_2.2.1.bb =
=3D> wireshark_2.2.4.bb} (94%)
>   create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-inc=
lude-cups-ppd.h-for-missing-ppd-definitions.patch
>=20
> --=20
> 2.9.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWMga8AAKCRA3VSO3ZXaA
HFHDAJ9TH0ghn94SlGjOHuWK6rNeK9Ut2ACeMHXCJVckH08RKezDeGyeZHTKyhs=
=nsTI
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
