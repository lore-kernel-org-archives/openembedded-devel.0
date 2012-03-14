Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7uV5-0004MH-8l
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 21:08:47 +0100
Received: by mail-wi0-f177.google.com with SMTP id hj13so2795037wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qENdslE15Q6FVLVse0KqOZkyUJupepjP5+oPwxo9d3Q=;
	b=Seoe7lZaaHdBi2BbKMMYOu1EOxldzRolbHzQCcwaTPsMAF/D5zizsNSzReKy8kzV4e
	yzWX6d2/53RPQpk0PrfUqWDy3tujef//lwm98lpfMmqwGCC0IYxC+67XL8cfFI0StEDU
	+nl2UL0rPbYtptyzLDUGow+fHdm4AHEXtGZOFMtY8HM4nq24OdFvde5MWykX/n/RuFhF
	fBDnXfZXFHRkhTBNuKORzp8QOGturqOo/7pp7QcwCRvdHZV0rcuzSNM0gldDfLyzhZHD
	Xms8lgtoXJMNF3eOq840Evct8XHVHp4CNYEYrNb6fRuaDUp/aW/+khwvll4/yLE5jKTu
	IfMQ==
Received: by 10.180.83.97 with SMTP id p1mr9267110wiy.19.1331755203941;
	Wed, 14 Mar 2012 13:00:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fi4sm14076682wib.4.2012.03.14.13.00.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 13:00:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2012 20:59:21 +0100
Message-Id: <c1fad08e7920dead23b5a7a7dd3c1d49496a72e0.1331754944.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
References: <7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1331754944.git.Martin.Jansa@gmail.com>
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 5/5] e-base: bump EFL_SRCREV again to get elementary-1.0 API
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
X-List-Received-Date: Wed, 14 Mar 2012 20:08:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index b337530..58636ec 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "68387"
+EFL_SRCREV ?= "69323"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.5



