Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RFr04-0003nR-Q6
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 19:29:21 +0200
Received: by eyd9 with SMTP id 9so3120211eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 10:23:31 -0700 (PDT)
Received: by 10.213.20.4 with SMTP id d4mr863359ebb.122.1318872211437;
	Mon, 17 Oct 2011 10:23:31 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id z58sm765633eea.3.2011.10.17.10.23.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 10:23:30 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 19:23:20 +0200
Message-Id: <1318872201-26433-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1318872201-26433-2-git-send-email-koen@dominion.thruhere.net>
References: <1318872201-26433-1-git-send-email-koen@dominion.thruhere.net>
	<1318872201-26433-2-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-xfce 3/4] xfce4-cpufreq-plugin: initial add
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
X-List-Received-Date: Mon, 17 Oct 2011 17:29:23 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../cpufreq/xfce4-cpufreq-plugin_1.0.0.bb          |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
new file mode 100644
index 0000000..484f794
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
@@ -0,0 +1,5 @@
+inherit xfce-panel-plugin
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
+
-- 
1.6.6.1



