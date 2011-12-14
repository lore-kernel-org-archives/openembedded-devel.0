Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadTf-0004B4-Fo
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 02:17:47 +0100
Received: by yenm12 with SMTP id m12so267589yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=NbZavEIMC4wEFjZd0jbNB1sXlI80uE+GkYDZbZXz104=;
	b=oTRfHu6Zxie3xaNCi38a22ADvTr5gSyN7PG/uJqZAh5GyelvMce97h6/HbflVqOjwJ
	jDHZA3ybqCTlxnW+MtpA6c1likjaSFD/ZpjSNgrc49r1IU+K8KcYspn8XPbL95xyEBWB
	hhRPMqC0lK6Fh2CBHU5mCNJpse+VrMV0G9yiI=
Received: by 10.236.91.84 with SMTP id g60mr8088347yhf.90.1323825051120;
	Tue, 13 Dec 2011 17:10:51 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm2306489anu.21.2011.12.13.17.10.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:10:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:10:29 +0000
Message-Id: <8b8b528485406db3e9eae034cc5321795102d5a5.1323824998.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/8] faad2_2.7.bb: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:17:47 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
index 4015c1a..462837f 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "Library for reading some sort of media format."
 SECTION = "libs"
 LICENSE = "GPLv2"
-PRIORITY = "optional"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
 
-- 
1.7.2.5



