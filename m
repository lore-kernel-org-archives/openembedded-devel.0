Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHn-0007Po-9k
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:33 +0200
Received: by mail-gx0-f175.google.com with SMTP id 22so12464gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=el5ogQUSSHleHNc5tB4sdB6MO+746CFDUru7vWIYW9k=;
	b=G7JYQCi7vTN5pm554YCgHg/FCP9cRTHwU7yi/7JGzXmQH4GjVKaTIeUMKtilr1aTE2
	GeCwwP7fthWEs5fo6TL2eiv4zEjf5PvwACNNmbJAwmaw98RgsdAU9pg6bEqmtos9JCoa
	MogGwOKEdv2j2XkOX/NtWFI6yxfK03rzk+Tio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Jo2HzxX3kxJLdr0C+8AkFbutL4rBkB870RuPJAdKxgRUfiWS5OgLtqxrfFSHTyo0gT
	551UZ1rOEkPqo/wjaEuyQoQGP0DH2wZRoRzv6ej94MWUkp13cg2tSpGvSEf3IRonXWfC
	IwB4DOU4pvjMErdf7iylJjUNWXqCoXW+mjz0s=
Received: by 10.150.236.9 with SMTP id j9mr3839409ybh.241.1287668029779;
	Thu, 21 Oct 2010 06:33:49 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:49 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:18 -0500
Message-Id: <1287668010-11310-11-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 10/22] ipkg-utils: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:08 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb  |    2 +-
 recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
index 6687129..6a80d01 100644
--- a/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
+++ b/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
@@ -1,6 +1,6 @@
 SECTION = "base"
 DESCRIPTION = "Itsy Package Manager utilities link script"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 CONFLICTS = "ipkg-utils"
 SRCDATE = "20050930"
 PR = "r4"
diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
index d22fd26..26584e9 100644
--- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
+++ b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Itsy Package Manager utilities"
 SECTION = "base"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 CONFLICTS = "ipkg-link"
 RDEPENDS_${PN} = "python"
 SRCDATE = "20050930"
-- 
1.7.0.4



