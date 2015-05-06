Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6700C73D90
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 16:11:26 +0000 (UTC)
Received: by wizk4 with SMTP id k4so208752551wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=D4C5b4w2H/2FtD1lgmz73+mIgh2zzRyzem1sy1eEenE=;
	b=QZMnEpfv1OmfJJkyV2X/F+qJK8Dm6cYCsO/3VE5DUEyVjSw+8KEINsteA0n7/c3d1z
	ECwWExxIzP01D3KZZKKK0O7LHDhd5V1xjNDdEpYFn8tUoRDinx7wvDRJbyvales0JLyb
	nzmxpnZGiS9ahNmXQslP0nK8YxQKr+kBnXmVjPaoVq1TxfrS5BKp3uaPGkWKeM6zlu5Y
	g/4iybBDZmOe/6MQ+VXjputP5Siz9U53M5l7m9S/6waFg7xhRRAWEAgBfLf3xv+A66RA
	tFQAWMwp0okIvaPJt9vKjy1D/N1v8eSdOSOGq0Zxe93abKPBKeor8r7zcLA6/LyRv2Rc
	N3aA==
X-Received: by 10.180.208.42 with SMTP id mb10mr6182854wic.80.1430928687241;
	Wed, 06 May 2015 09:11:27 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id k9sm2846567wia.6.2015.05.06.09.11.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:11:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 18:10:44 +0200
Message-Id: <1430928646-2007-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] packagegroup-xfce-extended: add xfce4-smartbookmark-plugin
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
X-List-Received-Date: Wed, 06 May 2015 16:11:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 28e452a..db3a2ce 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -44,6 +44,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-whiskermenu-plugin \
     xfce4-mailwatch-plugin \
     xfce4-kbdleds-plugin \
+    xfce4-smartbookmark-plugin \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
1.9.3


