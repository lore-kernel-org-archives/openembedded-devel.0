Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJd-0005cc-U7
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:29 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805180fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=kq2ACSdDiANO1rSdBSjW52TB8hpKARMD3vc4kWcj6AU=;
	b=oLpcVlkYUXunPd9dxVFnDWuCeCQbA6Y0BBT6MY0rm+Pn8bPcBnv7r5o2j0DOzw6g8A
	7DMbRHpIhGBLg6SznRjlfJSGLkb6xO3IcN0ur8frn3f/X9VVfx67RT560WPu4m9ftHxm
	frHm7icSYy/LZu79rakWevoJzj7h9AZZ8gfCU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=DMPVyc2rvOkK89PRFE5JzEpcTn40Lqh/4OLgTKYyYgI5XgGDSj+i2u1nQ6Yju1WdJx
	SdtDIRos0Cc8F0V3yH0Gp78f+V3AYZlE3QPKLJM+Va35SbDsFT2jIo/sQEgyFxyWV9Ti
	DZoTlBw/jsy7VYj23kMIgymkBxeGkNw7UgT4Q=
Received: by 10.103.228.19 with SMTP id f19mr1073831mur.32.1242873598480;
	Wed, 20 May 2009 19:39:58 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id n7sm130106mue.58.2009.05.20.19.39.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:54 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 0DA9B6103C0; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:37 -0300
Message-Id: <1242873578-17444-23-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-22-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-15-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-16-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-17-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-18-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-19-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-20-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-21-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-22-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 22/23] xf86-video-geode: add 2.11.2
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
X-List-Received-Date: Thu, 21 May 2009 02:47:30 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../preferred-xorg-versions-X11R7.4-updates.inc    |    2 +-
 recipes/xorg-driver/xf86-video-geode_2.11.2.bb     |    5 +++++
 2 files changed, 6 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.2.bb

diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.4-updates.inc b/conf/distro/include/preferred-xorg-versions-X11R7.4-updates.inc
index 1f60765..6e42065 100644
--- a/conf/distro/include/preferred-xorg-versions-X11R7.4-updates.inc
+++ b/conf/distro/include/preferred-xorg-versions-X11R7.4-updates.inc
@@ -2,6 +2,6 @@
 
 PREFERRED_VERSION_xserver-xorg ?= "1.5.3"
 PREFERRED_VERSION_xf86-input-evdev ?= "2.1.0"
-PREFERRED_VERSION_xf86-video-geode ?= "2.11.0"
+PREFERRED_VERSION_xf86-video-geode ?= "2.11.2"
 PREFERRED_VERSION_libxi ?= "1.2.0"
 PREFERRED_VERSION_inputproto ?= "1.5.0"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.2.bb b/recipes/xorg-driver/xf86-video-geode_2.11.2.bb
new file mode 100644
index 0000000..380ce2e
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-geode_2.11.2.bb
@@ -0,0 +1,5 @@
+require xorg-driver-video.inc
+PE = "1"
+
+COMPATIBLE_HOST = 'i.86.*-linux'
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-- 
1.6.3.1.54.g99dd



