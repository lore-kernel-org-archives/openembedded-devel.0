Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tj6N2-0003AV-IU
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 11:50:30 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 65487D22CD;
	Thu, 13 Dec 2012 11:36:08 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 11:35:29 +0100
Message-Id: <1355394929-25182-8-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 7/7] florence: move to meta-gnome due to libnotify
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
X-List-Received-Date: Thu, 13 Dec 2012 10:50:31 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../recipes-support/florence/files/0001-Fix-glib-includes.patch           | 0
 {meta-oe => meta-gnome}/recipes-support/florence/florence_0.5.1.bb        | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-gnome}/recipes-support/florence/files/0001-Fix-glib-includes.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-support/florence/florence_0.5.1.bb (100%)

diff --git a/meta-oe/recipes-support/florence/files/0001-Fix-glib-includes.patch b/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
similarity index 100%
rename from meta-oe/recipes-support/florence/files/0001-Fix-glib-includes.patch
rename to meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
diff --git a/meta-oe/recipes-support/florence/florence_0.5.1.bb b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
similarity index 100%
rename from meta-oe/recipes-support/florence/florence_0.5.1.bb
rename to meta-gnome/recipes-support/florence/florence_0.5.1.bb
-- 
1.8.0



