Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7B66E243
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 10:45:36 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so778963eaj.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 02:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Vdk+cPss01V1AYzoUqNDmHscjMfvfZqCR52dKdyFgc0=;
	b=JNNOQE96QJitkpWYfQz38/U40SUPCpVX38q/piEu/AibohDW2sZmBBMETafcvnXmoI
	3Owv8xIw21ZhAzGHRLojP3O4AySKi4SBKFkUInz2z6vsdMWe+hzEiz+844+Li9Vyh9iR
	ZxwuXi3xgRYghdHLLJvAApbEtoBgMaBKJgLVZj5/YTHb7Sj6O6/sgT78XkG4lOZEZJQh
	MQnpBaI9PCm5gh7rnrKy97FXEmsxx7DpFHQCoSnmSMjljQH1YF9G9DHq1DlZNfP2ldn7
	B+ty6A4Tw5mlyDakf5PR49u5mzUzc9u79vlGyfg27Dv1K/jh+L2Nu+xYfZquI+WjZ7hu
	QfLw==
X-Received: by 10.14.7.2 with SMTP id 2mr2143743eeo.16.1386931535629;
	Fri, 13 Dec 2013 02:45:35 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id e43sm5317796eep.7.2013.12.13.02.45.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Dec 2013 02:45:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Dec 2013 11:45:27 +0100
Message-Id: <1386931527-12034-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-systemd] connman: follow oe-core to 1.20
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
X-List-Received-Date: Fri, 13 Dec 2013 10:45:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../connman/{connman_1.19.bbappend => connman_1.20.bbappend}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.19.bbappend => connman_1.20.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.19.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/connman/connman_1.19.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappend
-- 
1.8.3.1


