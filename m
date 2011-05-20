Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QNVLW-0005Y6-4V
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 21:26:50 +0200
Received: by ywg8 with SMTP id 8so1546948ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=cmJvyeltRFEcF3p5+pKfgJTKLBZ1Fl/6JvyZ/cwg/dQ=;
	b=RaPw5iETeKjDBrXsCoBMXBQ3fnbUTFCT0Zja4H1HwuQnpBR1nf7XfpKNysu8PBNrno
	5Qt8ljVTr4jAWMnQjojwt1MeGLGS8p2OC1z55C2TVvDTZpm/IxMTHZ2rIyGtIEnwo/Ia
	6XK1rg3IpRkk4uZE4RVRGryxRVsbTb5DrruNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Bj869lhcJbQse/JemBZTUcZ9wa+ybQUrc0NtAy9jGrzgCD7jrBaJeGFCVjEdUsjoo7
	Hyz6UuPKeOOBZQpvtRlWys784Q3grPTjXPPCmamAf33zLmyX8Bx28n+N4NFdvlwPhYaP
	ib0hE8etIBUB3bSisx47siBgEor6zWnpGU3eQ=
Received: by 10.236.19.74 with SMTP id m50mr4903021yhm.447.1305919428707;
	Fri, 20 May 2011 12:23:48 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w1sm2821186anh.10.2011.05.20.12.23.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 12:23:47 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 May 2011 19:23:06 +0000
Message-Id: <c3cf33804c804a60db78c12b0d564212e0643c72.1305917406.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1305917406.git.otavio@ossystems.com.br>
References: <cover.1305917406.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1305917406.git.otavio@ossystems.com.br>
References: <cover.1305917406.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/3] freerdp: fix homepage field
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2011 19:26:50 -0000

---
 meta-oe/recipes-support/freerdp/freerdp.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index 71dab97..ec7d360 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -2,7 +2,7 @@
 # Released under the MIT license
 
 DESCRIPTION = "FreeRDP RDP client"
-HOMEPAGE = "http://freerdp.sourceforge.net"
+HOMEPAGE = "http://www.freerdp.com"
 DEPENDS = "virtual/libx11 openssl libxcursor libxv cups alsa-lib pulseaudio pcsc-lite"
 SECTION = "x11/network"
 LICENSE = "Apache-2.0"
-- 
1.7.2.5



