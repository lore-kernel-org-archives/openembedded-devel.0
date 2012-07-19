Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srutk-0003gM-8t
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:52:24 +0200
Received: by weyr6 with SMTP id r6so1916800wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gXNhT5TY5Qc2N1kcK9j2iYyzyZK2MXLjFXfaPrqqZR0=;
	b=qCS23NKaNrF7AofwdNbvdkl1F2SfQ9vOQv6aWFWFN626EHjhswPVQVV6BNzocFKchA
	8rB/A6W/UgFtE+rlc6lLBf9q1fcAS3TmUBLsr9MkppJj/JATLyW1THAzxq/RyoIVgCtj
	4DTOER43b1FMY8Vq7BaV06A6I45snZsPIbxVQ9FWjtd5eotCxYHZjXogT8b4IxZtrSPc
	f+JVK9/c9Hwz7qlaluhU7FvoCnznpTGQkbqiCjYCfRb1CMfJdoB7r0ZyhpLrZorcd3Q7
	LopgclHNvLgaXvzPwgDRdZbvZm01yIbjIABg8wsiTY+RUwNVQxM6oGTqxj7uLhcOvwuO
	ijnw==
Received: by 10.216.166.197 with SMTP id g47mr1553001wel.179.1342719662043;
	Thu, 19 Jul 2012 10:41:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm39548116wib.6.2012.07.19.10.40.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 10:41:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:41:09 +0200
Message-Id: <1342719671-28184-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 1/3] meta-systemd: pulseaudio: rename bbappend to match new oe-core version
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
X-List-Received-Date: Thu, 19 Jul 2012 17:52:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...eaudio_1.1.bbappend => pulseaudio_2.0.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-multimedia/pulseaudio/{pulseaudio_1.1.bbappend => pulseaudio_2.0.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_1.1.bbappend b/meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_2.0.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_1.1.bbappend
rename to meta-systemd/oe-core/recipes-multimedia/pulseaudio/pulseaudio_2.0.bbappend
-- 
1.7.8.6



