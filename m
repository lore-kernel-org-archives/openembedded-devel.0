Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9D71977168
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 19:42:40 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j37so2454147qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 12:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X9Uh9lTy1EFrLNQ6SVsdTtFHeNEh59K4Gw06XiPzvXk=;
	b=P7vDLgkfsOSSNYOtpunZV5VY8Zy1DZLROnQmmaZnqm6rPYVZdeOcqb3uPqql/h1Ujo
	nWRzCDL+OKdB5tjs8aPjEhUvoOMXufGGSnvIj6FfZMijMeE4jQpv5pLYdalk0VggS1ee
	Ctb+u4ygvlnDEfma547AnPiT0ffQ+e35pGFkZPdL72ki4qb9Yxx+v6ohP3njzJ2SICx9
	R1Q8VlStIfgk+QAljn47XGol/rpJygKOUmsBhlILZ/8eEAXVsEK/8SRpmWf9eWblPu6v
	f+aVzAapw1FPa2F4/Ry1u9YGcVP40919kKDpl0tR3hOqZMu93aLB9wOU2btCwpCCXWfp
	21Lw==
X-Gm-Message-State: AEkoouu5Dhi5wmu78I0oCxHdpjXzcD7av7xh0KqzSguAzzSRLJXeSWNzIQ6meZgA+3Q/Ag==
X-Received: by 10.200.35.169 with SMTP id q38mr35299478qtq.4.1471290160954;
	Mon, 15 Aug 2016 12:42:40 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	r29sm13157430qte.48.2016.08.15.12.42.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 12:42:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 15:42:32 -0400
Message-Id: <1471290153-4504-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-monotonic: update to version 1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2016 19:42:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-monotonic_1.1.bb => python-monotonic_1.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-monotonic_1.1.bb => python-monotonic_1.2.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python-monotonic_1.1.bb b/meta-python/recipes-devtools/python/python-monotonic_1.2.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python-monotonic_1.1.bb
rename to meta-python/recipes-devtools/python/python-monotonic_1.2.bb
index c514313..66183ef 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_1.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "8271b79de174dc3ef00535caef38be85"
-SRC_URI[sha256sum] = "255c31929e1a01acac4ca709f95bd6d319d6112db3ba170d1fe945a6befe6942"
+SRC_URI[md5sum] = "d14c93aabc3d6af25ef086b032b123cf"
+SRC_URI[sha256sum] = "c0e1ceca563ca6bb30b0fb047ee1002503ae6ad3585fc9c6af37a8f77ec274ba"
 
 inherit pypi setuptools
 
-- 
2.7.4


