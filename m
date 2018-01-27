Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D6A2B787DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:41 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t12so1460832pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nGHG25fo57jeJU0EKv0FrhXMYX3gTon7IvdayYtd71s=;
	b=vU4EYaOEL6e90wfynIolYnPyTSV/vtEIcoZOrNbK9UQF6nFM5nEtuOkn9L5Dz2YmEm
	5EB8PigO3zPi2yNZtNY6cl9SPL/xozUIdi0BMwPKmCyKjnpHHZHqA5MV6Pmf0ZU+3pZ6
	u5z72VTP5PcxTmYJ2rxzAoNqIXmXOyIC7Vrq2cg9fmshUPtMqBki8Xov35EJ2VUJweKp
	44yZRDa26Vf3BO+7qjZV74UShqC3hShW2eg4Zpaa51/6EuwC+/CD2AKoXQMAicPL25LN
	FsGk32c7pWH7uXQoxddU44T9F1Zt+iOPhWSlPCaTRt7Obg5nI5PYsQp/C3TUdaL9Dabb
	ZUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nGHG25fo57jeJU0EKv0FrhXMYX3gTon7IvdayYtd71s=;
	b=TPdQwvcAGPf6VEYnNRIqygU//g7H7/jg4TAbUViS3b6oDkhYjqcCSkbmnTZhCxuoZm
	ZrIUHptdaHilnQCG7qvNfmsWONekstgobbbr3eOgV39tXaTauvOR1HRw8WZwJAHJQ3cS
	pfT3SD0XpyvvJY6gqxA30IEUSxm74HxMiDsNr8miKvmslpFjpekv1XXKlSG1YrK4lnvC
	Ffbpg3wPmBFQb25U74EDKqhwzU1yYA/GPgJFuuWH0ODbNl+TAcfTTMbBh50Cr50RxIOe
	w2hG+l+GC+49L7YBtznFwfhvs+GC2ZdVnJajZdULDSRqMyKerIMlBBmAS0iqPaKHQ4at
	qXiQ==
X-Gm-Message-State: AKwxytfIMInYFyAkw04PnId4k7V5dOjhUU/e+YqFGhuZIfyMFBr+wyTM
	XS6gTMruXoj+HLJ8fOw2uzg=
X-Google-Smtp-Source: AH8x225a/UgHBAJtRT/dI9vl1VWMJvV7Zg1JhCeHKM6u7C93ogo6Kfd23mYoi36m4c2B6q2mRoPh/A==
X-Received: by 10.98.75.146 with SMTP id d18mr21095019pfj.11.1517023483239;
	Fri, 26 Jan 2018 19:24:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:02 -0800
Message-Id: <ee8272f71176d5e99efce289bfbf3565c7ad1ca7.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 02/36] tslib: update project homepage
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:42 -0000

From: Martin Kepplinger <martink@posteo.de>

The berlios project has been dead for a long time. tslib is hosted and
developed on github for years already.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 0d220e002e4f525469f0c24e0585318d2178e7a1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/tslib/tslib_1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.1.bb b/meta-oe/recipes-graphics/tslib/tslib_1.1.bb
index 502034a..e7c48ff 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.1.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Tslib is an abstraction layer for touchscreen panel \
 events, as well as a filter stack for the manipulation of those events. \
 Tslib is generally used on embedded devices to provide a common user \
 space interface to touchscreen functionality."
-HOMEPAGE = "http://tslib.berlios.de/"
+HOMEPAGE = "http://tslib.org/"
 
 AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
 SECTION = "base"
-- 
2.7.4


