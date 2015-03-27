Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 23A3F6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2015 22:21:05 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Mar 2015 23:21:00 +0100
Message-Id: <1427494862-25016-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/3] gateone: move to meta-python
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
 .../0001-configuration.py-Hack-around-broken-gethostname-thin.patch       | 0
 {meta-oe => meta-python}/recipes-connectivity/gateone/gateone/80oe.conf   | 0
 .../recipes-connectivity/gateone/gateone/gateone-avahi.service            | 0
 .../recipes-connectivity/gateone/gateone/gateone-init                     | 0
 .../recipes-connectivity/gateone/gateone/gateone.service                  | 0
 {meta-oe => meta-python}/recipes-connectivity/gateone/gateone_git.bb      | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-python}/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch (100%)
 rename {meta-oe => meta-python}/recipes-connectivity/gateone/gateone/80oe.conf (100%)
 rename {meta-oe => meta-python}/recipes-connectivity/gateone/gateone/gateone-avahi.service (100%)
 rename {meta-oe => meta-python}/recipes-connectivity/gateone/gateone/gateone-init (100%)
 rename {meta-oe => meta-python}/recipes-connectivity/gateone/gateone/gateone.service (100%)
 rename {meta-oe => meta-python}/recipes-connectivity/gateone/gateone_git.bb (100%)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch b/meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
rename to meta-python/recipes-connectivity/gateone/gateone/0001-configuration.py-Hack-around-broken-gethostname-thin.patch
diff --git a/meta-oe/recipes-connectivity/gateone/gateone/80oe.conf b/meta-python/recipes-connectivity/gateone/gateone/80oe.conf
similarity index 100%
rename from meta-oe/recipes-connectivity/gateone/gateone/80oe.conf
rename to meta-python/recipes-connectivity/gateone/gateone/80oe.conf
diff --git a/meta-oe/recipes-connectivity/gateone/gateone/gateone-avahi.service b/meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service
similarity index 100%
rename from meta-oe/recipes-connectivity/gateone/gateone/gateone-avahi.service
rename to meta-python/recipes-connectivity/gateone/gateone/gateone-avahi.service
diff --git a/meta-oe/recipes-connectivity/gateone/gateone/gateone-init b/meta-python/recipes-connectivity/gateone/gateone/gateone-init
similarity index 100%
rename from meta-oe/recipes-connectivity/gateone/gateone/gateone-init
rename to meta-python/recipes-connectivity/gateone/gateone/gateone-init
diff --git a/meta-oe/recipes-connectivity/gateone/gateone/gateone.service b/meta-python/recipes-connectivity/gateone/gateone/gateone.service
similarity index 100%
rename from meta-oe/recipes-connectivity/gateone/gateone/gateone.service
rename to meta-python/recipes-connectivity/gateone/gateone/gateone.service
diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/gateone/gateone_git.bb
rename to meta-python/recipes-connectivity/gateone/gateone_git.bb
-- 
1.9.1


