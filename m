Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCEF74064
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 15:34:00 +0000 (UTC)
Received: by wgbhc8 with SMTP id hc8so14101406wgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2015 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gz3dAs7Sm3fZAFHEFn9H7GBG1m1kclzBW1Vmgyb7CDI=;
	b=ZZl2UNalmWbNrfRJzocT6e07m8ATdjo0Em/EvNeeEvAljXJcy0R9ND10fcnurseUgH
	BuFZ0u4AJec8BGY8P0GP9EdVsbCkXFciOSuyJUGcpdRT7Us45AVB0nQIIuFDH0o89ABb
	9r01mqCCp49YnBABAa+cs2ftZPlpTTNOYlq5f6OcV/YIFEzO0JiVXO2DIcmNfBq5vKiO
	KQMC2b/qF/qhGoG3ARKM+xGL2WjDDDiRUbp3yv6oe5+aT5puMfs/LbYXUzg98GvxPp1Z
	07Lg9dH7GkFTIRyz8MhxlYoMrubpIBxzxQTNNrFa7vMmUsna4RCXWnmze6ZxdDU7MtoC
	IYsw==
X-Received: by 10.194.185.82 with SMTP id fa18mr39532744wjc.50.1431531241604; 
	Wed, 13 May 2015 08:34:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id dz4sm8641066wib.17.2015.05.13.08.34.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 08:34:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2015 17:34:05 +0200
Message-Id: <1431531246-27655-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1431531246-27655-1-git-send-email-Martin.Jansa@gmail.com>
References: <1431531246-27655-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/3] e-wm: upgrade to 0.19.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 May 2015 15:34:03 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/e19_5_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/{e-wm_0.19.4.bb => e-wm_0.19.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.19.4.bb => e-wm_0.19.5.bb} (80%)

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.4.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.5.bb
similarity index 80%
rename from meta-efl/recipes-efl/e17/e-wm_0.19.4.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.19.5.bb
index 7082519..6e374bd 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.4.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.5.bb
@@ -15,5 +15,5 @@ SRC_URI = "\
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "f442ae743d7f698aeb78d245dbc57357"
-SRC_URI[sha256sum] = "1bada8285d9125820a71bc8f5ad9d64b1c07776d5ad31dffe7758f4a9e1def06"
+SRC_URI[md5sum] = "f7557e89b914b4c66eacace66c739437"
+SRC_URI[sha256sum] = "93d27d04e129f6ff751eeec8cda45bbf4f5da6787f8c3e85a4f1aecadc3f0372"
-- 
2.4.0


