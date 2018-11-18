Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 127366C102
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 22:00:16 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id e5so3559194plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 14:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sV7IJYPhTY4nzJ+qDB9kkXW8G4ilbjY4bxgwZTJWpPI=;
	b=JW/J6kdhuYcSOTbj4/P3rQ5OUK0Dl1cfyv8imdIwphr/i/tMALL2uLTax1Wos/vZRx
	jAJgQbYmr+jTzwhNcIOKo03qglncBpX6dZID0AkaoZ+9UnlUJchpCoVUk849XRGOlZFz
	ue5D1jn9t+2+mrRPkbpjx2jWZR/CudLg+fpexveHOQGfWPi//X9vZoNjqkg6NK//A2JH
	d7/bUgM15mBprJ/ooZsb/Xo2+nw/zXWbwMgLotjNpPg3izJeTVP4NsK2IzcWVxRcnDzw
	4IljPYJFiE4Gqj+aRPuid4jEytqJH/42XjtNx8suBrLtjp25whg8yAuC+2U7Ak+8E1z4
	T1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sV7IJYPhTY4nzJ+qDB9kkXW8G4ilbjY4bxgwZTJWpPI=;
	b=D2i/yhWI+NuFDQE1K2NAV077uS9W+C6QySAtpu0WOXoX3xWeX+t1LuDHAaDYk6i+95
	+skmUg006xW5MC/Cp/v1ajm5IRbHGazUVpQY1D1TrJcvv9ZYSOYxNrU3Gz+Q5EtQUIxv
	tZ4u8D3kIi4TTfIg9/DvegWXLmScke4wYW+qEHipFvDO8NvzUvDNsO4yR9QOq/W5keok
	DhKGPEibG5yGo15j1iog3wmV4Nbpe59jwCwbmptwM8Ju3rpjpFvwk+UOBkjKVGPUOlgJ
	fTkEWbWCzJuPfxGlPv7ppeBItcLM5jNnl+NYzLspFxru2BJPTTI0VM5LBubYNrh5tC7E
	ySMw==
X-Gm-Message-State: AA+aEWbVHv2W7J9/dN4XR0SRikuyzRFZz54hN359UI89J9szOUgF8lBc
	rFfQVl9JN/ovlHT0p7GQeq14AYmu
X-Google-Smtp-Source: AFSGD/XcWUioJTxkvGqGHnS+G0vmONdGvlFvClY3zCAHBEAZntd8KJDFFUjCDbc8IRXY9XknsgE7mQ==
X-Received: by 2002:a17:902:b205:: with SMTP id
	t5-v6mr1709240plr.128.1542578417954; 
	Sun, 18 Nov 2018 14:00:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:8599:3a91:5ee0:9f77])
	by smtp.gmail.com with ESMTPSA id
	q25sm41456009pgb.2.2018.11.18.14.00.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Nov 2018 14:00:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Nov 2018 14:00:15 -0800
Message-Id: <1542578415-27437-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542578415-27437-1-git-send-email-akuster808@gmail.com>
References: <1542578415-27437-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] sblim-sfc-common: use official SPDX license for EPL
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
X-List-Received-Date: Sun, 18 Nov 2018 22:00:17 -0000

WARNING: sblim-sfc-common-1.0.1-r0 do_populate_lic: sblim-sfc-common: No generic license file exists for: EPL in any provider

it is  EPL-1.0

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
index 2a9b4bb..4e90215 100644
--- a/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
+++ b/meta-oe/recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "\
 This package provides a common library for functions shared between Small Footprint CIM Broker (sblim-sfcb) \
 Small Footprint CIM Client (and sblim-sfcc)."
 HOMEPAGE = "http://sourceforge.net/projects/sblim/"
-LICENSE = "EPL"
+LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
 SECTION = "Development/Libraries"
 
-- 
2.7.4


