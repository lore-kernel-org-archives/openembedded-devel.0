Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <autifk@gmail.com>) id 1SKZxr-0002uS-Ij
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 20:50:51 +0200
Received: by qafl39 with SMTP id l39so914712qaf.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 11:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ch3L77Ya5+L0pZm6SMYYgLEqrTJxRN/kfp1xRPMOmWI=;
	b=oblxGX5Wep1t72R/JVjVv0I6q2P3IJZU5j7s0gJHnJi8HYaeniE5hgAFwHiq4FVOms
	G9tgy+DADaDFSx5B/G9oo3WDPo1NBhRBENkXWlUGQzEJdowSOfNift1wWVjS+KtR/Vlq
	Z4Fql5d6m6hpQG2wWK3cVAG3kr2uMiOQ1X/bZE1dy6r3uAXSVU/1LJc/Bo6eWOh0Lv+C
	uze+yrs/c60Clu1xG2Jd44TTfVMQUgiQAPNhJKqlD6DimCwj2+z1dIP/8pXrM9wpXLmy
	2yAWA7bk/X2iQsMFpIcLf9bqeV/5JrgnW/VNdPBuZd/9CJh4bwxd3qGct7ebTXQRH5d8
	Upqg==
Received: by 10.224.198.70 with SMTP id en6mr5112296qab.62.1334774483275;
	Wed, 18 Apr 2012 11:41:23 -0700 (PDT)
Received: from localhost.localdomain
	(static-72-93-90-226.bstnma.fios.verizon.net. [72.93.90.226])
	by mx.google.com with ESMTPS id eg9sm47480202qab.19.2012.04.18.11.41.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 11:41:22 -0700 (PDT)
From: Autif Khan <autifk@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Apr 2012 14:41:10 -0400
Message-Id: <1334774470-20325-1-git-send-email-autifk@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Autif Khan <autifk@gmail.com>
Subject: [PATCH 1/1] Fixed the URL for git repo for meta-openembedded
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
X-List-Received-Date: Wed, 18 Apr 2012 18:50:51 -0000


Signed-off-by: Autif Khan <autifk@gmail.com>
---
 README |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/README b/README
index 5fafd9d..9f441f5 100644
--- a/README
+++ b/README
@@ -10,7 +10,7 @@ URI: git://git.openembedded.org/openembedded-core
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.net/meta-openembedded
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
-- 
1.7.5.4



