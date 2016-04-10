Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E12B9771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l6so16767536wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4bv5v/nxCFvv72f39PvchT5LzUNfFBD28snUlzILTVU=;
	b=Q59nWx7nq/VMfbkYxe+zSa0je9C1PyCidDaBfZHpcG5NjLk1FLLjqXvUwS1FchYUuY
	Bc3FTezfTCy0kx4XJuSgdYmfG5ZfQKd317G13d0NsmQkoSo9qa+Q3GJ2rnY8JWQ1gzJ8
	Nlpu1o/L4tGN7Cm761MrTV7rqCRvncJvjfoD6UMISAOdZ4qxHujayoptbfrPftp+yJpu
	A4t5pgRVWb3wpNeiaI0RmRiGo5N5SeWTNtzehciS1bu85UUf2MxRoch7Qz5sXlWv4Dt6
	S9JrTcPi1J6mzLWvHBnnVFRs/aSzfZHzKfEeyiaqsodJypPxwQH8h5pHNqYR/20sebfd
	Bg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4bv5v/nxCFvv72f39PvchT5LzUNfFBD28snUlzILTVU=;
	b=KQ46uksS8Y977aQ8LOMVA1BvbuZh/iFbuy76kEZp0JxRcURloPM2qN7lNu6Q7zhDee
	ias4pzDFCyxJJpR92ugy60+mEVu64ejnFMaLhoZoTlQ4ClCOGnvncyB2CPGeIKBDyfQH
	VgAbFBFRhJf5P1EO2tjjEs4iCJpEesDE5KJ6zH4TeifWKsfVl2M20YanuvI/8/qwr9Uv
	/+OGm5qkVhog7+BWe1a5r54KeJI7MKH/w8jvfwggzLyqhgFF2RcLxwX0lMVlzGy+7wDj
	nEiLaqLeoc2egWaA9bdyfnlysvGKLmzguZTUkiT0nUambqkrt0QvYoaI+wLdwGhrzyZb
	/VKg==
X-Gm-Message-State: AD7BkJIDR3yiN4EalQxapbWAPmFXT/IFb1GhbXvCageqlH/vxpmwmKOdVV4IqA+h/WcD0w==
X-Received: by 10.194.236.170 with SMTP id uv10mr22207308wjc.32.1460317325551; 
	Sun, 10 Apr 2016 12:42:05 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:23 +0200
Message-Id: <1460317290-4787-25-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 24/31] qttranslations: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qttranslations_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 7908a3e..cc84755 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "ce85e4ee4ee22e5dea3b44707a27dab44319708e"
+SRCREV = "41d212290c3822b8eef151785d89ac5f5b246bde"
-- 
2.5.5


