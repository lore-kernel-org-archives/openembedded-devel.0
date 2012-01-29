Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RrcQW-0005Wr-N4
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 22:36:44 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so997210eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2012 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=sGg8zewr8TuzW/u8SX2CO6Lf2+ppByJDIQd0/qUcPyw=;
	b=Eym8I9zy0Adx6tbCgH8Ots3lSrm5uSzQg7XXQNcj3yz41XVfLCcQ1nGuaEDu6Dmdle
	dNV+jovuunSRQX9al8HieM5f3VasE4lqXxyZ0jxW7OOwe6xvGeTGyAK8V1INHPOIv/dk
	nqcVy/7RNa+LmDrLnCj6Bk+8uN/TXa/R5xPa8=
Received: by 10.14.4.85 with SMTP id 61mr4766254eei.58.1327872534627;
	Sun, 29 Jan 2012 13:28:54 -0800 (PST)
Received: from localhost.localdomain (p4FDF017C.dip.t-dialin.net.
	[79.223.1.124])
	by mx.google.com with ESMTPS id n17sm63740491eei.3.2012.01.29.13.28.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 13:28:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jan 2012 22:30:58 +0100
Message-Id: <1327872658-3574-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1327872658-3574-1-git-send-email-schnitzeltony@googlemail.com>
References: <1327872658-3574-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce][v2 4/4] ristretto: update to 0.3.4
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
X-List-Received-Date: Sun, 29 Jan 2012 21:36:44 -0000
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



