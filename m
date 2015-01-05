Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id E3B177284C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 12:54:42 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id w61so7788177wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 04:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UHYGvWdUSrVNRsITCxDET9RkV7t7qXdp6Lw+6B9dbPU=;
	b=IfEhitr0yDVXP/wCr5pgcSb18sCS+zhpqYfO6+/vgm43FxO7Mxh7o7J03C4MemispG
	tYWit3u1qKMp8ijgCNIYUcVZxZ/wUkpB4itiTJVwVUs4fk7I3awxir8wTqiYCtmwv/X3
	WcSsXZpyj3LtmIvaDywzYa9j5AFoWg/9JPWfW+nBGUDA37RdHC4hnN+vuW2F+ODUHlLq
	iRAVLsFcXCMRmfjVMSrZB2ZldQpl23DKMoDHOSU/8eSOoQE/zjMbNQPARc37uSZRknE8
	u1qyw50uLYIKxWI8CjUXJFyXi/CFGdJwVKlnX5oPs5OHO3cILSYjDsO9raIQhrSOqqYV
	8CCA==
X-Received: by 10.194.200.234 with SMTP id
	jv10mr180866221wjc.110.1420462482635; 
	Mon, 05 Jan 2015 04:54:42 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gl5sm12452730wib.0.2015.01.05.04.54.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 04:54:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 13:54:40 +0100
Message-Id: <1420462481-19889-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [meta-oe][PATCH 1/2] epdf: Fix LICENSE format
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
X-List-Received-Date: Mon, 05 Jan 2015 12:54:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/epdf_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index 63e8436..e91eec5 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -6,7 +6,7 @@ SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
-LICENSE = "GPLv2 LGPLv3"
+LICENSE = "GPLv2 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
 "
-- 
2.2.1


