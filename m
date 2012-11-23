Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbvLl-0007PL-Dk
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:39:30 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B92934A028;
	Fri, 23 Nov 2012 16:25:31 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2012 16:24:44 +0100
Message-Id: <1353684287-19180-7-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 6/9] fbreader: move to meta-gpe due to libgpewidget dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 15:39:30 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../recipes-support/fbreader/fbreader-0.12.10/Makefile.patch              | 0
 .../recipes-support/fbreader/fbreader-0.12.10/gcc45.patch                 | 0
 {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_0.12.10.bb        | 0
 {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_git.bb            | 0
 .../files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_0.12.10.bb (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_git.bb (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch (100%)

diff --git a/meta-oe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
similarity index 100%
rename from meta-oe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
rename to meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
diff --git a/meta-oe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
similarity index 100%
rename from meta-oe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
rename to meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
diff --git a/meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
similarity index 100%
rename from meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb
rename to meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
diff --git a/meta-oe/recipes-support/fbreader/fbreader_git.bb b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
similarity index 100%
rename from meta-oe/recipes-support/fbreader/fbreader_git.bb
rename to meta-gpe/recipes-support/fbreader/fbreader_git.bb
diff --git a/meta-oe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch b/meta-gpe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
similarity index 100%
rename from meta-oe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
rename to meta-gpe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
-- 
1.8.0



