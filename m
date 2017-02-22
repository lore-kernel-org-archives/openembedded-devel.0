Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3A85D730C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 10:25:18 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id l12so3664666lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 02:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4j0DEA2EugG0bWtEV1454mUKYxP/56S2CoRkc+bHUH8=;
	b=y61HORWovJOOf3oBMfHSNZaBn4SleCdoDIDk9elo7dXfTivLlr7q8BeXXwlrT5C8yD
	5cicbD9kfDu46IRMc3Q2kn9KiVO1fvfDFFv7YOw6a+QpercZ4rufigA8KyacvOFZpc+J
	9ysVM3F/RPxGK0KrZAdDXTKy/LtB8sMTfFhfPFD+g67LUSQT28rIJPXnHwQCTA/BbBPH
	l4QtwmAgKOvr2BIXj/SerU9AaBKE/MTlG6X3JGXjtrOW3LRO5zp4grLI/2fa2uWo83MN
	7vWxBiR/GG5kHVD6ARBVHeaLeyJ8vcxz/zNsA80Mppca9ZEGLYYVc9XLucr4odospKT4
	uMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4j0DEA2EugG0bWtEV1454mUKYxP/56S2CoRkc+bHUH8=;
	b=WU6FtKa8+JD4HBCESlXFtAKbDCu53e6dhV9G1aj7Y10ZkZXAIUt4vIt1guQtnvyQrL
	rqF4FLxYmzlRjG0SBbxq7zfYnylHWak1dA9UGp8GVzmM0os/eF2phDVQ3XLzImogp7To
	ypg2s9PATpEQ1KCzqCAwnD9DJMu79uy6E0e1xxK6ogef7q4nEwmZBL9DAc9l08bYKt3E
	/q8U6D52bM6ZJscwEpO1hWYxdFYnSLKyUxNfTPH/0mH1UGom7REWxhjt581EBSLBfaIO
	x8W+0SQ+46sdvHF+tvbnogKhHEqBCheFCdA891fz79NImrmdkfa72ASxsOIO/r09VFNh
	Mq4Q==
X-Gm-Message-State: AMke39nOvd0aiJgc/cAB1NnF7zFDtGeQTQiejyuw50AdeNFoZVoH0n2d6SGdPfgnP3RDt4vg
X-Received: by 10.46.75.9 with SMTP id y9mr8161701lja.62.1487759118911;
	Wed, 22 Feb 2017 02:25:18 -0800 (PST)
Received: from gordanmarkus-XPS13.IHU.local
	(static-212-247-53-108.cust.tele2.se. [212.247.53.108])
	by smtp.gmail.com with ESMTPSA id r18sm281051lff.4.2017.02.22.02.25.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 02:25:17 -0800 (PST)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 11:25:10 +0100
Message-Id: <20170222102510.13059-2-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH] qtwebengine: add commercial licence
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
X-List-Received-Date: Wed, 22 Feb 2017 10:25:18 -0000
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


