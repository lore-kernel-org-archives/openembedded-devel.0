Received: from 10.97.mail-out.ovh.net ([178.33.249.221]
	helo=97.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QXfy6-0003YH-04
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jun 2011 22:48:42 +0200
Received: from mail611.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by 97.mail-out.ovh.net (Postfix) with SMTP id 831014A63D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2011 21:29:09 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Jun 2011 21:27:55 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 17 Jun 2011 21:27:54 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2011 21:27:49 +0200
Message-Id: <1308338871-31968-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1308338871-31968-1-git-send-email-eric@eukrea.com>
References: <1308338871-31968-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12302145333879156042
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -160
X-VR-SPAMCAUSE: Vade Retro 01.322.06 AV+AS Profile: OVH; Bailout: 300;
	@!Recipients (-100); automake|autoconf3x (-60)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/4] angstrom-2010: prefer busybox 1.18.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2011 20:48:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
---
 .../include/angstrom-2010-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/c=
onf/distro/include/angstrom-2010-preferred-versions.inc
index 7a59df9..8ce3ee7 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -13,7 +13,7 @@ PREFERRED_VERSION_autoconf-native =3D "2.65"
 PREFERRED_VERSION_automake =3D "1.11.1"
 PREFERRED_VERSION_automake-native =3D "1.11.1"
 PREFERRED_VERSION_avahi		=3D "0.6.30"
-PREFERRED_VERSION_busybox 	=3D "1.18.4"
+PREFERRED_VERSION_busybox 	=3D "1.18.5"
 PREFERRED_VERSION_cairo		=3D "1.10.0"
 PREFERRED_VERSION_dbus 		=3D "1.4.1"
 PREFERRED_VERSION_dropbear      =3D "0.52"
--=20
1.7.0.4



