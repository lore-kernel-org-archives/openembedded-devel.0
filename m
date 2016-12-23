Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B406B775EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 04:53:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14203192"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Dec 2016 12:53:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D1C7F477B1E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 12:53:48 +0800 (CST)
Received: from localhost.localdomain (10.167.226.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 23 Dec 2016 12:53:49 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Dec 2016 12:42:46 +0800
Message-ID: <1482468166-33076-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.93]
X-yoursite-MailScanner-ID: D1C7F477B1E0.A16B7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [oe-jethro] [meta-xfce][PATCH] imsettings: move to correct directory
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
X-List-Received-Date: Fri, 23 Dec 2016 04:53:53 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../imsettings/{ => imsettings}/gtk-is-required-by-notify.patch           | 0
 .../multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch        | 0
 meta-xfce/recipes-extended/{ => imsettings}/imsettings_1.6.8.bb           | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-xfce/recipes-extended/imsettings/{ => imsettings}/gtk-is-required-by-notify.patch (100%)
 rename meta-xfce/recipes-extended/imsettings/{ => imsettings}/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch (100%)
 rename meta-xfce/recipes-extended/{ => imsettings}/imsettings_1.6.8.bb (100%)

diff --git a/meta-xfce/recipes-extended/imsettings/gtk-is-required-by-notify.patch b/meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
similarity index 100%
rename from meta-xfce/recipes-extended/imsettings/gtk-is-required-by-notify.patch
rename to meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
diff --git a/meta-xfce/recipes-extended/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
similarity index 100%
rename from meta-xfce/recipes-extended/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
rename to meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
diff --git a/meta-xfce/recipes-extended/imsettings_1.6.8.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.6.8.bb
similarity index 100%
rename from meta-xfce/recipes-extended/imsettings_1.6.8.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.6.8.bb
-- 
1.8.4.2




