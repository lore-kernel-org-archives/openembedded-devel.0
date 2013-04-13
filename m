Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0oA-0007Yt-Ck
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ee0-f52.google.com with SMTP id d17so1592606eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fCoP+7aBSosd0GdowdXF26F0qeg+sJajqUlyW61L/iY=;
	b=TQ/Qjn9pqebDZJy8Z9oniIUIKr6TBbKYuof34cEgkWrJ6h88Aj3xJppMmzbTvR4Ppb
	VkOQ35bcXwp/WnE5MgRzkXvufbhBw4XX2iREdq7b93FrcC8HZGf4BLW9baIR3faxADZa
	RDED/mvOEyHtoHSzo0H7uUmYgTaMUsKkWiRNC6LpuHP6D9o4RSMUpBqfH05aiY+cIxUd
	gS6ZIjdOLGY7tt1bfd6x1dbxoFzgNX6idZeOK/pilNUeNbhEu6VyGdTnhqwf+eILqbAY
	Rm1qsGMALWgSLzlLhtddhvVSvx0CzJehxWDDs01Rp78/kzUvfpNcM9qFx5ms40X2dJy0
	Ad8w==
X-Received: by 10.14.104.6 with SMTP id h6mr39528878eeg.5.1365859832780;
	Sat, 13 Apr 2013 06:30:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t4sm16527743eel.0.2013.04.13.06.30.32
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:49 +0200
Message-Id: <1365859790-20947-32-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 32/33] meta-systemd: drop now unused gitpkgv.bbclass
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
X-List-Received-Date: Sat, 13 Apr 2013 13:49:24 -0000

---
 meta-systemd/classes/gitpkgv.bbclass | 1 -
 1 file changed, 1 deletion(-)
 delete mode 120000 meta-systemd/classes/gitpkgv.bbclass

diff --git a/meta-systemd/classes/gitpkgv.bbclass b/meta-systemd/classes/gitpkgv.bbclass
deleted file mode 120000
index 8205151..0000000
--- a/meta-systemd/classes/gitpkgv.bbclass
+++ /dev/null
@@ -1 +0,0 @@
-../../meta-oe/classes/gitpkgv.bbclass
-- 
1.8.1.5



