Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbvLn-0007PL-GH
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 16:39:32 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 147D44A028;
	Fri, 23 Nov 2012 16:25:33 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Nov 2012 16:24:46 +0100
Message-Id: <1353684287-19180-9-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1353684287-19180-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 8/9] obexd: move to meta-gnome due to libical dependency
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
X-List-Received-Date: Fri, 23 Nov 2012 15:39:32 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 {meta-oe => meta-gnome}/recipes-connectivity/obex/obexd_0.44.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-gnome}/recipes-connectivity/obex/obexd_0.44.bb (100%)

diff --git a/meta-oe/recipes-connectivity/obex/obexd_0.44.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/obex/obexd_0.44.bb
rename to meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
-- 
1.8.0



