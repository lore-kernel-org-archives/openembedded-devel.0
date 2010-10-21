Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHu-0007Zc-31
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:35:07 +0200
Received: by mail-yx0-f175.google.com with SMTP id 3so2495892yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Eej3nmolSwTghlydWCOgjoifx/bp/UCT+v8qOnfi8rI=;
	b=AZQjmkMgiAr0LfY5k8uIIhDGq8dMZk1hZZ6dXp1Dkad6GayQZuBcyOBtnW/kuJQ/8K
	xjFo3MOLPKUZ//XkIAyM3Ryy20qo2jqL+nrjYHcVgZjJLn/d27d0pOrJLK+KlisCs8c+
	ojimwbThMH3pcCCUDKVAp1s3bdKXirIhSUxc0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GttYnFxSwOq12YuQlZ12eqUoihHn02BqS3KdsOvBOkCHjtlF0P5jOpUdYH2Ta2Oqv7
	QKzFd7eSG4AjJBzmo4iqDbB5ZzZndWXYWMFgiQmPvLsDmQdcXDJFpbgfxwhxFo1SBYhl
	JA5CYV6LuF4+YNg4jGRpPU4duORd/Gllid2/4=
Received: by 10.150.186.17 with SMTP id j17mr3724520ybf.272.1287668039648;
	Thu, 21 Oct 2010 06:33:59 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:59 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:25 -0500
Message-Id: <1287668010-11310-18-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 17/22] thttpd: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:10 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/thttpd/thttpd_2.25b.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/thttpd/thttpd_2.25b.bb b/recipes/thttpd/thttpd_2.25b.bb
index 85c7f70..bf03525 100644
--- a/recipes/thttpd/thttpd_2.25b.bb
+++ b/recipes/thttpd/thttpd_2.25b.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A simple, small, portable, fast, and secure HTTP server."
-LICENSE = "BSD"
+LICENSE = "FreeBSD"
 HOMEPAGE = "http://www.acme.com/software/thttpd/"
 PR ="r8"
 
-- 
1.7.0.4



