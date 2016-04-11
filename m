Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 10BA8607A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 20:23:25 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 184so130630456pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 13:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Y/mXlWUBETWA5tjb1zGoalOb83GOqf2uG+SoStL0m4g=;
	b=XIxw2102/AogQU0Df2ZKTkV/EmjZ/wLf1g8bwf3MOO/KIWigSaX6LLp3eCuZwH8iKY
	+C9FcfiTsYK/EeUEE/cWtNGllqsYtKcbbvra7TTsbkxXQ1ZAkKTHhJMjt37QD1iYAnp7
	TVW2BSpiIjBtNZ+WCDWCCvVQ5jYznTVrUKpobD46QzMJ2+Aeqek7EGqr8Og/X8GNkPdQ
	m9vDxcZoV7UBnasbVUuJkNQLH6ghjhCYWTMDRcPKWfkNpROLqaUnxfiALmQIHpfQbEyV
	xJfu/xM5zbWAT02mwJtFDLbnFkpMpYkHeFDDU0KCg79Y6ljuKYyI8ThDEtXzmrHwKg46
	T99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y/mXlWUBETWA5tjb1zGoalOb83GOqf2uG+SoStL0m4g=;
	b=H0S6BmyDg10S0jBoK8/p1Qx+/83/iLfzqlo/BLYwdRsD1Gsqjk+NP/WD5IqDspbR0m
	2MCvwDDVhoZFJZl9BgvTnFzOBAu2BESXh52lCiCx60IwgMKiBv1toRrDiuSj3LgAW97N
	3kJarjsOUCHxPW7B19ara4aNLuMJ+n5PbP+9em4S2LxXMNKBRHYwGxNgqFQkaL0izrFA
	zRJp+/w5CFV7KNkslzyxab6rOuegWYtro8aDIRcEyv1a7skyK5iETI9O3y/ZZrFRc8Xp
	gmflhFIwtyKkzXds7IA0Y12Bt+9k+YBTgiK1uAtBEBcdUxI/3AoDAYtGvDla6KwC5Xv9
	4PGg==
X-Gm-Message-State: AD7BkJJET31HwUgeyBowEoQIzfOtwSQLulsPFn40xhnRy1khyt5cTMtIsTuSRea835juVA==
X-Received: by 10.98.67.76 with SMTP id q73mr35430038pfa.137.1460406206498;
	Mon, 11 Apr 2016 13:23:26 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	g28sm38147518pfd.25.2016.04.11.13.23.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 13:23:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Apr 2016 13:23:22 -0700
Message-Id: <1460406203-5139-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] Add krogth maintainer
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
X-List-Received-Date: Mon, 11 Apr 2016 20:23:26 -0000

Please consider me a the branch maintainer for meta-openembedded krogoth

Armin Kuster (1):
  README: update maintainers list for krogoth

 meta-efl/README             | 12 ++++++------
 meta-filesystems/README     | 12 +++++++-----
 meta-gnome/README           | 11 ++++++-----
 meta-gpe/README             | 12 ++++++------
 meta-initramfs/README       | 10 +++++-----
 meta-multimedia/README      | 13 ++++++-------
 meta-networking/MAINTAINERS |  7 +++++--
 meta-oe/README              | 10 +++++-----
 meta-perl/README            |  9 +++++----
 meta-python/README          | 14 ++++++--------
 meta-ruby/README            | 11 ++++++-----
 meta-systemd/README         | 12 ++++++------
 meta-webserver/README       | 12 +++++++-----
 meta-xfce/README            | 11 ++++++-----
 14 files changed, 82 insertions(+), 74 deletions(-)

-- 
1.9.1


