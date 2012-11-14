Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TYcLO-0004Lp-Px
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Nov 2012 13:45:26 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 056A1D2218;
	Wed, 14 Nov 2012 13:31:38 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Nov 2012 13:31:33 +0100
Message-Id: <1352896293-25112-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] devilspie2: move to meta-gnome (libwnck is there)
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
X-List-Received-Date: Wed, 14 Nov 2012 12:45:26 -0000

---
 .../recipes-gnome}/devilspie/devilspie2_0.24.bb                           | 0
 .../recipes-gnome}/devilspie/files/default.lua                            | 0
 .../recipes-gnome}/devilspie/files/devilspie2.desktop                     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe/recipes-graphics => meta-gnome/recipes-gnome}/devilspie/devilspie2_0.24.bb (100%)
 rename {meta-oe/recipes-graphics => meta-gnome/recipes-gnome}/devilspie/files/default.lua (100%)
 rename {meta-oe/recipes-graphics => meta-gnome/recipes-gnome}/devilspie/files/devilspie2.desktop (100%)

diff --git a/meta-oe/recipes-graphics/devilspie/devilspie2_0.24.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
similarity index 100%
rename from meta-oe/recipes-graphics/devilspie/devilspie2_0.24.bb
rename to meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb
diff --git a/meta-oe/recipes-graphics/devilspie/files/default.lua b/meta-gnome/recipes-gnome/devilspie/files/default.lua
similarity index 100%
rename from meta-oe/recipes-graphics/devilspie/files/default.lua
rename to meta-gnome/recipes-gnome/devilspie/files/default.lua
diff --git a/meta-oe/recipes-graphics/devilspie/files/devilspie2.desktop b/meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop
similarity index 100%
rename from meta-oe/recipes-graphics/devilspie/files/devilspie2.desktop
rename to meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop
-- 
1.8.0



