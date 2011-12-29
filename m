Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rg3dP-0007ow-13
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Dec 2011 01:14:15 +0100
Received: by yhoo47 with SMTP id o47so7474193yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=k8dBA3D2dKs7nmSE1s/l5sRpBNiQtR2ALARqjV/sbw0=;
	b=SOBNQg7FuNs1e9dShw7WiKKwHiW+AqvH6HobSmRKHsAT9yAMewCpJ6ez7dtFjQ1Scc
	SCKZQwg+y1NxigdWJ1RqLD1ZzvMbhG0mGHrV+iqAubpy/GGy5AN0pdLulLMFOmVP0tSL
	jIeB5qU8YuP23W3fxa8cu3n8EvJl/8ymebTvQ=
Received: by 10.236.154.5 with SMTP id g5mr14610438yhk.63.1325117216442;
	Wed, 28 Dec 2011 16:06:56 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id 32sm79367685ant.12.2011.12.28.16.06.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 16:06:55 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2011 18:06:56 -0600
Message-Id: <1325117216-7835-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH][meta-oe] cramfs: fix license, as it's an "or later" case
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
X-List-Received-Date: Thu, 29 Dec 2011 00:14:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-support/cramfs/cramfs_cvs.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
index 667097c..d9b2df4 100644
--- a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
+++ b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Builds cramfs filesystems for embedded systems"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/linux/COPYING;md5=9579385572eb40eded61dcb07e0038a4"
 DEPENDS = "zlib"
 SRCDATE = "20110110"
-- 
1.7.8.rc4



