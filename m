Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CBACCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 18:01:07 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.4067.1759341660166011800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 11:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id CE1A1E813
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Oct 2025 20:00:57 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.168.197]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v418J-1IYEFt0; Wed, 1 Oct 2025 20:00:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] rygel: update 44.1 -> 45.0
Date: Wed,  1 Oct 2025 20:00:49 +0200
Message-ID: <20251001180049.499855-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1759341655-3E7FBA33-0169D01C/0/0 CLEAN NORMAL
X-TOI-MSGID: af1f93f3-9f7a-4412-ae44-5984422d724e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 18:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120144

- adjust PACKAGECONFIG for gtk and localsearch

45 (stable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Translation updates

All contributors to this release:
 - Alan Mortensen <alanmortensen.am@gmail.com>
 - Anders Jonsson <anders.jonsson@norsjovallen.se>
 - Antonio Marin <gnmer.6qxyg@slmail.me>
 - Asier Saratsua Garmendia <asiersarasua@ni.eus>
 - Aurimas Aurimas =C4=8Cernius <aurisc4@gmail.com>
 - Bal=C3=A1zs =C3=9Ar <balazs@urbalazs.hu>
 - Changwoo Ryu <cwryu@debian.org>
 - Daniel Mustieles <daniel.mustieles@gmail.com>
 - Daniel Rusek <mail@asciiwolf.com>
 - Ekaterine Papava <papava.e@gtu.ge>
 - Hugo Carvalho <hugokarvalho@hotmail.com>
 - Jordi Mas i Hernandez <jmas@softcatala.org>
 - Juliano de Souza Camargo <julianosc@protonmail.com>
 - Nathan Follens <nfollens@gnome.org>
 - Quentin PAG=C3=88S <pages_quentin@hotmail.com>
 - Yuri Chornoivan <yurchor@ukr.net>

Added/updated translations:
 - po/ca.po, courtesy of Jordi Mas i Hernandez
 - po/cs.po, courtesy of Daniel Rusek
 - po/da.po, courtesy of Alan Mortensen
 - po/es.po, courtesy of Daniel Mustieles
 - po/eu.po, courtesy of Asier Saratsua Garmendia
 - po/hu.po, courtesy of Bal=C3=A1zs =C3=9Ar
 - po/ka.po, courtesy of Ekaterine Papava
 - po/ko.po, courtesy of Changwoo Ryu
 - po/lt.po, courtesy of Aurimas Aurimas =C4=8Cernius
 - po/nl.po, courtesy of Nathan Follens
 - po/oc.po, courtesy of Quentin PAG=C3=88S
 - po/pt_BR.po, courtesy of Juliano de Souza Camargo
 - po/pt.po, courtesy of Hugo Carvalho
 - po/ro.po, courtesy of Antonio Marin
 - po/sv.po, courtesy of Anders Jonsson
 - po/uk.po, courtesy of Yuri Chornoivan

45.rc (unstable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

LocalSearch:
 - Fix file upload

All contributors to this release:
 - Danial Behzadi <dani.behzi@ubuntu.com>
 - Jens Georg <mail@jensge.org>
 - Yaron Shahrabani <sh.yaron@gmail.com>
 - luming zh <lumingzh@qq.com>
 - Fran Di=C3=A9guez <frandieguez@gnome.org>
 - Piotr Dr=C4=85g <piotrdrag@gmail.com>
 - Artur S0 <arturios05@bk.ru>

Added/updated translations:
 - fa.po, courtesy of Danial Behzadi
 - gl.po, courtesy of Fran Dieguez
 - he.po, courtesy of Yaron Shahrabani
 - pl.po, courtesy of Piotr Dr=C4=85g
 - ru.po, courtesy of Artur So
 - zh_CN.po, courtesy of lumingzh

45.beta (unstable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

LocalSearch:
 - Fix UPnP container contents after store update
 - Fix graph names

Bugs fixed in this release:
 - https://gitlab.gnome.org/GNOME/rygel/issues/110

All contributors to this release:
 - Jens Georg <mail@jensge.org>
 - Emin Tufan =C3=87etin <etcetin@gmail.com>

Added/updated translations:
 - tr.po, courtesy of Emin Tufan =C3=87etin

45.alpha (unstable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Major changes:
 - Port UI parts to GTK4
 - Drop support for Tracker 3
 - Add support for LocalSearch

Presets:
 - Fix OpenH264 preset config
 - Add more presets for other codecs

Transcoding:
 - Remove WMV decoder from list of default-enabled transcoders

Server:
 - Support .ssa subtitles

Bugs fixed in this release:
 - https://gitlab.gnome.org/GNOME/rygel/issues/240
 - https://gitlab.gnome.org/GNOME/rygel/issues/241
 - https://gitlab.gnome.org/GNOME/rygel/issues/242

All contributors to this release:
 - Jens Georg <mail@jensge.org>
 - Pawan Chitrakar <chautari@gmail.com>
 - Vasil Pupkin <3abac@3a.by>
 - Yuki Okushi <yokushi@gnome.org>
 - Martin <miles@filmsi.net>
 - Piotr Dr=C4=85g <piotrdrag@gmail.com>
 - Baxrom Raxmatov <magdiyevbahrom@gmail.com>

Added/updated translations:
 - be.po, courtesy of Yuras Shumovich
 - ja.po, courtesy of Yuki Okushi
 - ne.po, courtesy of Pawan Chitrakar
 - sl.po, courtesy of Martin Srebotnjak

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../rygel/{rygel_0.44.1.bb =3D> rygel_45.0.bb}           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.44.1.bb =3D> =
rygel_45.0.bb} (91%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb b=
/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
similarity index 91%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
index 6423d51a31..a5574c6b82 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
@@ -20,13 +20,13 @@ inherit gnomebase features_check vala gobject-introsp=
ection gettext systemd
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be c=
onfigured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
=20
-SRC_URI[archive.sha256sum] =3D "7b2c631b842408da27a54242f8082aba49bd1ca0=
2041e79e1eefba0c7009a87b"
+SRC_URI[archive.sha256sum] =3D "82667b902fc0672e64cf91eb727a70137a8fdfe7=
a3d9a4c158b0f4b1fc700882"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 EXTRA_OEMESON =3D "-Dengines=3Dgstreamer -Dplugins=3D${@strip_comma('${R=
YGEL_PLUGINS}')}"
-PACKAGECONFIG:append =3D "${@bb.utils.contains("DISTRO_FEATURES", "x11",=
 " gtk+3", "", d)}"
+PACKAGECONFIG:append =3D "${@bb.utils.contains("DISTRO_FEATURES", "x11 o=
pengl", " gtk4", "", d)}"
=20
 PACKAGECONFIG ?=3D "external mpris ruih gst-launch media-export"
=20
@@ -35,8 +35,8 @@ PACKAGECONFIG[mpris] =3D ""
 PACKAGECONFIG[ruih] =3D ""
 PACKAGECONFIG[media-export] =3D ""
 PACKAGECONFIG[gst-launch] =3D ""
-PACKAGECONFIG[tracker3] =3D ""
-PACKAGECONFIG[gtk+3] =3D ",-Dgtk=3Ddisabled,gtk+3"
+PACKAGECONFIG[localsearch] =3D ""
+PACKAGECONFIG[gtk4] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabled,gtk4"
=20
 RYGEL_PLUGINS =3D ""
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'externa=
l', ',external', '', d)}"
@@ -44,7 +44,7 @@ RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGE=
CONFIG', 'mpris', ',mpris',
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'ruih', =
',ruih', '', d)}"
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'gst-lau=
nch', ',gst-launch', '', d)}"
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'media-e=
xport', ',media-export', '', d)}"
-RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'tracker=
3', ',tracker3', '', d)}"
+RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'localse=
arch', ',localsearch', '', d)}"
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'playbin=
', ',playbin', '', d)}"
=20
 LIBV =3D "2.8"
--=20
2.51.0


