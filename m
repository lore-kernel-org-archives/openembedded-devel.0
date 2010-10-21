Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHt-0007X8-Os
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:35:07 +0200
Received: by mail-gy0-f175.google.com with SMTP id 5so802555gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=87e0bJs/MPP+dZptqzDapgIBtH9RN3D+HCYURWXnC98=;
	b=HRmeS6RNaLKTQWCClvFce+Y4PwGoJ7MEtEbRMwl5zAyIznSNReEbqDldnwSUdk6TLw
	ukg35LpEKgTpDHVvZtWtZ3weNc8gMRkLFH7q/+c53L6riGuAVJo32Vg0NWXhW3vNf4MP
	rbKPlx3f9HHy7R5ZyCzWaE20R/nrT40s5uGo0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=edf064EZpfkmGfqNjrlE1HRf3rhiovLN3c2/uUI3pef1uSyW4uXqXPZ+2+fQ/ngef5
	deWhJbm3e6/NnVc4QOEZI7PlPihvmjKHy88b7bmkzRJgI4WDV1gYjCCkn3JzvnBItElx
	SKOC19oLrgRc6CBM4n0OVvKx3aW9a0VcMO8OY=
Received: by 10.150.192.21 with SMTP id p21mr3759505ybf.271.1287668038341;
	Thu, 21 Oct 2010 06:33:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:57 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:24 -0500
Message-Id: <1287668010-11310-17-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 16/22] quilt: update package LICENSE
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
 recipes/quilt/quilt.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/quilt/quilt.inc b/recipes/quilt/quilt.inc
index 7fd9eac..329c3b5 100644
--- a/recipes/quilt/quilt.inc
+++ b/recipes/quilt/quilt.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Tool to work with series of patches."
 HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
 SECTION = "devel"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 INC_PR = "r7"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
-- 
1.7.0.4



