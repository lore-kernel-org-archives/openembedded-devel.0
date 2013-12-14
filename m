Return-Path: <Prabhu.Sundararaj@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id BCCB360F4A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2013 17:29:45 +0000 (UTC)
Received: from mail78-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.22; Sat, 14 Dec 2013 17:29:44 +0000
Received: from mail78-ch1 (localhost [127.0.0.1])	by mail78-ch1-R.bigfish.com
	(Postfix) with ESMTP id 4A3181407C7	for
	<openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2013 17:29:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 8
X-BigFish: VS8(zzc89bha1fflb922lzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h1155h)
Received: from mail78-ch1 (localhost.localdomain [127.0.0.1]) by mail78-ch1
	(MessageSwitch) id 1387042181339191_32635;
	Sat, 14 Dec 2013 17:29:41 +0000 (UTC)
Received: from CH1EHSMHS018.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.251])	by mail78-ch1.bigfish.com (Postfix) with ESMTP id
	479F84A004C;	Sat, 14 Dec 2013 17:29:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS018.bigfish.com
	(10.43.70.18) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Sat, 14 Dec 2013 17:29:36 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Sat, 14 Dec 2013 17:29:35 +0000
Received: from blueale.am.freescale.net (blueale.am.freescale.net
	[10.81.16.90])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP
	id rBEHTYv5030046;	Sat, 14 Dec 2013 10:29:35 -0700
From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 14 Dec 2013 17:29:59 -0600
Message-ID: <1387063799-2777-1-git-send-email-prabhu.sundararaj@freescale.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-browser][PATCH] Chromium : update to version 33
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
X-List-Received-Date: Sat, 14 Dec 2013 17:29:46 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
---
 .../chromium-29.0.1518.2/armv6/include.gypi        |   8 -
 .../chromium-29.0.1518.2/armv6/oe-defaults.gypi    |  15 --
 .../chromium-29.0.1518.2/armv7a/include.gypi       |   9 -
 .../chromium-29.0.1518.2/armv7a/oe-defaults.gypi   |  15 --
 .../chromium/chromium-29.0.1518.2/google-chrome    |   7 -
 .../chromium-29.0.1518.2/google-chrome.desktop     | 222 ---------------=
------
 .../chromium-29.0.1518.2/i586/include.gypi         |   5 -
 .../chromium-29.0.1518.2/i586/oe-defaults.gypi     |  15 --
 .../uninitialised-warning.patch                    |  90 ---------
 .../chromium/chromium-29.0.1518.2/unistd-2.patch   |  27 ---
 .../chromium-29.0.1518.2/x86-64/include.gypi       |   5 -
 .../chromium-29.0.1518.2/x86-64/oe-defaults.gypi   |  15 --
 recipes-browser/chromium/chromium_29.0.1518.2.bb   |  66 +-----
 13 files changed, 6 insertions(+), 493 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv6/i=
nclude.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv6/o=
e-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv7a/=
include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/armv7a/=
oe-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/google-=
chrome
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/google-=
chrome.desktop
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/i586/in=
clude.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/i586/oe=
-defaults.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/uniniti=
alised-warning.patch
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/unistd-=
2.patch
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/x86-64/=
include.gypi
 delete mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/x86-64/=
oe-defaults.gypi

diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.=
gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
deleted file mode 100644
index 2c88271..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
+++ /dev/null
@@ -1,8 +0,0 @@
-{
-  'variables': {
-    # Configure for armv6 compilation
-    'target_arch': 'arm',
-    'armv7': 0,
-    'arm_neon': 0,
-  }
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defau=
lts.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-default=
s.gypi
deleted file mode 100644
index 27e1cfe..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gyp=
i
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 1,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 0,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
-  },=20
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include=
.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
deleted file mode 100644
index 316cf48..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
+++ /dev/null
@@ -1,9 +0,0 @@
-{
-  'variables': {
-    # Configure for armv7 compilation
-    'target_arch': 'arm',
-    'armv7': 1,
-    'arm_thumb': 1,
-    'arm_neon': 1,
-  },=20
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defa=
ults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defau=
lts.gypi
deleted file mode 100644
index 27e1cfe..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gy=
pi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 1,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 0,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0
-  },=20
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome =
b/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
deleted file mode 100644
index 2d17772..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-if [ "${USER}" =3D "root" ] ; then=20
-	/usr/bin/chrome/chrome --user-data-dir=3D${HOME}/.chromium/ $@
-else
-	/usr/bin/chrome/chrome $@
-fi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.=
desktop b/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.des=
ktop
deleted file mode 100644
index 76a2533..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
+++ /dev/null
@@ -1,222 +0,0 @@
-[Desktop Entry]
-Version=3D1.0
-Name=3DChromium
-# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
-# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-2009041=
3.
-GenericName=3DWeb Browser
-GenericName[ar]=3D????? ??????
-GenericName[bg]=3D??? ???????
-GenericName[ca]=3DNavegador web
-GenericName[cs]=3DWWW prohl=C3=AD=C5=BEe?
-GenericName[da]=3DBrowser
-GenericName[de]=3DWeb-Browser
-GenericName[el]=3D?????????? ?????
-GenericName[en_GB]=3DWeb Browser
-GenericName[es]=3DNavegador web
-GenericName[et]=3DVeebibrauser
-GenericName[fi]=3DWWW-selain
-GenericName[fr]=3DNavigateur Web
-GenericName[gu]=3D??? ???????
-GenericName[he]=3D????? ???????
-GenericName[hi]=3D??? ????????
-GenericName[hu]=3DWebb=C3=B6ng=C3=A9sz?
-GenericName[it]=3DBrowser Web
-GenericName[ja]=3D???????
-GenericName[kn]=3D??? ??????
-GenericName[ko]=3D? ????
-GenericName[lt]=3D=C5=BDiniatinklio nar=C5=A1ykl?
-GenericName[lv]=3DT?mek?a p?rl?ks
-GenericName[ml]=3D???? ????????
-GenericName[mr]=3D??? ???????
-GenericName[nb]=3DNettleser
-GenericName[nl]=3DWebbrowser
-GenericName[pl]=3DPrzegl?darka WWW
-GenericName[pt]=3DNavegador Web
-GenericName[pt_BR]=3DNavegador da Internet
-GenericName[ro]=3DNavigator de Internet
-GenericName[ru]=3D???-???????
-GenericName[sl]=3DSpletni brskalnik
-GenericName[sv]=3DWebbl=C3=A4sare
-GenericName[ta]=3D???? ?????
-GenericName[th]=3D???????????????
-GenericName[tr]=3DWeb Taray?c?
-GenericName[uk]=3D????????? ?????
-GenericName[zh_CN]=3D?????
-GenericName[zh_HK]=3D?????
-GenericName[zh_TW]=3D?????
-# Not translated in KDE, from Epiphany 2.26.1-0ubuntu1.
-GenericName[bn]=3D???? ????????
-GenericName[fil]=3DWeb Browser
-GenericName[hr]=3DWeb preglednik
-GenericName[id]=3DBrowser Web
-GenericName[or]=3D????? ???????
-GenericName[sk]=3DWWW prehliada?
-GenericName[sr]=3D???????? ??????????
-GenericName[te]=3D????? ???????
-GenericName[vi]=3DB? duy?t Web
-# Gnome and KDE 3 uses Comment.
-Comment=3DAccess the Internet
-Comment[ar]=3D?????? ??? ????????
-Comment[bg]=3D?????? ?? ????????
-Comment[bn]=3D??????????? ????????? ????
-Comment[ca]=3DAccedeix a Internet
-Comment[cs]=3DP?=C3=ADstup k internetu
-Comment[da]=3DF=C3=A5 adgang til internettet
-Comment[de]=3DInternetzugriff
-Comment[el]=3D???????? ??? ?????????
-Comment[en_GB]=3DAccess the Internet
-Comment[es]=3DAccede a Internet.
-Comment[et]=3DP=C3=A4=C3=A4s Internetti
-Comment[fi]=3DK=C3=A4yt=C3=A4 interneti=C3=A4
-Comment[fil]=3DI-access ang Internet
-Comment[fr]=3DAcc=C3=A9der =C3=A0 Internet
-Comment[gu]=3D??????? ?????? ???
-Comment[he]=3D???? ?? ????????
-Comment[hi]=3D??????? ?? ????? ??????? ????
-Comment[hr]=3DPristup Internetu
-Comment[hu]=3DInternetel=C3=A9r=C3=A9s
-Comment[id]=3DAkses Internet
-Comment[it]=3DAccesso a Internet
-Comment[ja]=3D????????????
-Comment[kn]=3D????????? ????? ?????????
-Comment[ko]=3D??? ??
-Comment[lt]=3DInterneto prieiga
-Comment[lv]=3DPiek??t internetam
-Comment[ml]=3D?????????????? ??????? ???????
-Comment[mr]=3D???????????? ?????? ???
-Comment[nb]=3DG=C3=A5 til Internett
-Comment[nl]=3DVerbinding maken met internet
-Comment[or]=3D?????????? ?????? ??????
-Comment[pl]=3DSkorzystaj z internetu
-Comment[pt]=3DAceder =C3=A0 Internet
-Comment[pt_BR]=3DAcessar a internet
-Comment[ro]=3DAccesa?i Internetul
-Comment[ru]=3D?????? ? ????????
-Comment[sk]=3DPr=C3=ADstup do siete Internet
-Comment[sl]=3DDostop do interneta
-Comment[sr]=3D?????????? ?????????
-Comment[sv]=3DG=C3=A5 ut p=C3=A5 Internet
-Comment[ta]=3D???????? ????????
-Comment[te]=3D???????????? ??????? ????????
-Comment[th]=3D???????????????????
-Comment[tr]=3D?nternet'e eri?in
-Comment[uk]=3D?????? ?? ?????????
-Comment[vi]=3DTruy c?p Internet
-Comment[zh_CN]=3D?????
-Comment[zh_HK]=3D???????
-Comment[zh_TW]=3D???????
-Exec=3D/usr/bin/google-chrome %U
-Terminal=3Dfalse
-Icon=3D/usr/bin/chrome/product_logo_48.png
-Type=3DApplication
-Categories=3DNetwork;WebBrowser;
-MimeType=3Dtext/html;text/xml;application/xhtml_xml;x-scheme-handler/htt=
p;x-scheme-handler/https;x-scheme-handler/ftp;
-X-Ayatana-Desktop-Shortcuts=3DNewWindow;NewIncognito
-
-[NewWindow Shortcut Group]
-Name=3DNew Window
-Name[am]=3D??? ????
-Name[ar]=3D????? ?????
-Name[bg]=3D??? ????????
-Name[bn]=3D???? ??????
-Name[ca]=3DFinestra nova
-Name[cs]=3DNov=C3=A9 okno
-Name[da]=3DNyt vindue
-Name[de]=3DNeues Fenster
-Name[el]=3D??? ????????
-Name[en_GB]=3DNew Window
-Name[es]=3DNueva ventana
-Name[et]=3DUus aken
-Name[fa]=3D????? ????
-Name[fi]=3DUusi ikkuna
-Name[fil]=3DNew Window
-Name[fr]=3DNouvelle fen=C3=AAtre
-Name[gu]=3D??? ?????
-Name[hi]=3D?? ?????
-Name[hr]=3DNovi prozor
-Name[hu]=3D=C3=9Aj ablak
-Name[id]=3DJendela Baru
-Name[it]=3DNuova finestra
-Name[iw]=3D???? ???
-Name[ja]=3D???????
-Name[kn]=3D??? ?????
-Name[ko]=3D? ?
-Name[lt]=3DNaujas langas
-Name[lv]=3DJauns logs
-Name[ml]=3D????? ???????
-Name[mr]=3D???? ?????
-Name[nl]=3DNieuw venster
-Name[no]=3DNytt vindu
-Name[pl]=3DNowe okno
-Name[pt]=3DNova janela
-Name[pt_BR]=3DNova janela
-Name[ro]=3DFereastr? nou?
-Name[ru]=3D????? ????
-Name[sk]=3DNov=C3=A9 okno
-Name[sl]=3DNovo okno
-Name[sr]=3D???? ??????
-Name[sv]=3DNytt f=C3=B6nster
-Name[sw]=3DDirisha Jipya
-Name[ta]=3D????? ??????
-Name[te]=3D??????? ?????
-Name[th]=3D????????????
-Name[tr]=3DYeni Pencere
-Name[uk]=3D???? ?????
-Name[vi]=3DC?a s? M?i
-Name[zh_CN]=3D????
-Name[zh_TW]=3D????
-Exec=3D/usr/bin/google-chrome
-TargetEnvironment=3DUnity
-
-[NewIncognito Shortcut Group]
-Name=3DNew Incognito Window
-Name[ar]=3D????? ????? ?????? ???????
-Name[bg]=3D??? ???????? =E2=80=9E?????????=E2=80=9C
-Name[bn]=3D???? ???????? ??????
-Name[ca]=3DFinestra d'inc=C3=B2gnit nova
-Name[cs]=3DNov=C3=A9 anonymn=C3=AD okno
-Name[da]=3DNyt inkognitovindue
-Name[de]=3DNeues Inkognito-Fenster
-Name[el]=3D??? ???????? ??? ??????? ?????????
-Name[en_GB]=3DNew Incognito window
-Name[es]=3DNueva ventana de inc=C3=B3gnito
-Name[et]=3DUus inkognito aken
-Name[fa]=3D????? ???? ???? ??????
-Name[fi]=3DUusi incognito-ikkuna
-Name[fil]=3DBagong Incognito window
-Name[fr]=3DNouvelle fen=C3=AAtre de navigation priv=C3=A9e
-Name[gu]=3D??? ???? ?????
-Name[hi]=3D?? ????? ?????
-Name[hr]=3DNovi anoniman prozor
-Name[hu]=3D=C3=9Aj Inkognit=C3=B3ablak
-Name[id]=3DJendela Penyamaran baru
-Name[it]=3DNuova finestra di navigazione in incognito
-Name[iw]=3D???? ??? ?????? ????
-Name[ja]=3D????????? ?????
-Name[kn]=3D??? ?????? ?????
-Name[ko]=3D? ??? ?
-Name[lt]=3DNaujas inkognito langas
-Name[lv]=3DJauns inkognito re=C5=BE?ma logs
-Name[ml]=3D????? ??? ????????? ???????
-Name[mr]=3D???? ????? ?????
-Name[nl]=3DNieuw incognitovenster
-Name[no]=3DNytt inkognitovindu
-Name[pl]=3DNowe okno incognito
-Name[pt]=3DNova janela de navega=C3=A7=C3=A3o an=C3=B3nima
-Name[pt_BR]=3DNova janela an=C3=B4nima
-Name[ro]=3DFereastr? nou? incognito
-Name[ru]=3D????? ???? ? ?????? ?????????
-Name[sk]=3DNov=C3=A9 okno inkognito
-Name[sl]=3DNovo okno brez bele=C5=BEenja zgodovine
-Name[sr]=3D???? ?????? ?? ?????????? ??? ??????????
-Name[sv]=3DNytt inkognitof=C3=B6nster
-Name[ta]=3D????? ????????? ??????
-Name[te]=3D??????? ?????? ?????
-Name[th]=3D???????????????????????????
-Name[tr]=3DYeni Gizli pencere
-Name[uk]=3D???? ????? ? ?????? ?????????? ?????????
-Name[vi]=3DC?a s? ?n danh m?i
-Name[zh_CN]=3D??????
-Name[zh_TW]=3D???????
-Exec=3D/usr/bin/google-chrome --incognito
-TargetEnvironment=3DUnity
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.g=
ypi b/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
deleted file mode 100644
index 69f3a08..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
+++ /dev/null
@@ -1,5 +0,0 @@
-{
-  'variables': {
-    'target_arch': 'ia32',
-  }
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaul=
ts.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.=
gypi
deleted file mode 100644
index 0a6e8e8..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 0,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 1,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0,
-  },=20
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-=
warning.patch b/recipes-browser/chromium/chromium-29.0.1518.2/uninitialis=
ed-warning.patch
deleted file mode 100644
index fac12bb..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning=
.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-Make gcc 4.8 happy. It complains about uninitialized symbols
-
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual ui=
nt64 webkit_glue::WebClipboardImpl::sequenceNumber(WebKit::WebClipboard::=
Buffer)':
-| ../../webkit/glue/webclipboard_impl.cc:80:48: error: 'buffer_type' may=
 be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
-|    return client_->GetSequenceNumber(buffer_type);
-|                                                 ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual We=
bKit::WebVector<WebKit::WebString> webkit_glue::WebClipboardImpl::readAva=
ilableTypes(WebKit::WebClipboard::Buffer, bool*)':
-| ../../webkit/glue/webclipboard_impl.cc:118:73: error: 'buffer_type' ma=
y be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
-|      client_->ReadAvailableTypes(buffer_type, &types, contains_filenam=
es);
-|                                                                       =
   ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual We=
bKit::WebData webkit_glue::WebClipboardImpl::readImage(WebKit::WebClipboa=
rd::Buffer)':
-| ../../webkit/glue/webclipboard_impl.cc:169:45: error: 'buffer_type' ma=
y be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
-|    client_->ReadImage(buffer_type, &png_data);
-|                                              ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual We=
bKit::WebString webkit_glue::WebClipboardImpl::readCustomData(WebKit::Web=
Clipboard::Buffer, const WebKit::WebString&)':
-| ../../webkit/glue/webclipboard_impl.cc:180:52: error: 'buffer_type' ma=
y be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
-|    client_->ReadCustomData(buffer_type, type, &data);
-|                                                     ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual We=
bKit::WebString webkit_glue::WebClipboardImpl::readHTML(WebKit::WebClipbo=
ard::Buffer, WebKit::WebURL*, unsigned int*, unsigned int*)':
-| ../../webkit/glue/webclipboard_impl.cc:158:56: error: 'buffer_type' ma=
y be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
-|                      static_cast<uint32*>(fragment_end));
-|                                                         ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual We=
bKit::WebString webkit_glue::WebClipboardImpl::readPlainText(WebKit::WebC=
lipboard::Buffer)':
-| ../../webkit/glue/webclipboard_impl.cc:136:3: error: 'buffer_type' may=
 be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
-|    if (client_->IsFormatAvailable(ui::Clipboard::GetPlainTextFormatTyp=
e(),
-|    ^
-| cc1plus: all warnings being treated as errors
-
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Unknown
-Index: chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- chromium-29.0.1518.2.orig/webkit/glue/webclipboard_impl.cc
-+++ chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
-@@ -73,7 +73,7 @@ uint64 WebClipboardImpl::getSequenceNumb
- }
-=20
- uint64 WebClipboardImpl::sequenceNumber(Buffer buffer) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type =3D ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return 0;
-=20
-@@ -112,7 +112,7 @@ bool WebClipboardImpl::isFormatAvailable
-=20
- WebVector<WebString> WebClipboardImpl::readAvailableTypes(
-     Buffer buffer, bool* contains_filenames) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type =3D ui::Clipboard::BUFFER_STANDARD;
-   std::vector<base::string16> types;
-   if (ConvertBufferType(buffer, &buffer_type)) {
-     client_->ReadAvailableTypes(buffer_type, &types, contains_filenames=
);
-@@ -121,7 +121,7 @@ WebVector<WebString> WebClipboardImpl::r
- }
-=20
- WebString WebClipboardImpl::readPlainText(Buffer buffer) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type =3D ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebString();
-=20
-@@ -147,7 +147,7 @@ WebString WebClipboardImpl::readPlainTex
- WebString WebClipboardImpl::readHTML(Buffer buffer, WebURL* source_url,
-                                      unsigned* fragment_start,
-                                      unsigned* fragment_end) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type =3D ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebString();
-=20
-@@ -161,7 +161,7 @@ WebString WebClipboardImpl::readHTML(Buf
- }
-=20
- WebData WebClipboardImpl::readImage(Buffer buffer) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type =3D ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebData();
-=20
-@@ -172,7 +172,7 @@ WebData WebClipboardImpl::readImage(Buff
-=20
- WebString WebClipboardImpl::readCustomData(Buffer buffer,
-                                            const WebString& type) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type =3D ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebString();
-=20
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch=
 b/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
deleted file mode 100644
index 6b5018b..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff --git a/chrome/browser/memory_details_linux.cc b/chrome/browser/mem=
ory_details_linux.cc
-index bee24ce..299f237 100644
---- a/chrome/browser/memory_details_linux.cc
-+++ b/chrome/browser/memory_details_linux.cc
-@@ -7,6 +7,10 @@
- #include <map>
- #include <set>
-=20
-+#if defined(OS_POSIX)
-+#include <unistd.h>
-+#endif
-+
- #include "base/bind.h"
- #include "base/process_util.h"
- #include "base/string_util.h"
-diff --git a/ipc/ipc_channel.h b/ipc/ipc_channel.h
-index 14c375b..345f9eb 100644
---- a/ipc/ipc_channel.h
-+++ b/ipc/ipc_channel.h
-@@ -10,6 +10,7 @@
-=20
- #if defined(OS_POSIX)
- #include <sys/types.h>
-+#include <unistd.h>
- #endif
-=20
- #include "base/compiler_specific.h"
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include=
.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
deleted file mode 100644
index c2e2a7d..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
+++ /dev/null
@@ -1,5 +0,0 @@
-{
-  'variables': {
-    'target_arch': 'x64',
-  }
-}
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defa=
ults.gypi b/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defau=
lts.gypi
deleted file mode 100644
index 0a6e8e8..0000000
--- a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gy=
pi
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  'variables': {
-    'use_system_bzip2': 1,
-    'disable_nacl': 1,
-    'proprietary_codecs': 0,
-    'v8_use_snapshot': 1,
-    'use_system_ffmpeg': 0,
-    'linux_use_tcmalloc': 1,
-    'linux_link_kerberos': 0,
-    'use_kerberos': 0,
-    'use_cups': 0,
-    'use_gnome_keyring': 0,
-    'linux_link_gnome_keyring': 0,
-  },=20
-}
diff --git a/recipes-browser/chromium/chromium_29.0.1518.2.bb b/recipes-b=
rowser/chromium/chromium_29.0.1518.2.bb
index c8e8aa9..185b679 100644
--- a/recipes-browser/chromium/chromium_29.0.1518.2.bb
+++ b/recipes-browser/chromium/chromium_29.0.1518.2.bb
@@ -1,72 +1,18 @@
 DESCRIPTION =3D "Chromium browser"
+
+include chromium.inc
+
+
 LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2d164565cc10f298390174d9cb6d=
18d"
-DEPENDS =3D "xz-native pciutils pulseaudio xextproto cairo nss gtk+ zlib=
-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
-SRC_URI =3D "\
-        http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz=
 \
-        file://include.gypi \
-        file://oe-defaults.gypi \
+
+SRC_URI +=3D "\       =20
         file://unistd-2.patch \
-        file://google-chrome \
-        file://google-chrome.desktop \
         file://uninitialised-warning.patch \
 "
 SRC_URI[md5sum] =3D "2480c3fd109ef000575629acb8a906ca"
 SRC_URI[sha256sum] =3D "7f08624f7d9bd120de0043da7ee09985ae6b6990d22d8c1b=
1f7c66fd4ed681a1"
=20
-# include.gypi exists only for armv6 and armv7a and there isn't somethin=
g like COMPATIBLE_ARCH afaik
-COMPATIBLE_MACHINE =3D "(-)"
-COMPATIBLE_MACHINE_i586 =3D "(.*)"
-COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
-COMPATIBLE_MACHINE_armv6 =3D "(.*)"
-COMPATIBLE_MACHINE_armv7a =3D "(.*)"
-
-inherit gettext
-
-EXTRA_OEGYP =3D	" \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold=
_binary=3D0', d)} \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold=
_flags=3D0', d)} \
-	-I ${WORKDIR}/oe-defaults.gypi \
-	-I ${WORKDIR}/include.gypi \
-	-f ninja \
-"
 ARMFPABI_armv7a =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconventi=
on-hard', 'arm_float_abi=3Dhard', 'arm_float_abi=3Dsoftfp', d)}"
=20
 export GYP_DEFINES=3D"${ARMFPABI} release_extra_cflags=3D'-Wno-error=3Du=
nused-local-typedefs' sysroot=3D''"
-do_configure() {
-	cd ${S}
-	# replace LD with CXX, to workaround a possible gyp issue?
-	LD=3D"${CXX}" export LD
-	CC=3D"${CC}" export CC
-	CXX=3D"${CXX}" export CXX
-	CC_host=3D"gcc" export CC_host
-	CXX_host=3D"g++" export CXX_host
-	build/gyp_chromium --depth=3D. ${EXTRA_OEGYP}
-}
-
-do_compile() {
-	# build with ninja
-	ninja -C ${S}/out/Release chrome=20
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
-
-	install -d ${D}${datadir}/applications
-	install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applica=
tions/
-
-	install -d ${D}${bindir}/chrome/
-	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
-	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/c=
hrome/
-	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chro=
me/
-	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
-
-	install -d ${D}${bindir}/chrome/locales/
-	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome=
/locales
-}
-
-FILES_${PN} =3D "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/ap=
plications"
-FILES_${PN}-dbg =3D "${bindir}/chrome/.debug/"
--=20
1.8.1.2



