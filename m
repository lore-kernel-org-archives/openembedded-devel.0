Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 59CCB77E93
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 20:21:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f4so3604915wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 13:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=93pcsedChQr2KLGI3oCvH1C1xChJTcyNCmubX76vdUo=;
	b=KvjHARwKZkAZobteXiErxKd27eR5HZf36GMQCSuWEtsUzJmFWUATTEWLkC6LOHX2N3
	luTpDhbYyzn4siRmSUnGIYE3CmV/9etIGPJrU9K83lJwrgkyXK+5WTAuPymYwIrbUrE+
	ZgitxhD6a7Lt5387l3nwiyr2ZLESxMLKG7LNkzMFFZ8ayoV0NQx963yGB/gC1JPYUB8T
	6JC00VBNYi0/xnCWeFFDZvR9zwEyJrnnN8vxiZoOcdzZ1irHyfg4xYD7SuVi/xadRwO4
	InycEG3o1sn0XndFVOohuMkQ7cFEAAygnYEP1/x2Jd/rQieSfXxRkaNpYoSZzEYQq1Vz
	5xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=93pcsedChQr2KLGI3oCvH1C1xChJTcyNCmubX76vdUo=;
	b=AAXjdS0miu3IPDteB8AIHIgq4Z5aJPfo9u0sRvkXfOuMUE87doOkMRbxjrnMvg5HIX
	MTIThH4hzT6sC6IB8NlGTQAVdJIecU8xSQcU+CynZFpO4HF2GVQIoFBSQiY72lyyHMnP
	4h/ghUEeAtd5JvbjDi/2jYRB9RM2GB4xis/dIWV+nu4xvfNytBUtgw0A/rb5L9Xd0VCQ
	mHB7A+D8+PJA5oGpszCHdDFAv1/q3th/N+t3Dob4KFrRvgMeO1EXS/YyuAGLOFHazAPi
	/oZFf63JtQDvUWp3311BmOMsg/Gim8CheZO8NfKdvYmrwhLajAPBSN1DtFJ7eHXAyUYB
	iZnA==
X-Gm-Message-State: AHPjjUjheN3r5GmOzhxGmDTWlmGSBiG1Jvmul+7sjeYs2tPKRK6vzEqX
	ty3dlwlbmXGDP5DG
X-Google-Smtp-Source: ADKCNb42N2uxyBPneAMadmjWPnR+7Doye+oPJ1PLwtLREhnyf23jczAdxzI5ay1VyjUpjfGA+GrJFQ==
X-Received: by 10.28.21.80 with SMTP id 77mr617198wmv.77.1504729272935;
	Wed, 06 Sep 2017 13:21:12 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E901F2641E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e901:f264:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s9sm281786wra.73.2017.09.06.13.21.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 13:21:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 22:21:01 +0200
Message-Id: <20170906202101.2983-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] meta-xfce: remove me as maintainer
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
X-List-Received-Date: Wed, 06 Sep 2017 20:21:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/README | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-xfce/README b/meta-xfce/README
index 33ef509..bbc7cc7 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -18,5 +18,3 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce
 
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
-
-Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
-- 
2.9.5


