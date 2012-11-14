Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TYcQn-0004ee-Hr
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Nov 2012 13:51:01 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id AC3FED22B7;
	Wed, 14 Nov 2012 13:37:13 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Nov 2012 13:36:58 +0100
Message-Id: <1352896618-26003-3-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1352896618-26003-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1352896618-26003-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 10/10] obex: move to meta-gnome due to libical
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
X-List-Received-Date: Wed, 14 Nov 2012 12:51:01 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../recipes-connectivity/obex/obex-data-server_0.4.6.bb                   | 0
 {meta-oe => meta-gnome}/recipes-connectivity/obex/obexd_0.44.bb           | 0
 .../recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch       | 0
 .../obex/openobex-1.5/libusb_crosscompile_check.patch                     | 0
 {meta-oe => meta-gnome}/recipes-connectivity/obex/openobex_1.5.bb         | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-gnome}/recipes-connectivity/obex/obex-data-server_0.4.6.bb (100%)
 rename {meta-oe => meta-gnome}/recipes-connectivity/obex/obexd_0.44.bb (100%)
 rename {meta-oe => meta-gnome}/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-connectivity/obex/openobex_1.5.bb (100%)

diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-gnome/recipes-connectivity/obex/obex-data-server_0.4.6.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
rename to meta-gnome/recipes-connectivity/obex/obex-data-server_0.4.6.bb
diff --git a/meta-oe/recipes-connectivity/obex/obexd_0.44.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/obex/obexd_0.44.bb
rename to meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch b/meta-gnome/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
rename to meta-gnome/recipes-connectivity/obex/openobex-1.5/disable-cable-test.patch
diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch b/meta-gnome/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch
rename to meta-gnome/recipes-connectivity/obex/openobex-1.5/libusb_crosscompile_check.patch
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-gnome/recipes-connectivity/obex/openobex_1.5.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/obex/openobex_1.5.bb
rename to meta-gnome/recipes-connectivity/obex/openobex_1.5.bb
-- 
1.8.0



