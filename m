Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 077357881E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 21:00:32 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id s10so6572703wra.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9LJqDzVaiY5G7h4uYiju+Vamfqee9yg4gz8kH99YS+k=;
	b=aCJK+yYjbGs30JEbj+7YHu3f8qwySuyR++63BNIsrbJoKl7uzW1viaIZFoy0LsBbrU
	f9ikmdh66BemYJYW2hRIWhs5OYItKSq7aWSeR8RdWW8jGC8jM+OgVtA6Rn2qUvTiQ5Lv
	kxLbjq/p/M/gwqW7FstOv/3tke+/hAl5XfNT+iRSw/0Wi4qlVOE37bNRrNZwpAGGsBr8
	NCBkFJ0k9uPUKjJC9GHjiqwiUaHzV45br+Fayekpmv72LgLftXimCCZouMo5UwVb1WkL
	i0YMLycZjSLjdHUklH0U4BF7ixr3G0H+dKC04f2yrUloi8FuBjBkNID2eOFw9d/UR5xp
	HLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9LJqDzVaiY5G7h4uYiju+Vamfqee9yg4gz8kH99YS+k=;
	b=VpBgHPaEBGFG7zFpPe/dzXmYUqKoBMH1co6cUJRsWwmREoLDPTlKh0qoFByrU320Ji
	fHe3IaJKh+g7cuSSIiNL7oovpDHbpLac5NpJKWe9BiC5kywNyNrC8EZkh2JZYIgFJfOr
	C8iDnr6QEfBFkdPEPrxNTl75z9M9CE5DFWN/n93ynCkhpzFq3VzpLiJJpfC3FdmLp8bi
	aBplvY5BjLr/hoI1cHLdZYBehHWYWSBAM5en0YR1kAvUOFdKoysU0XcERtPHDKVsallx
	BpM1I6K4mXsyNc55QRFcFRPNKNyuq9I5QrAMaGVGA/5bvP56IaE1vXsCw/T7/50uVjz1
	hx1w==
X-Gm-Message-State: AElRT7G1DfXx+pxhwW/d7xmasYzXzPAdT/7HhPn8jfQ4JUpjvjIOp9XV
	1kFIP+SeF6TemBbG1HLYLEPe6Q==
X-Google-Smtp-Source: AG47ELuiG3KOpvkpzsx3ufLNggnnlRA5S7u68WCJrkjU7WJ44KgAeywRotNni/PDrQtZfUHiaVY1jw==
X-Received: by 10.223.128.209 with SMTP id 75mr17211236wrl.108.1521666033486; 
	Wed, 21 Mar 2018 14:00:33 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC111801E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:1180:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	q21sm5916339wmd.12.2018.03.21.14.00.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 14:00:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 22:00:18 +0100
Message-Id: <20180321210022.4682-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 1/5] libxfce4ui: refresh 0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch
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
X-List-Received-Date: Wed, 21 Mar 2018 21:00:33 -0000
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


