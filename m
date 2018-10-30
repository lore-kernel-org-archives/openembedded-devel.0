Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A88779C84
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:50:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U1oWP2008237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:50:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 29 Oct 2018 18:50:25 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 09:07:47 +0800
Message-ID: <20181030010748.3266-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181030010748.3266-1-kai.kang@windriver.com>
References: <20181030010748.3266-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 3/4] xfce4-notifyd: 0.4.2 -> 0.4.3
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
X-List-Received-Date: Tue, 30 Oct 2018 01:50:31 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-notifyd_0.4.2.bb => xfce4-notifyd_0.4.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.4.2.bb => xfce4-notifyd_0.4.3.bb} (84%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.3.bb
similarity index 84%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.3.bb
index 15ec51b2b..d7719051b 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.3.bb
@@ -15,8 +15,8 @@ DEPENDS = " \
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "ecb930ef6ae6e1f310a5afe5f638eff8"
-SRC_URI[sha256sum] = "f6f28af47fdfb41db84bd003f0d76f5f4abf2137d1e27e9d378f063bb8f82356"
+SRC_URI[md5sum] = "4887c62dfcb4c3e4f45c9acfb3def515"
+SRC_URI[sha256sum] = "293dda084cfca4887ae740e2725fdfc64412bc10eac7a55a924eb14482dceac0"
 
 # Avoid trouble with other desktops e.g KDE which also ships dbus service named
 # org.freedesktop.Notifications
-- 
2.18.0


