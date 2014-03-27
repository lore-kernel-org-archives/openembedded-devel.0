Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA2460CEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 12:11:38 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id; 
	b=rSuJ6EE3atME9Dxx+xXAP7yySG0WmCOzqkp66vBFGzXvawGO+9ROACv196OFJ4B64tFU2jX5MSQP
	0a/ZYRJ4ua0tWni91fcg6LbiCJKy93LI60QSR5024Vna8Nndf/MR  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1395922298244718.3596988285299;
	Thu, 27 Mar 2014 05:11:38 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2014 13:10:38 +0100
Message-Id: <cover.1395921944.git.diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: [meta-oe][PATCHv3 0/3] Update some python modules to latest upstream versions
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
X-List-Received-Date: Thu, 27 Mar 2014 12:11:43 -0000

This patch-set updates python-zopeinterface, python-twisted and python-autobahn to their latest upstream versions.

Changes in v3:
  - detailed commit messages
  - dropped PR where present because of PV increase

Changes in v2:
  - fixed missing Signed off-by

The following changes since commit 7dfa6be8c5d9b093ae79c403c685c6b8ed6216dd:

  recipes-graphics/lxdm: autotools and config updates (2014-03-23 21:53:58 +0100)

are available in the git repository at:

  git://github.com/diegorondini/meta-oe master
  https://github.com/diegorondini/meta-oe/tree/master

Diego Rondini (3):
  python-zopeinterface: upgrade to version 4.1.1
  python-twisted: upgrade to version 13.2.0
  python-autobahn: upgrade to version 0.8.6

 ...autobahn_0.5.14.bb => python-autobahn_0.8.6.bb} |    4 ++--
 ...-twisted_10.2.0.bb => python-twisted_13.2.0.bb} |   17 +++++------------
 ...face_3.5.1.bb => python-zopeinterface_4.1.1.bb} |    5 ++---
 3 files changed, 9 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-autobahn_0.5.14.bb => python-autobahn_0.8.6.bb} (87%)
 rename meta-oe/recipes-devtools/python/{python-twisted_10.2.0.bb => python-twisted_13.2.0.bb} (94%)
 rename meta-oe/recipes-devtools/python/{python-zopeinterface_3.5.1.bb => python-zopeinterface_4.1.1.bb} (83%)

-- 
1.7.9.5



