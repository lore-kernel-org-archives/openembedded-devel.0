Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 996E87E31D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 19:37:10 +0000 (UTC)
Received: from menoah.home (apoitiers-652-1-11-81.w92-146.abo.wanadoo.fr
	[92.146.125.81]) by koncepto.io (Postfix) with ESMTPSA id 0C78D602B3;
	Fri,  2 Aug 2019 21:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1564774630;
	bh=Ns+gkvGAdLF57njpdbVxHUPYbDkbBeX5jd1Gh2Zw7Vo=;
	h=From:To:Cc:Subject:Date:From;
	b=lQqsSUvtoDXyI3v0jRuknzKHqGOTInvxFYlDkoA0ET9Uz+uDaOfjV/0sPR1NPPXH5
	0YxPVd+BS2SfamSsrZ83Sh4xEcao0K8iC40CAWreJwt8b1WkhzhuIP+GhmfsY0FW1f
	ZcxF8MWWAne5pWAIDRUwMCjxfJoq8Ti1CDzDFbXiPFzudxMHhxRawusXmT1YWKKnEx
	oYBFhKDRmIW0SV2jG7ff/wVRjiSlpS5ymwFgcgwK2tFc1N2rOkePG+qtrUSVCyzVfr
	Ni815cKPiUQTR3l8+uP1VcSXFr8EsRDvEMzgwzOzor7nJ/9rGvW5cbiGsIUzjZYk2c
	PFHFkqG+3xoyQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 21:36:51 +0200
Message-Id: <1564774611-12607-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] cppzmq: bump to version 4.4.1
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
X-List-Received-Date: Fri, 02 Aug 2019 19:37:10 -0000

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 11ea3be..cdd2f78 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
-PV = "4.3.0"
+SRCREV = "f5b36e563598d48fcc0d82e589d3596afef945ae"
+PV = "4.4.1"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
-- 
2.7.4


