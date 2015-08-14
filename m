Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9473172A78
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 20:49:23 +0000 (UTC)
Received: by ykfw73 with SMTP id w73so25794041ykf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 13:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xJwzvsuqzfCGOVtso7rNAFs3I4kCXAAhEvox/MPjFK0=;
	b=CkvmIFYhUuMFbXFOAFgkpxK4xnHHuPENECixMNBEwBTDZ4Qg6+v4bn8m+cCLmuNnRU
	K4cJ0TN5D1AaDSs+aby0tl8Ybo5x12XZbQSJroYhQS5ngW3Ln5Xa4kSVn5B11YadTAjL
	oYX7dTjpCtdAiwhx4k+cH6oHt5coocKEGUzpAZU2pZTCDIaUiJR1h1JdvPhvBZSFlHUR
	Z/2p1BAOGmLdf8KFJXzpdmAzwlEwJytyBYyYgdEY+zm7+DxhF59UruTXIpJi27wAodW/
	j8BXgMjDOBOX2fgVyqx13CEOGn2qvrIYYh31lkiUUNrSgBULYr0+RFGvNrJyUH7GCxit
	N/CQ==
X-Received: by 10.170.134.214 with SMTP id a205mr35846676ykc.89.1439585364162; 
	Fri, 14 Aug 2015 13:49:24 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	p20sm6258974ywe.42.2015.08.14.13.49.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Aug 2015 13:49:23 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:49:01 -0700
Message-Id: <1439585341-3551-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-perl][PATCH v2 ] librole-tiny-perl: add 2.000001 recipe
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
X-List-Received-Date: Fri, 14 Aug 2015 20:49:25 -0000

Changes since v1:
  fix URL (Thank you, Andreas Baak)

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
index 9a8ec2e..48360c6 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "\"Role::Tiny\" is a minimalist role composition tool."
 
 SECTION = "libs"
 
-HOMEPAGE = "https://metacpan.org/pod/Role-Tiny"
+HOMEPAGE = "https://metacpan.org/pod/Role::Tiny"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=172;endline=209;md5=26df7e7c20551fb1906e2286624f0b71"
-- 
2.1.0


