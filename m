Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 249D2723B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2015 22:21:05 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Mar 2015 23:21:01 +0100
Message-Id: <1427494862-25016-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427494862-25016-1-git-send-email-obi@opendreambox.org>
References: <1427494862-25016-1-git-send-email-obi@opendreambox.org>
Subject: [meta-oe][PATCH 2/3] python-pyopenssl: move to meta-python
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
X-List-Received-Date: Fri, 27 Mar 2015 22:21:08 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 {meta-oe => meta-python}/recipes-devtools/python/python-pyopenssl_0.14.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-python}/recipes-devtools/python/python-pyopenssl_0.14.bb (100%)

diff --git a/meta-oe/recipes-devtools/python/python-pyopenssl_0.14.bb b/meta-python/recipes-devtools/python/python-pyopenssl_0.14.bb
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pyopenssl_0.14.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_0.14.bb
-- 
1.9.1


