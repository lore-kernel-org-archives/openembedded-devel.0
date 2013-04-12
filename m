Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQafI-0007Yu-0Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 11:53:16 +0200
Received: by mail-pa0-f54.google.com with SMTP id fa11so1375729pad.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=tPoEwY2Y54yXfz3oEzTqIMd2e4dU8gE/OwDUDznqbA8=;
	b=fc3BbsguH5dj5X18ziEQJ0tsmRaEcrkOgjp9SBpue1J0x31QOhFRlOLOJpTO6+pr0m
	gTRaB6XTLNqyNIqotNyXZlcHs8UOVZZa+eQaAByywmv350314j6C+YRc+1ZcyjPkozHA
	hSWkdPSZ169A+DnBuLberymHdMOZ9P4WvZRAItoZH/VZ1XeWtXfkbqgnE1Dzk8GDUI5+
	Tl3ypx96umxsw0NztDl3qA2M2WaFjiHpg3NL3w7DQ+tTQ7qG7Y9eezURUQzvOd7yNhRG
	Cj9LqMH2dYplnfPWjCa8vLOnOIf5ZLXWAy9KSEje1PI3k7kcif0pHQF2+6MmFxQDx8iD
	8uzQ==
X-Received: by 10.66.25.147 with SMTP id c19mr14176239pag.207.1365759339187;
	Fri, 12 Apr 2013 02:35:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ak5sm8852501pac.4.2013.04.12.02.35.35
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 02:35:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 11:35:28 +0200
Message-Id: <1365759328-22377-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCH] python-vobject: fix LICENSE format
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
X-List-Received-Date: Fri, 12 Apr 2013 09:53:21 -0000

WARNING: python-vobject: No generic license file exists for: Apache in any provider
WARNING: python-vobject: No generic license file exists for: License in any provider
WARNING: python-vobject: No generic license file exists for: V2.0 in any provider
---
 meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
index 4a03ea2..5c6d82b 100644
--- a/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
+++ b/meta-oe/recipes-devtools/python/python-vobject_0.8.1c.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Python package for parsing and generating vCard and vCalendar files" 
 SECTION = "devel/python" 
-LICENSE = "Apache License V2.0" 
+LICENSE = "Apache-2.0" 
 LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 HOMEPAGE = "http://vobject.skyhouseconsulting.com/" 
 SRCNAME = "vobject" 
-- 
1.8.1.5



