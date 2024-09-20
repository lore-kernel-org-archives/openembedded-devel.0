Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C71C7885C
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20388.1726844890136901566
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id C5BC0DE4C
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEU-3JaG0V0; Fri, 20 Sep 2024 17:07:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 15/23] gnome-shell: update 46.2 -> 47.0
Date: Fri, 20 Sep 2024 17:08:14 +0200
Message-ID: <20240920150822.1131707-15-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726844862-B77FC467-DC4923E9/0/0 CLEAN NORMAL
X-TOI-MSGID: 2759a50e-ded0-4935-b2d4-aa14b5f3f23c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112418

47.0
=3D=3D=3D=3D
* Fix new wifi connections for restricted users [Thore; !3462]
* Do not disable required animations [Alessandro; !2986]
* Fix showing pending PAM messages on login screen [Marco; !3466]
* Misc. bug fixes and cleanups [Alessandro, Ball=C3=B3, Sundeep, Martin, =
Peter,
  Florian; !3446, !3374, !3439, !3464, !3465]
Contributors:
  Alessandro Bono, Ball=C3=B3 Gy=C3=B6rgy, Peter Hutterer, Martin Abente =
Lahaye,
  Sundeep Mediratta, Florian M=C3=BCllner, Thore Sommer, Marco Trevisan (=
Trevi=C3=B1o)
Translators:
  Aefgh Threenine [th], Ir=C3=A9n=C3=A9e THIRION [fr], twlvnn kraftwerk [=
bg],
  Alexander Shopov [bg], Daniel Mustieles [es], Aurimas =C4=8Cernius [lt]=
,
  Fran Dieguez [gl], Anders Jonsson [sv], Andi Chandler [en_GB],
  Ask Hjorth Larsen [da], R=C5=ABdolfs Mazurs [lv], Bal=C3=A1zs =C3=9Ar [=
hu]
47.rc
=3D=3D=3D=3D=3D
* Fix smartcard logins [Alessandro; !3448]
* Mark drag to dash as move operation [Daniel; !3453]
* Use rst2man to generate man pages [Florian; !3454]
* Fix glitch when quick settings menu animation is interrupted [Dylan; !2=
481]
* Plugged leak [Jonas; !3421]
* Misc. bug fixes and cleanups [Bilal, Florian, Sophie, Jonas; Martin; !3=
433,
  !3441, !3443, !3447, !3450, !3451, !3449, !3455, !3456, !3452, !3458, !=
3459]
Contributors:
  Jonas =C3=85dahl, Alessandro Bono, Bilal Elmoussaoui, Sophie Herold,
  Martin Abente Lahaye, Dylan McCall, Florian M=C3=BCllner, Daniel Sheele=
r
Translators:
  Bal=C3=A1zs =C3=9Ar [hu], Yosef Or Boczko [he], Giannis Antypas [el],
  Daniel =C8=98erb=C4=83nescu [ro], Jordi Mas [ca], Ekaterine Papava [ka]=
,
  Asier Sarasua Garmendia [eu], Artur S0 [ru], Vasil Pupkin [be],
  Rafael Fontenelle [pt_BR], Jordi Mas i Hernandez [ca], Yuri Chornoivan =
[uk],
  Luming Zh [zh_CN], Jose Riha [sk], Jiri Gr=C3=B6nroos [fi], J=C3=BCrgen=
 Benvenuti [de],
  Brage Fuglseth [nb], Daniel Rusek [cs], Danial Behzadi [fa],
  Quentin PAG=C3=88S [oc], Changwoo Ryu [ko], Hugo Carvalho [pt], Piotr D=
r=C4=85g [pl],
  Andika Triwidada [id], Baurzhan Muftakhidinov [kk], Sabri =C3=9Cnal [tr=
]
47.beta
=3D=3D=3D=3D=3D=3D=3D
* Use hardware encoding for screen recordings if possible [Jonas D.; !208=
0]
* Allow notification portal to always use GTK protocol [Julian; !3382]
* Improve Persian on-screen keyboard layout [Sohrab; !3409]
* Build and publish GNOME OS systemd-sysext extensions [Martin; !3390]
* Make overview startup notification more reliable [Will; !3422, !3428]
* Fix keyboard navigation in app folders [sorelz; !3338]
* Support exporting DebugControl service from looking glass [Sebastian; !=
3425]
* Use low-power pipeline in screen recorder if possible [Jos=C3=A9; !3416=
]
* Show notification when detecting captive portal [Florian; !3408]
* Fix connecting to WPA2 enterprise networks [Tuomas; !3426]
* Use unlinked rounded buttons in notifications and dialogs [Sam; !3383, =
!3427]
* Misc. bug fixes and cleanups [Jonas =C3=85., Florian, Sam, Bilal, kramo=
, Julian,
  sorelz, Sebastian; !3363, !3411, !3413, !3414, !3412, !3402, !3423, !34=
20,
  !3415, !3410, !3168, !3387, !3424, !3432, !3431, !3430]
Contributors:
  Jonas =C3=85dahl, Sohrab Behdani, Jonas Dre=C3=9Fler, Bilal Elmoussaoui=
, Sam Hewitt,
  kramo, Martin Abente Lahaye, Florian M=C3=BCllner, Tuomas Nurmi, Jos=C3=
=A9 Relvas,
  sorelz, Julian Sparber, Will Thompson, Sebastian Wick
Translators:
  Ekaterine Papava [ka], Scrambled 777 [hi], Sabri =C3=9Cnal [tr], Martin=
 [sl],
  Chao-Hsiung Liao [zh_TW], Daniel Rusek [cs], Emin Tufan =C3=87etin [tr]
47.alpha
=3D=3D=3D=3D=3D=3D=3D=3D

* Fix size of workspace switcher OSD [Jakub; !3282]
* Fix handling of invalid TLS certs in portal handler [Sebastian K.; !328=
4]
* Exclude override-redirect windows from workspace animation [Marco; !328=
5]
* Also center time on lock screen when using 12h format [pesader; !3290]
* Use absolute tray icon position in root event coordinates [Marco; !3283=
]
* Fix displaying info messages on login screen [Ray; !3298]
* Correct expected bus name for streams [Simon; !3303]
* Fix notifications on lock screen [Florian; !3308]
* notifications: Only apply special styling to symbolic icons [Florian; !=
3296]
* Use three or more fingers for touchpad gestures [Gregor; !3275]
* Fix number of search results with Large Text option [Sam H.; !3312]
* Make overview spacings dynamic [Jonas D.; !3278]
* Fix showing keyboard layouts with variants [Sebastian K.; !3324]
* Tweak font sizes in calendar [Sam H.; !3313]
* automountManager: Fix re-asking password for TCRYPT devices [segfault; =
!3300]
* Port unit tests to jasmine [Sam S., Florian; !3164]
* Fix stuck unlock prompt when animations are disabled [Florian; !3317]
* Add extended on-screen keyboard layout for 'za' [Michael; !3309]
* Fix possible hang on startup during ibus-daemon launch [Marco; !3293]
* Allow fillPreferencesWindow() to be asyn [Leleat; !3348]
* Fix on-screen keyboard when windows are unredirected [Carlos; !3356]
* Switch to paint nodes [Georges; !1538]
* Stop using SVG assets for checks and switches [Alice, Daniel; !2717]
* Support accent color [Alice; !2715]
* Fix rendering artifacts of some rounded borders [Jonas D.; !3354]
* Fix overview animation glitch when windows overlap workspaces [Keyu; !3=
378]
* Support building with X11-less mutter [Bilal; !3362]
* Misc. bug fixes and cleanups [Monster, Sebastian W., Jamie, Florian, Ga=
briel,
  pesader, Sebastian K., Automeris, Jonas =C3=85., Sam H., Jonas D., Ray,=
 Bilal,
  Georges, Mister, Philip, Marco, Jakub, Jordan, Ball=C3=B3, Alessandro, =
Sundeep;
  !3224, !3267, !3254, !3280, !3248, !3281, !3289, !3288, !3270, !3295, !=
3299,
  !3310, !3315, !3322, !3326, !3321, !3319, !3329, !3327, !3314, !3320, !=
3331,
  !3337, !3245, !3332, !3340, !3344, !3347, !3350, !3349, !3351, !3352, !=
3353,
  !3355, !3358, !3357, !3359, !3307, !3323, !3365, !3366, !3367, !3369, !=
3370,
  !3361, !3142, !3368, !3291, !3371, !3375, !3311, !3376, !3377, !3380, !=
3373,
  !3385, !3386, !3396, !3398, !3403]
Contributors:
  Jonas =C3=85dahl, Daniel Ruiz de Alegr=C3=ADa, Alessandro Bono, Jonas D=
re=C3=9Fler,
  Bilal Elmoussaoui, Michael Evans, Carlos Garnacho, Jamie Gravendeel,
  Ball=C3=B3 Gy=C3=B6rgy, Sam Hewitt, Sebastian Keller, Leleat, Simon McV=
ittie,
  Sundeep Mediratta, Alice Mikhaylenko, Monster, Florian M=C3=BCllner, Ga=
briel Nagy,
  Automeris naranja, Georges Basile Stavracas Neto, Gregor Niehl, pesader=
,
  Jordan Petridis, segfault, Mister Sm=C3=B6r, Sam Spilsbury, Jakub Stein=
er,
  Ray Strode, Keyu Tao, Marco Trevisan (Trevi=C3=B1o), Sebastian Wick,
  Philip Withnall
Translators:
  Martin [sl], Andika Triwidada [id], Yuri Chornoivan [uk], Hugo Carvalho=
 [pt],
  Scrambled 777 [hi], Jose Riha [sk], Bal=C3=A1zs =C3=9Ar [hu], Quentin P=
AG=C3=88S [oc],
  Artur S0 [ru], Yosef Or Boczko [he]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-shell-extensions_46.2.bb =3D> gnome-shell-extensions_47.0.bb} | 2 +-
 .../gnome-shell/{gnome-shell_46.2.bb =3D> gnome-shell_47.0.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_46.2=
.bb =3D> gnome-shell-extensions_47.0.bb} (84%)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_46.2.bb =3D> gn=
ome-shell_47.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
46.2.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.=
0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
6.2.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.=
0.bb
index 5c2ae0593..d3c491b84 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.0.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "d442e9d26925125ff215a5c13429049565538074=
1daafbb37a3a99d6f0c7d86f"
+SRC_URI[archive.sha256sum] =3D "50f04f7ba50eded10cea07a4705fb3363e86926d=
10011be5b25037566770834f"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb
index 0a52de7a3..a567e3e4a 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "6b587101c04bfb364ab09cd38b5d93ebeeb42547=
54c807cf712fbc8ee3fde238"
+SRC_URI[archive.sha256sum] =3D "7a20770c6290ad69a9a82c8497cb27e1bf863f38=
7db25e98e542e4f6c5f06ded"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.46.0


