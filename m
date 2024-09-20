Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006D7CF58ED
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20385.1726844889991047230
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id BC7C4DE46
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfET-3JaG0Q0; Fri, 20 Sep 2024 17:07:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 10/23] gnome-software: update 46.2 -> 47.0
Date: Fri, 20 Sep 2024 17:08:09 +0200
Message-ID: <20240920150822.1131707-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726844861-357F8467-E1DB1560/0/0 CLEAN NORMAL
X-TOI-MSGID: 5ba3678d-936c-404c-bfae-8a1349e30684
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112411

Version 47.0
~~~~~~~~~~~~
Released: 2024-09-12
This is a stable release with the following changes:
 * Do not install example featured software lists by default (packagers s=
hould use gnome-app-list
   instead)
This release also updates translations:
 * Bokm=C3=A5l, Norwegian (Brage Fuglseth)
 * Bulgarian (twlvnn kraftwerk, Alexander Shopov)
 * Catalan (Jordi Mas i Hernandez)
 * Czech (Daniel Rusek)
 * Danish (Alan Mortensen)
 * English (United Kingdom) (Bruce Cowan)
 * Galician (Fran Dieguez)
 * Hungarian (Bal=C3=A1zs =C3=9Ar)
 * Indonesian (Andika Triwidada)
 * Italian (Davide Ferracin)
 * Kazakh (Baurzhan Muftakhidinov)
 * Lithuanian (Aurimas =C4=8Cernius)
 * Occitan (post 1500) (Quentin PAG=C3=88S)
 * Polish (Piotr Dr=C4=85g)
 * Portuguese (Hugo Carvalho)
 * Portuguese (Brazil) (Juliano de Souza Camargo)
 * Spanish (Daniel, Daniel Mustieles)
 * Swedish (Anders Jonsson)
 * Thai (Aefgh Threenine)
 * Turkish (Emin Tufan =C3=87etin)
Version 47~rc
~~~~~~~~~~~~~
Released: 2024-08-30
This is an unstable release with the following changes:
 * Update help pages and add some translations of them
 * Correct tooltips of review voting buttons
 * Lower power consumption when certain pages are not visible
This release also updates translations:
 * Basque (Asier Sarasua Garmendia)
 * Belarusian (Vasil Pupkin)
 * Bokm=C3=A5l, Norwegian (Brage Fuglseth)
 * Chinese (China) (Luming Zh)
 * Czech (Daniel Rusek)
 * Finnish (Jiri Gr=C3=B6nroos)
 * Georgian (Ekaterine Papava)
 * German (J=C3=BCrgen Benvenuti, Tim Sabsch)
 * Greek, Modern (1453-) (Giannis Antypas)
 * Hindi (Scrambled 777)
 * Korean (Seong-ho Cho)
 * Persian (Danial Behzadi)
 * Portuguese (Brazil) (Rafael Fontenelle, Juliano de Souza Camargo)
 * Russian (Artur S0)
 * Slovak (Matej Mrenica)
 * Turkish (Sabri =C3=9Cnal)
 * Ukrainian (Yuri Chornoivan)
Version 47~beta
~~~~~~~~~~~~~~~
Released: 2024-08-02
This is an unstable release with the following changes:
 * Shorten text in some notifications
 * Fix Orca not reading the contents in Preferences dialog
 * Enhance behavior of a review row
 * Added plugin to ease installation of DKMS and akmods key with enabled =
Secure Boot
This release also updates translations:
 * Greek, Modern (1453-) (Efstathios Iosifidis)

 * Hebrew (Yaron Shahrabani, Yosef Or Boczko)
 * Hindi (Scrambled 777)
 * Slovenian (Martin)
Version 47~alpha
~~~~~~~~~~~~~~~~
Released: 2024-06-28
This is an unstable release with the following changes:
 * Fix a crash when updating apps when built with Mogwai
 * Fix a crash when installing flatpak application
 * Correct desktop/mobile hardware support detection
 * Correct state of Fedora upgrade
 * Several fixes in historical updates for rpm-ostree
 * Fix a crash when no appstream data is found
 * Correct app safety calculation
 * Correct Flatpak system and user apps recognition
 * Slightly speed-up rpm-ostree metadata refresh
 * Show "Install All" button only for codecs
 * Prefer vendor name from os release in app origin
 * Make more jobs asynchronous
 * Port to recent Adwaita widgets
This release also updates translations:
 * Catalan (Jordi Mas i Hernandez)
 * Chinese (China) (Boyuan Yang)
 * Czech (Daniel Rusek)
 * Dutch (Nathan Follens)
 * Friulian (Fabio Tomat)
 * Georgian (Ekaterine Papava)
 * Hebrew (Yosef Or Boczko)
 * Kabyle (Athmane MOKRAOUI)
 * Panjabi (A S Alam)
 * Portuguese (Hugo Carvalho)
 * Russian (Artur S0)
 * Serbian (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=
=D0=B8=D1=9B)
 * Slovenian (Martin)
 * Spanish (Daniel Mustieles)
 * Turkish (Sabri =C3=9Cnal)
 * Ukrainian (Yuri Chornoivan)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_46.2.bb =3D> gnome-software_47.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_46.2.bb =3D=
> gnome-software_47.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.2.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_46.2.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_47.0.bb
index 244941786..4ed8ee396 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_46.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.0.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "e700cba287764f5e2255514e312e160550fdbf7a=
5d3fe16358bb6f7b6732b974"
+SRC_URI[archive.sha256sum] =3D "4f3e9b30f2d4885198329e46076e5ed9b5bd7e09=
9062ae627377ad8d9b9556ef"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.46.0


