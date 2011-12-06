Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXncx-00040x-JX
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 06:31:41 +0100
Received: by yenq1 with SMTP id q1so1493560yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 21:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JIpidDHWtO/O6XudFyl/zdTgQrjd4zEuZOCLZAU3L7A=;
	b=s5+8x2SPttLaWDd2F0yfmvsHX9fWp8V2bq5U4mQzZTMVktT2FwktAZkLdFeGeQJHLu
	j1nnB6dK5/WJyvUTSF8EqP7JQMbVBBuhMD97MAecNODOWTFFwedMlHQ4TuUg7mYdoESK
	Rx0fIJuu9+aLe6f5IytB/DyHxv1MydBizB/V8=
Received: by 10.236.91.67 with SMTP id g43mr14280007yhf.68.1323149091767;
	Mon, 05 Dec 2011 21:24:51 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id d6sm47774282anm.16.2011.12.05.21.24.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 21:24:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2011 21:24:36 -0800
Message-Id: <1323149076-10389-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1323149076-10389-1-git-send-email-raj.khem@gmail.com>
References: <1323149076-10389-1-git-send-email-raj.khem@gmail.com>
Subject: [[meta-oe] 2/2] eglibc-2.12: Bump SRCREV to latest SVN 2.12
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
X-List-Received-Date: Tue, 06 Dec 2011 05:31:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/eglibc/eglibc_2.12.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/eglibc/eglibc_2.12.bb b/meta-oe/recipes-core/eglibc/eglibc_2.12.bb
index 7bdd629..7ab8033 100644
--- a/meta-oe/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta-oe/recipes-core/eglibc/eglibc_2.12.bb
@@ -3,7 +3,7 @@ require recipes-core/eglibc/eglibc.inc
 DEPENDS += "gperf-native"
 PR = "r27"
 
-SRCREV = "14158"
+SRCREV = "15872"
 
 EGLIBC_BRANCH="eglibc-2_12"
 SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
-- 
1.7.5.4



