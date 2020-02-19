Return-Path: <dl9pf@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id C9A97615CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1582113471;
	bh=ou2Ek5vIfpFUsR0zgUmEe61OtFilYEXSk8TmmXnkq6E=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=dauEaO0K8iJGs9BZMTwkRTRPny+ZgkItK1JDzYaTLZxPtE0n0pTipbHXoKHe2qrdT
	FpsETb3ETykOVuFLk06eS//d9IK9IfmcDbZWJZ2phOs8qfGBYeNQqypI5Cq6Fz8uJf
	F8Y/I31TjiJtj22qY5g4iIgU8KwUDF5A3eUZ2YwA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([95.216.96.43]) by mail.gmx.com
	(mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
	1MTRR0-1isKln0sdY-00TmgD; Wed, 19 Feb 2020 12:57:51 +0100
From: Jan-Simon Moeller <dl9pf@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2020 12:57:40 +0100
Message-Id: <20200219115740.25272-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:4rW8DL55pZtuXqgboYJ1L7z5zrQjlgDU1j9oQUXH8mDy/to/bOc
	uJXX4xA8S0CYTp3/hXWhB1zM+OQUZI4MrcCHqWpypWeLPA1EYLB8FOfz4jg3zNndPZ4HJxf
	CQOB1J8HnsE0k9PUfXx6mOYTUM2xEQA1ON8/c67NxniIzt5dVFSriF+aKvOaoZDyFXjvimy
	0bBbR16aFkpHdjgVmuwBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eAwSxhBW/4o=:9aUPhYNxC6Zc4Pz0Sol27P
	Xvx497CTo7QOnWOQVUkIpSkNgtYd/zQp3mveV1T2/WpFZ/PBVrjYbxFL0ZVdpjToXubL2WCvF
	gctUWtQ8woC62UxZv7FjyFeY6ohnoP/JsbjgTX9uuI4VcYWnLjyT0aeEmkdEfV7uuMni/S1E2
	UDp/A2kdPdhx32gdOmTRhvazNbF4TB/pKdVEZYFDHGVX1e4az+aP4vzWqjcWoL+3ESdQtQy+R
	aqT8XaQGpwsZOUYdX++70CXmfPcYsRxP9QSNT7cP8OArPxF6TpHJ8HaKTSar2vQfijZqiggSh
	MpuliezcKZVb3P0OT/hkj8a8N3z743iyyJm8KVwVFyoG8FfGv00T6EGu6FQAX9r3xiZLa6QDp
	5F28YUjNwWFTffvhKluF9lKSd3F3vmNQxF6uxB8piL3rJoU+/DGhzjrrs3ANz2kdm2HYafkYF
	ZFWHlfE5Q6jhur5z9kiUvqvwFjjWxoZzjUTSjFUtkOU0gwZcV1N2Pte3dHkoheY2eFzN0k2dq
	bvInnE2Kx1VDFT+s1wd8Geu1R2ZXDFCnQu9SCa7fOdcntox5KrlWJOhhDuLh0xR0xRyWnOHLN
	663NsBxwwTOyHKcWdk+RGVaRuq5dcNbnJq72bgy5qAsq4uTuJDhR9cH3SsBoJouMXHQ9iPhyG
	AK6s7YVDeG/QrS3oF2hGLhBmXEhGs/2niz0UKFd6YZ+iQMtzCTc6I7uXCo6GABvi4K8Qhk1R+
	lwhW4LjR9FGpmZmcc8/oMCRgMY1fyTTT+izp26Prqe/wruXsRX5LKLgwnV4zpXJ9ioj/IzKUk
	orCaRUgPxMYUqjdcApWnhO/E4eHryPnFe1uI8l9LnRuyBwcXhzqltwIRIiA54y2/yCZmlbdRk
	jVf/ue7nIq6LfrS38X1kuoE3gR0xaZ+s2Q0PihyhjzmrwG3MtjyDXHqxaxY6p1OBXmInmHY9y
	ShRvf1r77GqVwrWDKsyNR5eHWrEyt6ncUPeewwWKtFzbuP8xCE0qMJ/oVYIJ8v87ge+wk9d8P
	WqXZ/ssN5qprt2QQqaKWHjWLEnvFj/FZ2FC8xZdPDspozrn9HxupUiUquidTCXhAmKFgpOGfK
	v4KoLLKeB7WFJTmn1s8AbBsCuSlChtbP+48MwmFvRZMC5/mqCHUtViLi0MzU/FEo5NTq7tQZ+
	5+qmw3B1DffLvGocW5bUpTWouk8lp74x0gs0FZmdWKDH6T4EbO4AwTeFfUF2TuhTsdyTE=
Subject: [meta-oe][zeus][PATCH] meta-oe: zeus: remmina - use PACKAGECONFIG for spice
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
X-List-Received-Date: Wed, 19 Feb 2020 11:57:51 -0000
Content-Transfer-Encoding: quoted-printable

remmina depends on spice and spice-protocol but they are in meta-networkin=
g.
Use the PACKAGECONFIG flag to avoid hardcoding the dependency.

Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
=2D--
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/re=
cipes-support/remmina/remmina_1.3.6.bb
index 82b803a4d..5f25231c2 100644
=2D-- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -5,8 +5,6 @@ LICENSE =3D "GPLv2 & openssl"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddab7215512044d49037272ce1ac4ea=
8f file://LICENSE.OpenSSL;md5=3Dc1eb3cee0a4dea27503c531267a69769"
 DEPENDS +=3D "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui lib=
sodium libssh vte json-glib libsoup-2.4 libvncserver libsecret"

-DEPENDS_append_x86 =3D " spice spice-protocol"
-DEPENDS_append_x86-64 =3D " spice spice-protocol"

 DEPENDS_append_libc-musl =3D " libexecinfo"
 LDFLAGS_append_libc-musl =3D " -lexecinfo"
@@ -23,11 +21,7 @@ inherit cmake distro_features_check
 # depends on avahi-ui with this restriction
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"

-EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWITH=
_TRANSLATIONS=3DOFF -DWITH_SPICE=3DOFF"
-
-EXTRA_OECMAKE_append_x86 =3D " -DWITH_SPICE=3DON"
-EXTRA_OECMAKE_append_x86-64 =3D " -DWITH_SPICE=3DON"
-
+EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWITH=
_TRANSLATIONS=3DOFF"

 do_install_append(){
     # We dont need the extra stuff form other desktop environments
@@ -36,6 +30,8 @@ do_install_append(){
     rm -rf ${D}/${datadir}/gnome-session
 }

+PACKAGECONFIG[spice] =3D "-DWITH_SPICE=3DON, -DWITH_SPICE=3DOFF, spice sp=
ice-protocol"
+
 RDEPENDS_${PN} =3D "bash"

 FILES_${PN}_append =3D " ${datadir}/icons/hicolor/*"
=2D-
2.11.0


