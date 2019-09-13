Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C00ED7E436
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 12:54:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8DCsR2m014767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 05:54:27 -0700 (PDT)
Received: from yow-dellw-ag.wrs.com (128.224.56.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 13 Sep 2019 05:54:27 -0700
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Sep 2019 08:54:25 -0400
Message-ID: <1568379265-22706-1-git-send-email-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openjpeg: upgrade 2.3.0 -> 2.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2019 12:54:27 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Upgrading fixes CVE-2018-21010 and incorporates other bug fixes
from upstream.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-graphics/openjpeg/{openjpeg_2.3.0.bb => openjpeg_2.3.1.bb}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.3.0.bb => openjpeg_2.3.1.bb} (100%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
similarity index 100%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
-- 
2.7.4


