Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1O6mFf-0004GS-Lo
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 16:59:08 +0200
Received: by bwz20 with SMTP id 20so2965143bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=t8IPvKiDm3QX7lRM7wmT4CKRVp5SSRPuOxzebvYUkCs=;
	b=N0ftfLAGJRxGV6pThR/OEgQUNy7fBr8MLa0u63aLyk5W8IOx4ka93p6P8Xe2Vf5ASp
	aLpGopUro1xRYyRcS206qIrKW9k9OHc/tchsSBx5yZDl2xz0hU44JzouyqwaTTYX4q/m
	7ZBDtFXsai6zyQ9T1KWJIsPI2ZG+4ISYOvoNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cLHTectlzGxlN/IzDGqA3/rhmOp3vIcUhbu39wHylThKkvMvEZVHS8cKO0Wev5D//O
	TM2y1O0EUzaRgkckYT4yGODN2odsnbrEKk8DBrN+YnSoMXuUICnZ+JIhN26AbLUs2a+t
	05rXXqV8wRl5Lb33Hwa1NnXV1yaYMecgjlejs=
Received: by 10.204.135.211 with SMTP id o19mr3740714bkt.98.1272380127561;
	Tue, 27 Apr 2010 07:55:27 -0700 (PDT)
Received: from localhost.localdomain ([201.153.217.127])
	by mx.google.com with ESMTPS id s17sm181110bkd.16.2010.04.27.07.55.25
	(version=SSLv3 cipher=RC4-MD5); Tue, 27 Apr 2010 07:55:27 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 09:54:49 -0500
Message-Id: <1272380089-11291-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xserver-xorg-conf_0.1.bb: increase PR
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
X-List-Received-Date: Tue, 27 Apr 2010 14:59:08 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 283bc58..c56aafc 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r25"
+PR = "r26"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.6.6.1



