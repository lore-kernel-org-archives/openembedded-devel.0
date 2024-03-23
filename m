Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CF5CD11DF
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:26 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.5244.1711183282393499526
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 4E60C5AAC3
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwE-1MMRGl0; Sat, 23 Mar 2024 09:41:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 11/13] gnome-shell-extensions: update 45.2 -> 46.0
Date: Sat, 23 Mar 2024 09:41:36 +0100
Message-ID: <20240323084138.178281-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1711183274-0CA7E850-89752E9D/0/0 CLEAN NORMAL
X-TOI-MSGID: 58d77cf0-3138-4676-b9d6-f5a353db127d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109542

46.0
=3D=3D=3D=3D
* system-monitor: Fix net speed [Florian; !313]
* Misc. bug fixes and cleanups [Aral; !311]

Contributors:
  Aral Balkan, Florian M=C3=BCllner

Translators:
  Anders Jonsson [sv], Piotr Dr=C4=85g [pl], Bal=C3=A1zs =C3=9Ar [hu], Mi=
lo Casagrande [it],
  Quentin PAG=C3=88S [oc], Athmane MOKRAOUI [kab], Changwoo Ryu [ko],
  Ask Hjorth Larsen [da]

46.rc
=3D=3D=3D=3D=3D
* Fix window previews in workspace indicator [Florian; !304]
* Fix menu ornament in workspace indicator [Florian; !305]
* Misc. bug fixes and cleanups [Florian; !306, !309]

Contributors:
  Florian M=C3=BCllner

Translators:
  Danial Behzadi [fa], Ekaterine Papava [ka], Sabri =C3=9Cnal [tr], Artur=
 S0 [ru],
  Yuri Chornoivan [uk], Vasil Pupkin [be], Asier Sarasua Garmendia [eu],
  Yaron Shahrabani [he], Brage Fuglseth [nb], Nathan Follens [nl],
  Aurimas =C4=8Cernius [lt], Matej Urban=C4=8Di=C4=8D [sl], Boyuan Yang [=
zh_CN],
  Kukuh Syafaat [id], Fran Dieguez [gl], Andi Chandler [en_GB],
  Baurzhan Muftakhidinov [kk], R=C5=ABdolfs Mazurs [lv], Guillaume Bernar=
d [fr],
  Daniel Mustieles [es], Jiri Gr=C3=B6nroos [fi]

46.beta
=3D=3D=3D=3D=3D=3D=3D
* apps-menu: Rename Applications to Apps [Allan; !299]
* Misc. bug fixes and cleanups [Florian; !296, !297, !300, !301, !302]

Contributors:
  Allan Day, Florian M=C3=BCllner

Translators:
  Gabriel Brand [de], Daniel Rusek [cs], Fran Dieguez [gl],
  Aefgh Threenine [th], Vasil Pupkin [be], Artur S0 [ru], Yosef Or Boczko=
 [he],
  Sabri =C3=9Cnal [tr]

46.alpha
=3D=3D=3D=3D=3D=3D=3D=3D
* workspace-indicator: Fix initial preview visibility [Florian; !280, !29=
2]
* screenshot-window-sizer: Fix cycling between sizes backwards [Florian; =
!284]
* Add back overview in Classic session [Florian; !287]
* Allow running Classic session headless [Jonas; !289]
* window-list: Fix buttons not being clickable at the screen edge
  [Florian; !291]
* Add system-monitor extension [Florian; !277]
* Fixed crash [Florian; !290]
* Misc. bug fixes and cleanups [Florian; !276, !275, !278, !281, !286, !2=
88]

Contributors:
  Jonas =C3=85dahl, Florian M=C3=BCllner

Translators:
  Kristjan SCHMIDT [eo], Brage Fuglseth [nb]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-shell-extensions_45.2.bb =3D> gnome-shell-extensions_46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_45.2=
.bb =3D> gnome-shell-extensions_46.0.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
45.2.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.=
0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
5.2.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.=
0.bb
index 49cd6b810..eff5fecff 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_45.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.0.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "ee32f6387a2d18adbff7a956689bc747866b4a87=
12d73790c002abeae4ccaaaf"
+SRC_URI[archive.sha256sum] =3D "d8138f88cd92df9f932309149c236fbdd77c1bc0=
95445036ab7eb0ecda53c01a"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.44.0


