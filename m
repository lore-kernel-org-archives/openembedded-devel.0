Return-Path: <fritjof.jonsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5465978F67
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CA4BA18358
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:07:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id x1YGnD81sfjD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:07:08 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4F82018346
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:07:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B3291E07F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:07:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F29F1E07D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:07:08 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:07:08 +0200 (CEST)
Received: from lnxfritjofj.se.axis.com (lnxfritjofj.se.axis.com [10.88.130.23])
	by thoth.se.axis.com (Postfix) with ESMTP id 13036B42;
	Mon, 13 Aug 2018 16:07:08 +0200 (CEST)
Received: by lnxfritjofj.se.axis.com (Postfix, from userid 12665)
	id 0F946409CC; Mon, 13 Aug 2018 16:07:08 +0200 (CEST)
From: Fritjof Jonsson <fritjof.jonsson@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 16:06:19 +0200
Message-Id: <20180813140619.26698-1-fritjofj@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Fritjof Jonsson <fritjofj@axis.com>
Subject: [meta-oe][PATCH] Move lonely libcereal from meta to meta-oe
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
X-List-Received-Date: Mon, 13 Aug 2018 14:07:10 -0000

Change-Id: I2462274575e121466b5afc4cda006215e32fd34b
Signed-off-by: Fritjof Jonsson <fritjofj@axis.com>
---
 {meta => meta-oe}/recipes-support/libcereal/libcereal_1.2.2.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta => meta-oe}/recipes-support/libcereal/libcereal_1.2.2.bb (100%)

diff --git a/meta/recipes-support/libcereal/libcereal_1.2.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
similarity index 100%
rename from meta/recipes-support/libcereal/libcereal_1.2.2.bb
rename to meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
-- 
2.11.0


