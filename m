Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvSfj-0001VD-3b
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 14:04:54 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so559815dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 04:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=8850P+C5wWO8MWC5V4ZJTmYhCDl/Vqldb2oO6v7QBik=;
	b=WvJAQGA/YpIRKAGa8C09bJE8J/EdyKcCpKw2Y5ncTuMI627xFrssHmfcsq+YhQma7v
	ZeqnXApHAnkFjCJju+fCIaE7CSnyH4z18qew4L59Jtsj6TL2tg5lr6x7yVUJepxi+8Sw
	4lztLPJbXPc6BxIbsXwdmS26Kio1JF58xLLIUltEEOJ81KOE09rskQ24Qq8iGbQkVMcL
	ZUpje7k1HTPHei78FwlAZfN7nRTb1HlF9Dy+SmsWFCXWs8l0c2VGGzRQY7Qrijkbh3/o
	TxdhLRovac2GaZukiY4PDv6KYYi9TMBtpnTcwANyxkhRzhCjze6l/M08RnXuZSXt33ai
	nhGw==
X-Received: by 10.68.136.132 with SMTP id qa4mr2214580pbb.166.1358340568662;
	Wed, 16 Jan 2013 04:49:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o5sm12936858paz.32.2013.01.16.04.49.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 04:49:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jan 2013 13:49:28 +0100
Message-Id: <1358340568-24870-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH][meta-systemd] meta-systemd: connman: rename bbappend to match 1.10 from oe-core
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
X-List-Received-Date: Wed, 16 Jan 2013 13:04:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../connman/{connman_1.4.bbappend => connman_1.10.bbappend}               | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/meta-oe/recipes-connectivity/connman/{connman_1.4.bbappend => connman_1.10.bbappend} (100%)

diff --git a/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.4.bbappend b/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.10.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.4.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.10.bbappend
-- 
1.8.1.1



