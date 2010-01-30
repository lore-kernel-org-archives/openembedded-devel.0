Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NbECz-0007YE-QO
	for openembedded-devel@openembedded.org; Sat, 30 Jan 2010 15:22:00 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 6ECD61D36078;
	Sat, 30 Jan 2010 15:19:31 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jan 2010 15:19:34 +0100
Message-Id: <1264861174-31574-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] sane-srcrevs: bump EFL_SRCREV a bit to get few fixes
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
X-List-Received-Date: Sat, 30 Jan 2010 14:22:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

For details pls visit http://trac.enlightenment.org/e/timeline

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/distro/include/sane-srcrevs.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/s=
ane-srcrevs.inc
index 939b94c..804879d 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -335,7 +335,7 @@ SRCREV_pn-xserver-kdrive-glamo ?=3D "9b28d998424c77fb=
c057dd3a022ccbb122793a52"
 # Enlightenment Foundation Libraries
 # Caution: This is not alphabetically, but (roughly) dependency-sorted.
 # Please leave it like that.
-EFL_SRCREV ?=3D "45659"
+EFL_SRCREV ?=3D "45731"
 SRCREV_pn-edb-native ?=3D "${EFL_SRCREV}"
 SRCREV_pn-edb ?=3D "${EFL_SRCREV}"
 SRCREV_pn-eina-native ?=3D "${EFL_SRCREV}"
--=20
1.6.0.4



