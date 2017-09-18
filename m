Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B8CB87828D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 05:55:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,411,1500912000"; d="scan'208";a="26730148"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Sep 2017 13:54:56 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D0B5746BA6A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:54:55 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 18 Sep 2017 13:54:58 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Sep 2017 13:54:46 +0800
Message-ID: <1505714086-40749-6-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505714086-40749-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505714086-40749-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: D0B5746BA6A3.A7A2E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5][PATCH] qtxmlpatterns: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 18 Sep 2017 05:55:15 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 recipes-qt/qt5/qtxmlpatterns_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 7c18079..f4f46f1 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -2,6 +2,7 @@ require qt5.inc
 require qt5-git.inc
 require qt5-ptest.inc
 
+HOMEPAGE = "http://www.qt.io"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-- 
2.7.4




