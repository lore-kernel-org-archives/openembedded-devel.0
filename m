Received: from mail2.matrix-vision.com ([85.214.244.251])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.jones@matrix-vision.de>) id 1Q78A9-0000sw-KA
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:27:26 +0200
Received: from mail2.matrix-vision.com (localhost [127.0.0.1])
	by mail2.matrix-vision.com (Postfix) with ESMTP id 8466740582
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2011 17:25:19 +0200 (CEST)
Received: from erinome (g2.matrix-vision.com [80.152.136.245])
	by mail2.matrix-vision.com (Postfix) with ESMTPA id 563503F619
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2011 17:25:19 +0200 (CEST)
Received: from erinome (localhost [127.0.0.1])
	by erinome (Postfix) with ESMTP id E7E136F8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2011 17:25:18 +0200 (CEST)
Received: by erinome (Postfix, from userid 108)
	id D926C6F9C; Tue,  5 Apr 2011 17:25:18 +0200 (CEST)
Received: from ap437-joe.intern.matrix-vision.de
	(host65-46.intern.matrix-vision.de [192.168.65.46])
	by erinome (Postfix) with ESMTPA id C64426F8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2011 17:25:18 +0200 (CEST)
From: Michael Jones <michael.jones@matrix-vision.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 17:24:41 +0200
Message-Id: <1302017081-18698-1-git-send-email-michael.jones@matrix-vision.de>
X-Mailer: git-send-email 1.7.4.3
MIME-Version: 1.0
X-MV-Disclaimer: true (erinome)
X-AV-Checked: ClamAV using ClamSMTP (erinome)
X-AV-Checked: ClamAV using ClamSMTP (mail2)
Subject: =?UTF-8?B?W1BBVENIXSBiYXNlLWZpbGVzOiB3cml0ZSBBbmdzdHJvbSBhcyDDhW5nc3Ryw7ZtIGluIHRoZSBpc3N1ZSBmaWxlLg==?=
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
X-List-Received-Date: Tue, 05 Apr 2011 15:27:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

spice up the ASCII art a bit

Signed-off-by: Michael Jones <michael.jones@matrix-vision.de>
---

This seems overdue.  It's undergone intense testing, I don't
think it will introduce any regressions.

 recipes/base-files/base-files/angstrom/issue     |    4 ++--
 recipes/base-files/base-files/angstrom/issue.net |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/base-files/base-files/angstrom/issue b/recipes/base-=
files/base-files/angstrom/issue
index 302ba10..d316a04 100644
--- a/recipes/base-files/base-files/angstrom/issue
+++ b/recipes/base-files/base-files/angstrom/issue
@@ -1,5 +1,5 @@
-.-------.                                          =20
-|       |                  .-.                     =20
+.---O---.                                          =20
+|       |                  .-.           o o       =20
 |   |   |-----.-----.-----.| |   .----..-----.-----.
 |       |     | __  |  ---'| '--.|  .-'|     |     |
 |   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
diff --git a/recipes/base-files/base-files/angstrom/issue.net b/recipes/b=
ase-files/base-files/angstrom/issue.net
index 182fc83..2c4d9bb 100644
--- a/recipes/base-files/base-files/angstrom/issue.net
+++ b/recipes/base-files/base-files/angstrom/issue.net
@@ -1,5 +1,5 @@
-.-------.                                          =20
-|       |                  .-.                     =20
+.---O---.                                          =20
+|       |                  .-.           o o       =20
 |   |   |-----.-----.-----.| |   .----..-----.-----.
 |       |     | __  |  ---'| '--.|  .-'|     |     |
 |   |   |  |  |     |---  ||  --'|  |  |  '  | | | |
--=20
1.7.4.3


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner


