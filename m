Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 570306FF64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 23:00:36 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n128so78786202pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yUEzUHE3E6zNrd/oyKs37RUB/cCf2NAz+ai14wDJc/o=;
	b=NiODBMsQ+4oibQtbBTD3UsViFQ2vx+kWVpVw9jfok77TZNK15a9ncBsJ985XQWNEO2
	VnVRglzfnQikqFqKpmsT76KqMMerVHhJ6Ilm27UQIq431Ve+AGHCOc1DisdPzHcO1HPj
	rXJi9fCnVnGcgo9I/yBmWrVrBqN5MxEd4pb59yRuVJ+V3LfnEJkXT6Htq4owebZZJJi4
	94t73l16RW2UaOt+p/PRq79qiKwBnRZrtJW+iDoOZY/eoRLjZAI9umTitvIE55gHvQuP
	oUganTe4Boq9NVcrsb150w3h+ai39+3IikVeOxWfOHuFrdnk8zySiGeo36M8Mui4bcGR
	n5/Q==
X-Received: by 10.98.17.7 with SMTP id z7mr9823693pfi.152.1450738836860;
	Mon, 21 Dec 2015 15:00:36 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	g10sm36819317pfj.15.2015.12.21.15.00.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Dec 2015 15:00:36 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Dec 2015 15:00:29 -0800
Message-Id: <1450738830-30719-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] BSD-0-Clause: remove license file now included in oe-core
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
X-List-Received-Date: Mon, 21 Dec 2015 23:00:38 -0000

  http://git.openembedded.org/openembedded-core/commit/?id=ae85c89810488a9eb86ae3bd765260eb5935711b

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/licenses/BSD-0-Clause | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta-oe/licenses/BSD-0-Clause

diff --git a/meta-oe/licenses/BSD-0-Clause b/meta-oe/licenses/BSD-0-Clause
deleted file mode 100644
index 328bdd6..0000000
--- a/meta-oe/licenses/BSD-0-Clause
+++ /dev/null
@@ -1,12 +0,0 @@
-Copyright (C) <YEAR> by <OWNER>
-
-Permission to use, copy, modify, and/or distribute this software for any
-purpose with or without fee is hereby granted.
-
-THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
-WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
-MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
-ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
-OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-- 
1.9.1


