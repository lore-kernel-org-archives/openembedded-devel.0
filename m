Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 063F265F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:36 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id cc10so1044748wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=eDTqDTUxWnjdDMNVuYxJlM3VozJ5jjAcMuFNUNanbMg=;
	b=xpiYp9QZYzotRfu2M5nCp4V7rjJAJmJrUwZEUb/W+B1JZOwhGfFIBmgQv/xnLzX3rU
	wteJn1goOL4HTmmNlsutk891988rzLImbq56mJVAaHd6iKCr7xA76nZtqGIp6IuadR4p
	yEjitwiYSvFCvfgWV5qXZx0oP84gyoq4dP2RmA6wfUgI5MkdnoIXGpyCWku/QIwvewEV
	FZL+x2URF7I6lOqKhM+cr6ud8bLgnDY9/qOjDNSBbuIMPQbTH0MuM4Fdmuih8zUGkevu
	TcCiOuqn58ZHkeFE2dUsNS5NU1CljJsJp68oQVWlX6BQF1pIK9mRj8X8t0VZDH0qcrwx
	JvXQ==
X-Received: by 10.180.149.244 with SMTP id ud20mr10484264wib.55.1412151577608; 
	Wed, 01 Oct 2014 01:19:37 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:14 +0200
Message-Id: <1412151555-19865-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 14/15] packagegroup-xfce-extended: add xfce4-whiskermenu-plugin
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 2c47384..32f220c 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -40,6 +40,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-closebutton-plugin \
     xfce4-equake-plugin \
     xfce4-notes-plugin \
+    xfce4-whiskermenu-plugin \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
1.8.3.1


