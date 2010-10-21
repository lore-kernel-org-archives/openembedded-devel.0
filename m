Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHp-0007Ju-1c
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:43 +0200
Received: by mail-yx0-f175.google.com with SMTP id 3so2495804yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=kKJEBA0iVV12xZ9Jtw38p3tdwzsE3SzOudgZDYGPDqA=;
	b=oXZaKd10a7fUsln51gaf8Trn8VrWHvmBWLKPBpVUJ6EnElT4y7UzAuodwJWbBeGmsj
	7GVT9Fo8DVZqF7a0+BIFdDOp0sxIfrOhDQc4IFtEqtuvzaEQAYARO78sreEOeg8eWM2M
	ARheWTPkoBO+cfzfqz0TxRjeZUOpK1Ywjth5E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nQWuG2+oe5fTTJW9mirUUEwnfm+5l9bklPTDVAb1zXfQLW4FZhzfpQXQbXtfU8HLo6
	Dz9332MSWs1xlWKFifb0Pqd3PGxRGjRSLxN6oN2RMrmWlqju/HqKdDGqaDJLeOaxiUjC
	yujjZPK4X+vMlIzdOr6qoFYXvr0LZqUNyI2S4=
Received: by 10.150.49.18 with SMTP id w18mr3818523ybw.246.1287668034090;
	Thu, 21 Oct 2010 06:33:54 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:53 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:21 -0500
Message-Id: <1287668010-11310-14-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 13/22] linux-libc-headers: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:09 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/linux-libc-headers/linux-libc-headers.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/linux-libc-headers/linux-libc-headers.inc b/recipes/linux-libc-headers/linux-libc-headers.inc
index 642e369..0b27e46 100644
--- a/recipes/linux-libc-headers/linux-libc-headers.inc
+++ b/recipes/linux-libc-headers/linux-libc-headers.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Sanitized set of 2.6 kernel headers for the C library's use."
 SECTION = "devel"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
 
-- 
1.7.0.4



