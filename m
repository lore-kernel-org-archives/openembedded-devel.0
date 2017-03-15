Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 464D271A8C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 08:44:03 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id j90so3874195lfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4j0DEA2EugG0bWtEV1454mUKYxP/56S2CoRkc+bHUH8=;
	b=Sg60tkplYvW0VO3IHXdWmR0aYu/yXeVJJPG+2RtNlLmqb9+DqYgaGuf+D5ZOpTny9t
	cik5QUsrWBUchBZPKeJQA90l5f+W+qM0Pp6QN6Kotvs+KJBFd7bygql0NcwM0q6IvWrW
	94aunVbgKaiecHzBID9hIreo7U09Qrh92rDe82E6rW/YGNOZ7mIlyO0h81BfNNzoutlj
	ex4d/IDfhXx5fSM2G9lLEqUcyg8K7njhGaERJwYWPwooPmcOs35XSHL3nPNiALAOLv6D
	+xrhJI903NdIzsSKblI41+5tljtnKKfCwLijr/T6uq8VnJm3ohcCDMZr3lzgi8oNg881
	XYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4j0DEA2EugG0bWtEV1454mUKYxP/56S2CoRkc+bHUH8=;
	b=ionDgHjpH9n78+6S6x5uaEWaWx8kS63lW8oukrBwQOzCYE7IUMgC8CnYUfnAlsIwee
	04uLZ1auDbqi5EPBOJgPsOexE1wVDdl8tjjryc4M4xQqgkbFwrQptYrkhveXJJ8RNJ9x
	HgYlWtNJnCoJNi8MuLL1GHa8FZS7yHQghq1jigz9o12/9kAP1VwtHXSvYMty9/G2jgeT
	rHCLefJnoqh5z9R3EhlLsPblAKYw1LWEbJVp1unft1hbHoUde2JqqvFVVw/ER7FnZhm8
	ZemtTzGSTc0QH7EgTB0GzdLZn+LgR/b/95I1oyHzVBHbtROODNkZG1mYOH5VKtIf2dAC
	IMPQ==
X-Gm-Message-State: AFeK/H3+pnp7MpyE5jGEwyF9pitEJ84JKa+iR5vTijJRBRb/S4evtzSjDjOFsDDKhtJd9j8K
X-Received: by 10.46.22.66 with SMTP id 2mr679679ljw.120.1489567444511;
	Wed, 15 Mar 2017 01:44:04 -0700 (PDT)
Received: from localhost.localdomain (c-5eeaaacc-74736162.cust.telenor.se.
	[94.234.170.204])
	by smtp.gmail.com with ESMTPSA id h9sm213944ljb.51.2017.03.15.01.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 01:44:03 -0700 (PDT)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Mar 2017 09:43:49 +0100
Message-Id: <20170315084349.7927-2-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH] qtwebengine: add commercial license
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
X-List-Received-Date: Wed, 15 Mar 2017 08:44:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 8e60d72..a4ee055 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "QtWebEngine combines the power of Chromium and Qt"
 
 # Read http://blog.qt.io/blog/2016/01/13/new-agreement-with-the-kde-free-qt-foundation/
-LICENSE = "LGPL-3.0 & BSD & GPL-3.0 & The-Qt-Company-GPL-Exception-1.0"
+LICENSE = "BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://src/core/browser_context_qt.cpp;md5=b5193b7d68699260f3b40b201365c8d2;beginline=1;endline=38 \
     file://src/3rdparty/chromium/LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d \
-- 
2.9.3


