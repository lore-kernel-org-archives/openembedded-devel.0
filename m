Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id BF746612D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Nov 2013 15:15:22 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id w10so5716922pde.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Nov 2013 07:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YvK8pMWkedqr03V9IWIUpGUC2Um5wGWVWcQcl4lzIbI=;
	b=iieZNatWtmzIr1Hry3pYOs3Canlpqn0yApjC6PgucDwxQMbbB27yuiXT3PTq3zYqFq
	YwcQuRSYq5yODHpS8YU4rOp+pDrxR57EA0NJjDo6VnnvziPBzVAe0Vwwsm0FWIXpdGLG
	1wPGXszNDiifbHX9uQvxW/y5fipNzSgbsRU3Nn5g+cCzq92FuY/0AVisauELIseTUiI0
	qsi0R8H/zIJMEwEW6wYn6L3sH1ML/AgEwx9CrObFJpT/z+DiwCcFctqoa7aPK7KgIgxN
	k9WqHoC4LQU5D01soeVuKT4lCruOrSS3dPFsttuqiu/dEL1UDIBACiyotZkL+cjoNjE1
	g7qw==
X-Received: by 10.67.21.226 with SMTP id hn2mr13412179pad.69.1383491724419;
	Sun, 03 Nov 2013 07:15:24 -0800 (PST)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	sy10sm26696594pac.15.2013.11.03.07.15.23 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 03 Nov 2013 07:15:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Nov 2013 07:14:34 -0800
Message-Id: <1383491674-13152-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-qt5][PATCH] cmake: match bbappend to OE-Core version bump
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
X-List-Received-Date: Sun, 03 Nov 2013 15:15:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-devtools/cmake/{cmake_2.8.11.2.bbappend => cmake_2.8.12.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-devtools/cmake/{cmake_2.8.11.2.bbappend => cmake_2.8.12.bbappend} (100%)

diff --git a/recipes-devtools/cmake/cmake_2.8.11.2.bbappend b/recipes-devtools/cmake/cmake_2.8.12.bbappend
similarity index 100%
rename from recipes-devtools/cmake/cmake_2.8.11.2.bbappend
rename to recipes-devtools/cmake/cmake_2.8.12.bbappend
-- 
1.8.3.2


