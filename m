Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id E6ED56CA74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 22:43:49 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj1so95305pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 15:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BF1fJNyI2XdHLy14i1S6u8FEYjECB8fTI/q7SqnwCuE=;
	b=yPfKohHdOKChlNsJRHujN996D7PUwyH5LPynliMEoYv33jSgNSnWd7VB4DBuJCWmbo
	z0iNmiji7d06HT2J/jEA3hnar8XKwkVartdE3f5P71MgWrtvCcMD2wqsCmOjqPeVqLIR
	4dmKncKzO62HALpTCe5gBM4bG2IogkI64ZPR368TNORgJjX1TpiCaagAl/HMnNQf8yRk
	wybtv28FhcV9VUyDpUpyjyfZlDxS5Gldwk0DwKV+D6qp4d0VlMwSah0zVlHS3HoJNAvY
	iP1GVbpz6WxbSdGX3PUiYMWOY3Dfph8Gu/AXtxmj+TLdrsNk7bCfhGUJilR2/1uclz43
	z0Cw==
X-Received: by 10.66.66.202 with SMTP id h10mr292284pat.70.1381877031709;
	Tue, 15 Oct 2013 15:43:51 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ve9sm86900850pbc.19.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 15:43:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:43:23 -0700
Message-Id: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-systemd][PATCH 1/6] Match the bbappend to OE-Core
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
X-List-Received-Date: Tue, 15 Oct 2013 22:43:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../connman/{connman_1.17.bbappend => connman_1.18.bbappend}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.17.bbappend => connman_1.18.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.17.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.18.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/connman/connman_1.17.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.18.bbappend
-- 
1.8.3.2


