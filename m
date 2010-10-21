Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vI2-0007Zh-HE
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:35:04 +0200
Received: by mail-gy0-f175.google.com with SMTP id 5so802562gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=yxTgOrdMRER43ZIFXBrCdWjKGp7yMYqoWphTmKKm4z8=;
	b=ouLPoLYPnFOUCF9LFNRkEpTE66LJ6QW6vhK9kghHDfPi8ItIkafSdIVArMLi/FdZ4b
	6In4WkYjC2HYWA5DL8dnf4wxIedscOBfw67USWOTPJ5NxJRVHFin8llXNHXAa1U68/T2
	zPrEm0z3G1P5ln40cjGIlapY0u7YrTb1W+gf0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=avfW/AwgTX+QvvrJ+sqCDKBCC9K8Y2cCMuk/piubFX22vlXiLnx7BUI3v80LRVaU+2
	c1qxZnnqLqGL+bdagQwHrKrIqdf1rabe4lRvzjwxXd97UCdFgs2/4uozSMBwDehnguzi
	Ptp9aEJy1lAHMfMSMYmKJr1EB2tEzOF2as5Zk=
Received: by 10.150.131.3 with SMTP id e3mr3624292ybd.343.1287668046532;
	Thu, 21 Oct 2010 06:34:06 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.34.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:34:05 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:30 -0500
Message-Id: <1287668010-11310-23-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 22/22] xorg-headers-native: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:10 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/xorg-lib/xorg-headers-native.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/xorg-lib/xorg-headers-native.bb b/recipes/xorg-lib/xorg-headers-native.bb
index e303c18..ce90fc0 100644
--- a/recipes/xorg-lib/xorg-headers-native.bb
+++ b/recipes/xorg-lib/xorg-headers-native.bb
@@ -1,3 +1,5 @@
+LICENSE = "MIT"
+
 PR = "r2"
 
 SRC_URI = "file://X11"
-- 
1.7.0.4



