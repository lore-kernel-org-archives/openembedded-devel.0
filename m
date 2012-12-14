Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1TjaJJ-00005k-Ao
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 19:48:38 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so6224394ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=K5O4U8dwWqRyV4CqVXAsVg70kzlhyAcMu/VpUA3ZnO4=;
	b=Ey+bqdZFqT6KuGe2RbQhSNy2U4Uh0yzlq8Jp7rHwZ7dhYuDqveYVGSTl5oYLnY5eIm
	EDC8f5fBhBgf8DFqhtFnbz1auO50mPVr8yuJsQF7no6hlj0oM2YJ8TZ6tZvIyY3DT7ZN
	aBB3IX/yKgHXNVczuh6Ay8qCXZfLmdBgD756p/x6szLq4Jyzdw2q39+5R3C3VOhPU+Zl
	j1C6NaDxnHO+IUI/7xP8vsUhTdlLWIi+HVn9uyOfv+Z+bV7yQg1jlboyJb3FYiPXbrRb
	L+CqkKkkbANZD7WyJi/9aov3w06YEkZIR2Ziyu+o6s1z5L+eXXwPE9GAuAEfO0kV5CVe
	qIkw==
Received: by 10.43.92.72 with SMTP id bp8mr5367406icc.49.1355510040225;
	Fri, 14 Dec 2012 10:34:00 -0800 (PST)
Received: from mars.hq.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net.
	[69.34.21.229])
	by mx.google.com with ESMTPS id s3sm4536424igb.14.2012.12.14.10.33.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 10:33:59 -0800 (PST)
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 13:33:40 -0500
Message-Id: <1355510023-17096-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 0/3] Camera recipes
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
X-List-Received-Date: Fri, 14 Dec 2012 18:48:38 -0000

Various patches to add support for firewire and USB industrial cameras

[PATCH 1/3] libraw1394: add recipe
[PATCH 2/3] libdc1394: add recipe
[PATCH 3/3] coriander: add recipe


