Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5A540745EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 15:39:56 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w3CFdv0d004400
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 17:39:57 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.65])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w3CFdvAO004516;
	Thu, 12 Apr 2018 17:39:57 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0C65F10BE3A3;
	Thu, 12 Apr 2018 17:39:57 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Apr 2018 17:39:51 +0200
Message-Id: <20180412153951.6159-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] flatbuffers: update to 1.9.0
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
X-List-Received-Date: Thu, 12 Apr 2018 15:39:57 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../flatbuffers/{flatbuffers_1.7.1.bb => flatbuffers_1.9.0.bb}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_1.7.1.bb => flatbuffers_1.9.0.bb} (100%)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.9.0.bb
similarity index 100%
rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb
rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.9.0.bb
-- 
2.11.0


