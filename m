Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5630865DBB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 16:44:43 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id l4so1402877lbv.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gUpxZyN7+rYWyoWWVGpufmQXKMl7KsjMNxHK/B3CxQs=;
	b=kcC/yowDgxEHDKeROsQLBnMch2hZZLhcAvDEMubN42S/l4zl1Cxkvch6u7tZDNKCID
	DTekeuZejx9sNGK2M76maRVsO1SUCHLafjLnbAv/Txj28zBg+rCgGpf+uPanU+CuJiQd
	J63QVN2RNFMwAx254erAYj4NfMyRbtEY64wKHduzY3lfnYeYdvmv7xLiaZj6bJX+w3XO
	5EXATWIUQ5NI+41e7QjegaXYE0anAZRgZb/vuWrBFdjxvdDcWSdUtN08msSA2JH2PZsP
	UpMqk01C9/HgYaO49gNZ1HP6szhjnSly2XxZHPxVNv2/W/tPwPHIymSGp5o026u7Um/M
	n6+Q==
X-Received: by 10.152.28.194 with SMTP id d2mr3673158lah.25.1398876282782;
	Wed, 30 Apr 2014 09:44:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f9sm17032164laa.8.2014.04.30.09.44.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 09:44:41 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 18:44:55 +0200
Message-Id: <1398876295-19178-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-systemd][PATCH] lighttpd: rename .bbappend to match with any version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Apr 2014 16:44:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.33.bbappend => lighttpd_1.4.35.bbappend}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-extended/lighttpd/{lighttpd_1.4.33.bbappend => lighttpd_1.4.35.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.33.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.33.bbappend
rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend
-- 
1.9.1


