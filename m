Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id AFC296E397
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:34:21 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d17so1035618eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rqNsnmTE+0luTUnhhPJ6dhJR0fDAe9IB+fUK/RCyBWY=;
	b=aOiMk8/5VTL/t8N5zu5UApjbAo0GPgsggcelRayN4NkM6giPZckyo8wmxqtafWg1U5
	R1//P0tDZ203+vQIWU2nEg2VbyXht3dk+tGaUHP+ZZvkF6vuAfckm9HrdW5zAaa6CvoX
	Ef4Mg4npAm9KjthXoFoINuLgE3B5WsKUk3IzYzEUkWXFjym9PaeFUdPWmMI4jnoLcdPs
	l5nANQc5buwzY+m7/D7giH2hoL9soES7M+aUNjojrFj7du0QQl/Wr4d2a82A9MSNV0er
	lWNy2W7m3P1Dw9IxH4YFfWL+jT5ZYwOl38SsGEyXbWc+ThXQusYXH2dKMrfw7WxbghQ3
	RMUA==
X-Received: by 10.15.51.13 with SMTP id m13mr4653066eew.103.1389807262048;
	Wed, 15 Jan 2014 09:34:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm11880069een.13.2014.01.15.09.34.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 09:34:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 18:34:32 +0100
Message-Id: <1389807272-27603-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [meta-systemd][PATCH] dropbear: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Wed, 15 Jan 2014 17:34:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../dropbear/{dropbear_2013.60.bbappend => dropbear_%.bbappend}           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-core/dropbear/{dropbear_2013.60.bbappend => dropbear_%.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-core/dropbear/dropbear_2013.60.bbappend b/meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-core/dropbear/dropbear_2013.60.bbappend
rename to meta-systemd/oe-core/recipes-core/dropbear/dropbear_%.bbappend
-- 
1.8.5.2


