Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHe-0007X8-E9
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:20 +0200
Received: by gyd5 with SMTP id 5so802555gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=E5jmO0n/R1S2hqbjj1c772r8TralEQIZVFkC6DUPJLk=;
	b=f191i2+YhvwvlRcLMjHCA0rA7q8jIoBH+qbYjUOWlRoiTYAHlK1KU48/FMyTnz5kEO
	XvrS2silNjixDV6Jfs8ty0aalrGBmX5fZlOk7ToWq41oMFadifRmAzstITSDK6xbveyf
	LtEhAFvfx/4e8+Vk4r2TwUgF1oGWaWAD3GMCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=w8fEzBF6i0KzlclX5ImcftH/nKn3EfSDawoPf6sTOpNf42XYbTFEQo9GnyKmqgypqv
	yI7LyO4vvOQUqoV3EOaBWcQ6ptPZvn6sMJIZV6eTsiHJMaa4b5VIBYI4Dsa5HQlZ6EmS
	Tg/UDsxxUB5grVwYK/g6LDttzQ7pfhcINEfNI=
Received: by 10.151.112.3 with SMTP id p3mr3698708ybm.147.1287668017634;
	Thu, 21 Oct 2010 06:33:37 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:36 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:10 -0500
Message-Id: <1287668010-11310-3-git-send-email-Chase.Maupin@ti.com>
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
Subject: [PATCH 02/22] bison: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:34:23 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/bison/bison.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/bison/bison.inc b/recipes/bison/bison.inc
index 3441bcf..023895e 100644
--- a/recipes/bison/bison.inc
+++ b/recipes/bison/bison.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNU Project parser generator (yacc replacement)."
 HOMEPAGE = "http://www.gnu.org/software/bison/"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 SECTION = "devel"
 PRIORITY = "optional"
 DEPENDS = "virtual/libintl flex-native"
-- 
1.7.0.4



