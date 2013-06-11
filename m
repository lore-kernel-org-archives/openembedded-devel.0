Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 361DA6A9C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:19 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so2276200eaf.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=tjrcrIipFNpp/ydsITL+acqcjmkY4Ibii6y/pDxoUAs=;
	b=FcIeNMw3UsbVdMh/ZObLSjCDjpZ0RE/jehm8KuNeh1FsPIe8io/VbUxDFfNtAZOhPD
	wznihVhJyI6e977Z8BMUilcZVwTfcU2tKokxqqV0WxeIBUaCnaEU5O3dWEp14dsA1Rm4
	tfXQnxUxChMCPkL3arf1100v7FfYSte1CKeU7Mqfu2DOc6EQHvIkARXbZfMJtpMlyxpA
	/GXJV5fREb2cPWTuPVS8ZbMzxEg8PXn2p7M4flpuKmau6ADHnSTxY4xPq9q2gg34ga7/
	8UrH7kAAT0+IkewP79C5tMwtmlpy82jdC0gKcH0o58zWhRpfC7aqX0Uz4j2pb2xeL7co
	ecEg==
X-Received: by 10.15.55.132 with SMTP id v4mr14662633eew.19.1370929039879;
	Mon, 10 Jun 2013 22:37:19 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:24 +0200
Message-Id: <1370928876-14423-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 03/15] tumbler: update to 0.1.29
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{tumbler_0.1.27.bb => tumbler_0.1.29.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.27.bb => tumbler_0.1.29.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
index 402762c..fd28e84 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
@@ -6,8 +6,8 @@ DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl"
 
 inherit xfce
 
-SRC_URI[md5sum] = "3fa90528c3e7e77d8ace4bffcf0a2748"
-SRC_URI[sha256sum] = "4c60b3b92877257fcc54d18acbbe4ad73c84a7ff7608a430ad5a05b452923869"
+SRC_URI[md5sum] = "f844215c5e3918eae58abdd85f146780"
+SRC_URI[sha256sum] = "c3bac4ee609e22be6c7f01a4fdf6086bc6b57940d82f99570a2d9d547a32fc93"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
1.7.6.5


