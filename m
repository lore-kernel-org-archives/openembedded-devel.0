Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 332BE746FA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:11 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id c24so8068642wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9LJqDzVaiY5G7h4uYiju+Vamfqee9yg4gz8kH99YS+k=;
	b=PrtnEtyABiNVm6EVDgSvr4FBixXBfWEj7FR5ElzV14m/nBnb2pugelhDBpTR9oQNPQ
	tePjEj341u7dMHvYvnMSyN3XyDk0hiI/FoJgYK5/GnWNvfVRjpXsdC4u4xC9vv6mCQMQ
	BYOsPMiNVcXn9OuAKzmZ7rKWaNKDJ+QXYXcVvEf6eLJ+whWsE7aAUN398syP4bWT5TnR
	jQjpKtV92TbJNLRchntt3dFnZdGTMzpHl9FWH2XBPBb6r4jJE+/6ibrvQ4uGuwxd7BWu
	GmPmP1qVjYwpH/4fox6x74hOM0M9P60yXIKb4qiT1VYRu+bqCZI/Xneu2xcN1lflQxBT
	/eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9LJqDzVaiY5G7h4uYiju+Vamfqee9yg4gz8kH99YS+k=;
	b=YYXy/+GANrVxN59cgEx0DfL0Zl938oBoZujuoypWrhzMN/IOn+nc1hGCjfsiyhvErZ
	seWCIdo7U3Ro3BYAs7U08ZgHMVtl9eOvAkw/DDI4EULJDMR4UFoWiYGZyXSIWdxGZXVx
	REQ10icqgeG2eT/G7VqjaHol++KAsFPX0iB4onX9WMg9Alf+Yjt4SfBS3K+44+ZEvrY2
	rczhIceuyiDgbq14ZWXI6lIKxCNIjVfBcJQ7RaGOyOv6UcxcH1isVGH5KWUC/OXSDvdw
	BzOg8srSU/raYezD9l0P8U/SddQ4lThZUoqQ0n60BN8qSwYzdEyB8MpMpNWceWl1BA4G
	EA8g==
X-Gm-Message-State: AElRT7E0/IN5KBIoGm7l4a8ebZepmtStHH28iMoHXL6B+mGtL7bHSNFn
	BULAQ6wkD1bYarTyz/hRl1NrAw==
X-Google-Smtp-Source: AIpwx4+vQoY4jSupFdMPj/5iT19BbYZ5Eb4pe0Wuooo0gyEGq1XCB1VXzBkvgfQL/hE/N/FuJIU/Jw==
X-Received: by 10.223.150.111 with SMTP id c44mr10157464wra.90.1522416732527; 
	Fri, 30 Mar 2018 06:32:12 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:19 +0200
Message-Id: <20180330133151.25882-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/39] libxfce4ui: refresh 0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch b/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
index b8c917883..6d107b1b6 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
+++ b/meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
@@ -9,6 +9,7 @@ Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Pending
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
 ---
  libxfce4kbd-private/xfce4-keyboard-shortcuts.xml |    4 ++++
  1 files changed, 4 insertions(+), 0 deletions(-)
@@ -17,8 +18,8 @@ diff --git a/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml b/libxfce4kbd-priv
 index 723a10d..e6502f3 100644
 --- a/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml
 +++ b/libxfce4kbd-private/xfce4-keyboard-shortcuts.xml
-@@ -66,4 +66,8 @@
-       <property name="&lt;Control&gt;F12" type="string" value="workspace_12_key"/>
+@@ -75,4 +75,8 @@
+       <property name="&lt;Primary&gt;F12" type="string" value="workspace_12_key"/>
      </property>
    </property>
 +  <property name="providers" type="array">
-- 
2.14.3


