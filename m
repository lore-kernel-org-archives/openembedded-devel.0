Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OeYkj-0008L1-QB
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 21:26:51 +0200
Received: by yxi11 with SMTP id 11so276769yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=M6gFx+gVlTkgb7YY1+0+CW0zWXZXrhCzifDBy9Hf5J4=;
	b=k1R31UYbOXcpdLA2QFya7BrzBm7rG84wdynNi9QGozEmBpFulhTnT6H16Jc32x1zun
	fQMUyqzFulICF1assRlbzXXAas9BGV1Uf4lQFXiTCvNesJD5ya1bnu27stt1iTw62Cjp
	YPjyouV+t7JLo199UG/zqao+ZUsOaLnmbwxOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KoIfVZTWo8mbQBg+7szjbHAnjN8N2kUY5WVlSTJqZaUeqTOmu0geoazSLvHoEUVzFi
	cEe0CEm0sGyfxe+PpY5mX7LY8wRpmrw0hgDjsYr9JOmRNG1hdOM5bY61I6pPICZKQ2F4
	Z638uWjFjh67y4AqFwjRzBM490qEct8P5Wjig=
Received: by 10.150.13.4 with SMTP id 4mr1697912ybm.89.1280431585453;
	Thu, 29 Jul 2010 12:26:25 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id t2sm7740009yba.14.2010.07.29.12.26.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 29 Jul 2010 12:26:24 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Jul 2010 14:22:49 -0500
Message-Id: <1280431369-30659-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] signGP: add BSD header and copyright
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
X-List-Received-Date: Thu, 29 Jul 2010 19:26:51 -0000

* Add the BSD header to the signGP.c file with copyright year
  2010.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/x-load/files/signGP.c |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/recipes/x-load/files/signGP.c b/recipes/x-load/files/signGP.c
index 0e8ed07..bb00dc3 100644
--- a/recipes/x-load/files/signGP.c
+++ b/recipes/x-load/files/signGP.c
@@ -1,3 +1,38 @@
+/*
+ * Copyright (C) {2010} Texas Instruments Incorporated - http://www.ti.com/ 
+ * 
+ * 
+ *  Redistribution and use in source and binary forms, with or without 
+ *  modification, are permitted provided that the following conditions 
+ *  are met:
+ *
+ *    Redistributions of source code must retain the above copyright 
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ *    Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the 
+ *    documentation and/or other materials provided with the   
+ *    distribution.
+ *
+ *    Neither the name of Texas Instruments Incorporated nor the names of
+ *    its contributors may be used to endorse or promote products derived
+ *    from this software without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
+ *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
+ *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
+ *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
+ *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
+ *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
+ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
+ *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+*/
+
+
 //
 // signGP.c
 // Read the x-load.bin file and write out the x-load.bin.ift file.
-- 
1.7.0.4



