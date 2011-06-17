Received: from 17.97.mail-out.ovh.net ([91.121.50.93] helo=97.mail-out.ovh.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QXf25-0002Dc-G7
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jun 2011 21:48:47 +0200
Received: from mail611.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by 97.mail-out.ovh.net (Postfix) with SMTP id 832E84A64C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2011 21:29:09 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Jun 2011 21:27:55 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 17 Jun 2011 21:27:54 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2011 21:27:50 +0200
Message-Id: <1308338871-31968-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1308338871-31968-1-git-send-email-eric@eukrea.com>
References: <1308338871-31968-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12302145333879156043
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -160
X-VR-SPAMCAUSE: Vade Retro 01.322.06 AV+AS Profile: OVH; Bailout: 300;
	@!Recipients (-100); automake|autoconf3x (-60)
Subject: [PATCH 3/4] slugos: prefer busybox 1.18.5
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
X-List-Received-Date: Fri, 17 Jun 2011 19:48:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Cc: Mike Westerhof <mike@mwester.net>
---
 conf/distro/include/preferred-slugos-versions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/dis=
tro/include/preferred-slugos-versions.inc
index b864dac..2121edb 100644
--- a/conf/distro/include/preferred-slugos-versions.inc
+++ b/conf/distro/include/preferred-slugos-versions.inc
@@ -24,7 +24,7 @@ PREFERRED_VERSION_autoconf			?=3D "2.65"
 PREFERRED_VERSION_autoconf-native		?=3D "2.65"
 PREFERRED_VERSION_automake			?=3D "1.11.1"
 PREFERRED_VERSION_automake-native		?=3D "1.11.1"
-PREFERRED_VERSION_busybox			?=3D "1.18.4"
+PREFERRED_VERSION_busybox			?=3D "1.18.5"
 PREFERRED_VERSION_dbus				?=3D "1.4.1"
 PREFERRED_VERSION_glib-2.0			?=3D "2.26.1"
 PREFERRED_VERSION_glib-2.0-native		?=3D "2.26.1"
--=20
1.7.0.4



