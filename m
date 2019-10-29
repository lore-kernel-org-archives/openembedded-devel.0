Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8387FA4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:06:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472Qh405TGzQt
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572340020;
	bh=gJnKQ9CfyRruG9WFjQHAO6u8+fUMDeT/wClfL+EUm1k=;
	h=From:To:Subject:Date:From;
	b=p75QVIIXljemy5EEd7ZGY+Ui9iBWiEgfGpWnyUq4EFMc8dcdXUaRfDSY056iNVjjL
	JlPgY7rZp+IjzdkUNZXhJ9HejF+fqvQoQx3jahASazQu8yJ2K9dDYZ3f0WTYJR4z90
	FxmiOXpDX08a5UK/lmJXNk00uoM+MsbjQcyBGZG7PomvpqT3apNBz9JWjDkCcuAeff
	UCrCWfdsyOvl+G4PdrPUcVTfhVZhqxVN4UKIQYb+a0UJ6y8JLZ7P2qAZdh9XnAXpKS
	NvGM1cDbQ3VOmabOXKozgEN+mYSq77IwoRFvlBcLXAxKZwi9l0hewDgn+JYomlOC5T
	PbjAyc7Fsj/x7OZpLsOOaQ2suuHLzC2rrE1qeVof5s+ZgjTyR/yv81qLtgtJlA+qK+
	fjPWiC3MjXnyi0U+7P4xSNJJiCP1M5yNCOOkQp4hvQci05Mz4GAar0xkvjzmxlTd/e
	gvdhVYkVaW4zg+Zy6eq0Msron1t8Pczi3rZCXWp1gJcBvEcyJIU7OSoCwTAJswyhEq
	U2dengqZkmQDKSX3m3H4gDypU2kUgEjZzdrHtEocmkVvELPgqDhv6EW33BFralDy0s
	BuHa4kZc2wjNZC635jQ8tjYiWQmFGUqQg2ONbU9MrtS95UTTTk3+32wlhf38exa6GY
	VcuJ+I6SOwjC9fztQC0yEhlk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 11:06:56 +0200
Message-Id: <20191029090657.30771-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] cim-schema: Remove duplicate file
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
X-List-Received-Date: Tue, 29 Oct 2019 09:06:59 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../cim-schema/cim-schema/files/LICENSE       | 34 -------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE

diff --git a/meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE b/meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE
deleted file mode 100644
index 54a28120e..000000000
--- a/meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE
+++ /dev/null
@@ -1,34 +0,0 @@
-// Copyright 1998-2008 Distributed Management Task Force, Inc. (DMTF).
-// All rights reserved.
-// DMTF is a not-for-profit association of industry members dedicated
-// to promoting enterprise and systems management and interoperability.
-// DMTF specifications and documents may be reproduced by
-// members and non-members, provided that correct attribution is given.
-// As DMTF specifications may be revised from time to time,
-// the particular version and release date should always be noted.
-// 
-// Implementation of certain elements of this standard or proposed
-// standard may be subject to third party patent rights, including
-// provisional patent rights (herein "patent rights"). DMTF makes
-// no representations to users of the standard as to the existence
-// of such rights, and is not responsible to recognize, disclose, or
-// identify any or all such third party patent right, owners or
-// claimants, nor for any incomplete or inaccurate identification or
-// disclosure of such rights, owners or claimants. DMTF shall have no
-// liability to any party, in any manner or circumstance, under any
-// legal theory whatsoever, for failure to recognize, disclose, or
-// identify any such third party patent rights, or for such party's
-// reliance on the standard or incorporation thereof in its product,
-// protocols or testing procedures. DMTF shall have no liability to
-// any party implementing such standard, whether such implementation
-// is foreseeable or not, nor to any patent owner or claimant, and shall
-// have no liability or responsibility for costs or losses incurred if
-// a standard is withdrawn or modified after publication, and shall be
-// indemnified and held harmless by any party implementing the
-// standard from any and all claims of infringement by a patent owner
-// for such implementations.
-// 
-// For information about patents held by third-parties which have
-// notified the DMTF that, in their opinion, such patent may relate to
-// or impact implementations of DMTF standards, visit
-// http://www.dmtf.org/about/policies/disclosures.php.
-- 
2.17.1


