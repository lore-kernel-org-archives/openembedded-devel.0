Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 473E86BB14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:54:29 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1649346eae.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QZ5ZuxRAi/GivoTJeax80HP2W01sRtx5rmBJsf0vwAw=;
	b=YRpW5oyd6AfQ7gfkLx9LkNi4vIiTPLTSETlHH+H/2kPahTpFNCEdCCAcrlxcESIY9g
	hRElIvImkWMxKfNP6SYRic4/EZfStWcCRLXbgX0Gu/hbqy0HULJ8Iric0gfEx0h5XXus
	qbiiF3PNmhTcV3HY/Y9SySOVFjGVl86aYCfNNfM3/5P8DunGDU7sePODZJbUXv6b6iZj
	bIY1cUk23NwhSX0dE4uQzmG3LnGpvuLqID3S892wTBHR+bn3TuXb4HakFshsqCUtjcX5
	GhBdL2vHYrd/qpHDwq1gZO4MYKURwQjsjDaMT0Nk11sFXciGWaYgC+I/7Xch3keBhjRu
	8CNA==
X-Received: by 10.15.52.2 with SMTP id o2mr365764eew.83.1377528869070;
	Mon, 26 Aug 2013 07:54:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm21963549eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 07:54:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2013 16:55:37 +0200
Message-Id: <1377528937-13035-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] connman: rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Mon, 26 Aug 2013 14:54:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../connman/{connman_1.16.bbappend => connman_1.17.bbappend}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.16.bbappend => connman_1.17.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.16.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.17.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/connman/connman_1.16.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.17.bbappend
-- 
1.8.3.2


