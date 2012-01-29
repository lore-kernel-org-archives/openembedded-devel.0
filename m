Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RrVNh-0001Yr-Pf
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 15:05:21 +0100
Received: by eekd41 with SMTP id d41so916876eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2012 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=sGg8zewr8TuzW/u8SX2CO6Lf2+ppByJDIQd0/qUcPyw=;
	b=VyFzIlmS9G7Ey+InqqCAbz54cy0PQVHfXeO7DQkCEOxn2YctfxpfNY3P6Abid5OPMg
	ISh0k4DpW87ws/qzPucEwII12N8fA9NXk/vgnu0r2PzIlFNeh4D0y9T391gd2zISZWH0
	k5yz35i5rCipQGVCWBUCJjjFHWB8N5sfQlf+Q=
Received: by 10.14.185.144 with SMTP id u16mr1712287eem.112.1327845449665;
	Sun, 29 Jan 2012 05:57:29 -0800 (PST)
Received: from localhost.localdomain (p4FDF017C.dip.t-dialin.net.
	[79.223.1.124])
	by mx.google.com with ESMTPS id t11sm31778265eea.10.2012.01.29.05.57.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 05:57:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jan 2012 14:59:34 +0100
Message-Id: <1327845574-26155-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1327845574-26155-1-git-send-email-schnitzeltony@googlemail.com>
References: <1327845574-26155-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 4/4] ristretto: update to 0.3.4
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
X-List-Received-Date: Sun, 29 Jan 2012 14:05:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested from scratch
* run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{ristretto_0.3.2.bb => ristretto_0.3.4.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.3.2.bb => ristretto_0.3.4.bb} (70%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.2.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.4.bb
similarity index 70%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.3.2.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.3.4.bb
index 3a167c1..00133c6 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.2.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.4.bb
@@ -9,5 +9,5 @@ inherit xfce-app
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "ab54fffe197c220bf26553c9a4f95658"
-SRC_URI[sha256sum] = "a28c9e472c329b5f3136ebea887dec5ba93a37d5562b493633161392aff5545f"
+SRC_URI[md5sum] = "86c042ee4ffefb0ff5e806849ec4d33c"
+SRC_URI[sha256sum] = "e2ed5c6bc3f56cf82942c54d1492e54607ccf073c7963c1df5fa2cd3a9a71a32"
-- 
1.7.4.4



