Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3N6n-0008QF-Rf
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 10:13:15 +0200
Received: by wgbdr1 with SMTP id dr1so4517151wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 01:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8YcZe2A894070jYB0IhClHXbu2r7UIRMb3P4yMZSSpY=;
	b=NmI0tGaSZeRP0+KAktPdbuhe31Y5vDtLjaQ7nJ12+42dXG4AHZpe1NFWEKB+WX4Svy
	zETYylKReUcuWtlVxpFUTYHyPIbGuweAD68UoLjEbdURN9gWvR07GuMTqAKsgx3ieupT
	VGy90OSVyQ8uRCKmouV+ZaWD5TcaXGUNUi86rL6uPHkPqG1cF/pZr5ZrgqO1lTLa8vKE
	dNrl9ITcBrAOzDOtbKaxlg4/iNawvmbJLnTCmizU5A8yvRXS+q2MX0ATdVX7uiiOzXX7
	MB987PHtG3n3Vi2hMgGcCCz5hAmsDgZz7iTCamGvRfq369s/biPD+egNpWYwny3STfva
	yekw==
Received: by 10.180.107.70 with SMTP id ha6mr3232902wib.7.1345449671902;
	Mon, 20 Aug 2012 01:01:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm39795756wix.6.2012.08.20.01.01.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 01:01:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 10:00:52 +0200
Message-Id: <68d065a9bce16fd9e00cdf8d7d791ba9dd4bf3cb.1345449578.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
	<7c28fa0c71de1b487d05695b8401333140bc76b5.1345449578.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345449578.git.Martin.Jansa@gmail.com>
References: <cover.1345449578.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 49/52] e-base: bump EFL_SRCREV for 1.6.99-beta
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
X-List-Received-Date: Mon, 20 Aug 2012 08:13:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 4213098..e701fb5 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "75097"
+EFL_SRCREV ?= "75359"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.7.8.6



