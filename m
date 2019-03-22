Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1933C7D01D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:51 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d17so1682608wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mvRPkjqDNt0ZnzJybt6v0OB4/uMxmaprMSHaF+Z7s6I=;
	b=diS7GX/XbWhhwoJ7hHPVa9Skr4GAOIat++2TrJcbhX8OkDttMCi5ljYBT9JvlDFGo6
	s5i1LjByfxB8UuAN6NT7Pjm8NCIGOOOwIVypg96HfmuK7LxtsEEoFn+UVvvIo6HdQFPb
	/CzHNOeyAHHLBBr/hO5gDuGGO0RMUUg8SJloq24reGPtERY+V3jFQSi0KSskFTU5B6Q3
	q9XKRmbTVSkpcMJt2b/rlllatCvW099fuWJUCbaBDx1eAkCMAgVfjnccIIZ7233zjsEf
	mPxP3/hHeg7Dwu9HJzD1dNr9xQ38QUuHTlXCpNSvD8lt9/x5WzJWdam/VXnOlZ/xKv7j
	4TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mvRPkjqDNt0ZnzJybt6v0OB4/uMxmaprMSHaF+Z7s6I=;
	b=PNnHW85MmfCq2DKtSzaWg2Mk5k3kBdvzBSP98hErGyF6QZK8GpdScENsEO1NO/V0Gu
	zy4zVRcMKp0NOMGpUMZACFyqGuYuvedP92UdLBWAG/4rzQyqjtntkS5ZMoII8CuP2wyn
	k9Jw98LpebgyNBoeGZ6SPLjesBMD9B1d/aBbW5uy5m4SvBVXckKk1Fl+Hf15pgM4hGMt
	Wdrzz60Hlwixl5jaZK/qKz9ORYh81COIs1tAEJ2EfGnEUjb8qWK6xUrtYNWdJqU83iFy
	s00DseVixhcns6ts85RakSym2kQcfPcad7bNDnNV/kk7F/2dew7cqrHg43w4bLaH9DsD
	C5BA==
X-Gm-Message-State: APjAAAUHAVJL0NKu6sg6g/sENGvG/Beg9Fhz7T4gqpmLvG+DPzZf7l3I
	R3plvAZqA51xLnhydJIYK0BPmkjg
X-Google-Smtp-Source: APXvYqzNPykcAWpO/yerjCBlpYDx6qnTGWPbQiPFYd9lit3AeP2iCzlVPUOo+7q/m8zPNasYortg3A==
X-Received: by 2002:a5d:43c9:: with SMTP id v9mr5756680wrr.269.1553250112732; 
	Fri, 22 Mar 2019 03:21:52 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:29 +0100
Message-Id: <20190322102129.5067-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] physfs: Fix license checksum
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Copyright year was changed

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb b/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
index 8dc30bd5f..a0033fab5 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_3.0.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "PhysicsFS is a library to provide abstract access to various archives"
 HOMEAPAGE = "http://icculus.org/physfs"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2668e2fb051c3e564198e146a9a2d9f0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=96801882d1120239dcafbf888e821a6e"
 DEPENDS = "readline zlib"
 
 inherit cmake
-- 
2.20.1


