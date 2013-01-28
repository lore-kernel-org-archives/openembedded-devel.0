Received: from mail-wg0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzpNV-0008QL-Pl
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 15:08:06 +0100
Received: by mail-wg0-f51.google.com with SMTP id 8so1683246wgl.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 05:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Jxr7nSXu0jIZeLYZ05EMlnsvQCOGak7qQfvXKbZbx/Y=;
	b=J3uM1PP/RZkcD/syAesNbcCVjSFIgGP+MHPIM7q8rrcd7dPuiAYGDosY/OIa0HAkiH
	eE8QIFLJUUW5TFZ4fFg28zTrJSvMsEhtexH7U0unEksF89ciiGZKBuphGX2JhseN1cwL
	tBIsvsiPtyZIGikLLVT2o5PMm4SnvznwsCMrQAOKG0dKvcowGyfxLmfh7FwYeYyX3M3+
	lNxQD/Iqy7/3wUzPdMT3E7LSfuC5mGHSK1OMEa/2LliKIrkIBGVgKt9xmaR4TWpR8U9W
	PZlw/slqAJGwxcpuBLbCqyGSto/alLLamCeTORP2Rc1AZXMN/XX+vXNnuEtC57/8X064
	IGmQ==
X-Received: by 10.194.109.10 with SMTP id ho10mr21613923wjb.16.1359381147557; 
	Mon, 28 Jan 2013 05:52:27 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id bz12sm13535324wib.5.2013.01.28.05.52.26
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 05:52:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:50:32 +0100
Message-Id: <1359381032-24881-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd/V2 4/4] util-linux: follow oe-core to 2.22.2
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
X-List-Received-Date: Mon, 28 Jan 2013 14:08:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ..._2.22.1.bbappend => util-linux_2.22.2.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-core/util-linux/{util-linux_2.22.1.bbappend => util-linux_2.22.2.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.1.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.1.bbappend
rename to meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbappend
-- 
1.7.6.5



