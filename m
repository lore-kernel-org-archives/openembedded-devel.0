Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB57CCF9EA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 04:18:13 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.20459.1761797884201985916
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 21:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout08.t-online.de (Postfix) with SMTP id 3A218DEC7
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:15:56 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.193]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vEK4q-4PCMb30; Thu, 30 Oct 2025 05:15:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gnome-software: update 48.3 -> 49.1
Date: Thu, 30 Oct 2025 05:15:50 +0100
Message-ID: <20251030041550.553580-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1761797756-A2FFA9DC-CF1153FE/0/0 CLEAN NORMAL
X-TOI-MSGID: 08b0fefc-0d71-4a1c-87a4-c160426b3869
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 04:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121183

Version 49.1
~~~~~~~~~~~~
Released: 2025-10-10
This is a stable release with the following changes:
 * Fixed search for additional packages requested by other apps
 * Fixed update notifications, which could be missed sometimes
This release also updates translations:
 * Bulgarian (twlvnn kraftwerk)
 * Catalan (Jordi Mas i Hernandez)
 * Chinese (Taiwan) (Cheng-Chia Tseng)
 * Esperanto (Kristjan SCHMIDT)
 * German (Tim Sabsch)
 * Hungarian (Bal=C3=A1zs Mesk=C3=B3)
 * Interlingua (International Auxiliary Language Association) (Emilio Sep=
=C3=BAlveda)
 * Occitan (post 1500) (Quentin PAG=C3=88S)
 * Portuguese (Hugo Carvalho)
 * Uighur (Abduqadir Abliz)
Version 49.0
~~~~~~~~~~~~
Released: 2025-09-12
This is a stable release with the following changes:
 * Flag flatpak gpg-agent socket permission as potentially unsafe
 * Do not animate featured carousel when animations are disabled
This release also updates translations:
 * Basque (Asier Saratsua Garmendia)
 * Catalan (Jordi Mas i Hernandez)
 * Danish (Alan Mortensen)
 * Dutch (Nathan Follens)
 * English (United Kingdom) (Andi Chandler)
 * Esperanto (Kristjan SCHMIDT)
 * Finnish (Jiri Gr=C3=B6nroos)
 * Galician (Fran Di=C3=A9guez)
 * Georgian (Ekaterine Papava)
 * Hebrew (Yaron Shahrabani)
 * Hungarian (Bal=C3=A1zs =C3=9Ar)
 * Korean (Seong-ho Cho)
 * Lithuanian (Aurimas Aurimas =C4=8Cernius)
 * Persian (Danial Behzadi)
 * Portuguese (Brazil) (Juliano de Souza Camargo)
 * Romanian (Antonio Marin)
 * Russian (Artur S0)
 * Spanish (Daniel Mustieles)
 * Swedish (Anders Jonsson)
 * Turkish (Sabri =C3=9Cnal)
 * Ukrainian (Yuri Chornoivan)
Version 49~rc
~~~~~~~~~~~~~
Released: 2025-08-29
This is an unstable release with the following changes:
 * Show past updates in rpm-ostree plugin
 * Always include Flatpak system installation
 * Correct total review counter
 * Support external release notes in AppStream data
 * Support light/dark screenshots in AppStream data
This release also updates translations:
 * Catalan (Jordi Mas)
 * Chinese (China) (Luming Zh)
 * Czech (Daniel Rusek)
 * Dutch (Nathan Follens)
 * Galician (Fran Di=C3=A9guez)
 * Japanese (Jun Oyamada)
 * Persian (Danial Behzadi)

 * Polish (Piotr Dr=C4=85g)
 * Russian (Artur S0)
 * Slovenian (Martin)
Version 49~beta
~~~~~~~~~~~~~~~
Released: 2025-08-01
This is an unstable release with the following changes:
 * Fix read of hardware support tags from app metainfo
 * Switch to systemd-based startup
This release also updates translations:
 * Chinese (Taiwan) (Cheng-Chia Tseng)
 * Friulian (Fabio Tomat)
 * Japanese (Takayuki Kusano)
 * Romanian (Antonio Marin)
 * Russian (Artur S0)
Version 49~alpha
~~~~~~~~~~~~~~~~
Released: 2025-06-27
This is an unstable release with the following changes:
 * Improve contrast of some app safety ratings in dark mode
 * Improve error handling when fetching app reviews
 * Improve memory fragmentation after checking for updates
 * Rewrite threading model for better performance
 * Provide feedback in the UI after submitting a review
 * Fix crash on application shutdown
 * Disallow running gnome-software as root user
This release also updates translations:
 * Belarusian (Vasil Pupkin)
 * Chinese (Taiwan) (Cheng-Chia Tseng)
 * Czech (Daniel Rusek)
 * English (United Kingdom) (Andi Chandler)
 * Friulian (Fabio Tomat)
 * German (Philipp Kiemle, Martin Wagner)
 * Interlingua (International Auxiliary Language Association) (Emilio Sep=
=C3=BAlveda)
 * Japanese (Makoto Sakaguchi)
 * Kabyle (Athmane MOKRAOUI)
 * Latvian (R=C5=ABdolfs Mazurs)
 * Nepali (Pawan Chitrakar)
 * Panjabi (A S Alam)
 * Portuguese (Brazil) (=C3=81lvaro Burns)
 * Romanian (Antonio Marin)
 * Slovenian (Martin)
 * Turkish (Emin Tufan =C3=87etin)
 * Ukrainian (Yuri Chornoivan)
 * Uzbek (Baxrom Raxmatov)
 * Vietnamese (Cas Pascal)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_48.3.bb =3D> gnome-software_49.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_48.3.bb =3D=
> gnome-software_49.1.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.3.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_48.3.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
index beca1e76a0..14ea91359e 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "126971e8bc000ddc200178c8fac8f7114eed42de=
4a4e2012ba06b3ffe707e23a"
+SRC_URI[archive.sha256sum] =3D "49dfeca77928801756d0c5386c1d20454ca07760=
0a5d1ed66ec46ee33a32c66d"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
@@ -39,5 +39,5 @@ PACKAGECONFIG[packagekit] =3D "-Dpackagekit=3Dtrue,-Dpa=
ckagekit=3Dfalse,gnome-packagek
 PACKAGECONFIG[fwupd] =3D "-Dfwupd=3Dtrue,-Dfwupd=3Dfalse,fwupd,fwupd"
 PACKAGECONFIG[malcontent] =3D "-Dmalcontent=3Dtrue,-Dmalcontent=3Dfalse,=
malcontent"
=20
-FILES:${PN} +=3D "${datadir}"
+FILES:${PN} +=3D "${datadir} ${systemd_user_unitdir}"
 FILES:${PN}-dev +=3D "${libdir}/gnome-software/libgnomesoftware.so"
--=20
2.51.0


