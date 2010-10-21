Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHj-0007Yy-EI
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:26 +0200
Received: by gwb17 with SMTP id 17so75164gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qXcob/bnc9IGQbfYSFDvw2WodC+NOkYmou9x9zQtQ8s=;
	b=SUQer741dkOjQt8X4AmLOXpLqa+6nKu3OCVpKlbEUA9IU2OubQ9B7oYeCiyyNiZws0
	uuPEUzq3co0OX+xF5LNpdqg7PBJxs1TqUvxIUWCNcLenHmmD4G8HDMuPYogTOs5lIlWT
	atwWg3nFdq+XOje9Q9VyPHbS24E2wdiji0U2w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UsT5O+mvGGZQbWCl2779s53ysmi3wD6CRUhDNRRNLyrUlZBjl6hVQRLrbNLEn3cDIa
	PPEKMeuLZN/0qABZUFiwMR5ZceOHZWwOhnIxD/t2VoFCMFLiiKXoGFpKnTGmvNDbYuN7
	RSwb/LYoubC+dq0Ui+LdPdC9oE8Qxo69qYhwY=
Received: by 10.150.63.7 with SMTP id l7mr3743292yba.160.1287668020589;
	Thu, 21 Oct 2010 06:33:40 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:40 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:12 -0500
Message-Id: <1287668010-11310-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 04/22] desktop-file-utils: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:34:31 -0000
X-List-Received-Date: Thu, 21 Oct 2010 13:34:31 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../desktop-file-utils-native_0.14.bb              |    2 +-
 .../desktop-file-utils/desktop-file-utils_0.15.bb  |    2 +-
 .../desktop-file-utils/desktop-file-utils_0.16.bb  |    2 +-
 .../desktop-file-utils/desktop-file-utils_0.3.bb   |    2 +-
 .../desktop-file-utils/desktop-file-utils_0.6.bb   |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb b/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
index fa7a633..1da30b1 100644
--- a/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
+++ b/recipes/desktop-file-utils/desktop-file-utils-native_0.14.bb
@@ -1,7 +1,7 @@
 SECTION = "console/utils"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
 DESCRIPTION = "command line utilities to work with *.desktop files"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 
 DEPENDS = "glib-2.0-native"
 
diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.15.bb b/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
index 89919b8..6c1e9f7 100644
--- a/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
+++ b/recipes/desktop-file-utils/desktop-file-utils_0.15.bb
@@ -1,7 +1,7 @@
 SECTION = "console/utils"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
 DESCRIPTION = "command line utilities to work with *.desktop files"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 
 DEPENDS = "glib-2.0"
 
diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.16.bb b/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
index 0d2ab9a..9a2ffc3 100644
--- a/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
+++ b/recipes/desktop-file-utils/desktop-file-utils_0.16.bb
@@ -1,7 +1,7 @@
 SECTION = "console/utils"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
 DESCRIPTION = "command line utilities to work with *.desktop files"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 
 DEPENDS = "glib-2.0"
 
diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.3.bb b/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
index 4bd0295..48ac169 100644
--- a/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
+++ b/recipes/desktop-file-utils/desktop-file-utils_0.3.bb
@@ -1,7 +1,7 @@
 SECTION = "console/utils"
 HOMEPAGE = "http://www.freedesktop.org/Software/desktop-file-utils"
 DESCRIPTION = "command line utilities to work with *.desktop files"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 DEPENDS = "popt glib-2.0"
 
 SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.gz \
diff --git a/recipes/desktop-file-utils/desktop-file-utils_0.6.bb b/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
index 2a1eaf2..0e5c8e8 100644
--- a/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
+++ b/recipes/desktop-file-utils/desktop-file-utils_0.6.bb
@@ -1,7 +1,7 @@
 SECTION = "console/utils"
 HOMEPAGE = "http://www.freedesktop.org/Software/desktop-file-utils"
 DESCRIPTION = "command line utilities to work with *.desktop files"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 DEPENDS = "popt glib-2.0 gnome-vfs"
 
 SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.gz"
-- 
1.7.0.4



