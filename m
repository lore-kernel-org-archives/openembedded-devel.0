Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.19740.1621261510835380979
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rzzl2enK;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id v14so2020924pgi.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2whHvmV905GaWNfOoRSPda0XpGi0zmBFmyaeP/YrQIE=;
        b=Rzzl2enKhvP7fTGRBQUNQ/VZyVQdGS+qotifBsPj+QjnhYEWY27NfWP3aZP4BDdvod
         B7N79p8O2e/RMbiCUrP/H2DoLQboI9SuOwHdv3JwhhFxl9gUSF8ifHYvTq2B/MsXZvSB
         f6dZZO/qNHzGks8WGHq73q+GRcbPbagOwxdh5wG7XimyC0sp3olDS6mg5pchWqa1Ufqh
         4w73Uss37lbO+wbx3MexvT07wl1u65e35X4SfUnjTZ4+3z4Vg7s02k4rsO41wP53sJdy
         zgO11mc9ZOC8LyYWCSKnEUpdiZPA250/AuxKR+EOSJlCTqWUQpR8FGPaK3LdIxNBw6i1
         zsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2whHvmV905GaWNfOoRSPda0XpGi0zmBFmyaeP/YrQIE=;
        b=pb8t+OQiUHW7if24hexSI9rqty/ZMIMDO9Ys6Tm8P3jHaN6pjyHfOEzP5PuX0sHhy6
         TI+tiZ2rJnsEqwPKNjth7RW5DPfOwY9QCSsG68zwRKNi5IeULWvetoeEbwA/Y/iF1as0
         ZttrAAVdvCFLxxKAchp2Tu9/gjr91ywAzQ5RBwnhYZZyLeYVazLnK5anynLvFmcPwRka
         BWgB1eNWc4+ghvYvYl2HHUFSKlaEVR7lxeFDsu1up7ZfqBEYCnUK0TS7YkT3Zyip3y4P
         SnQ7oMQTkrgZmhw8NGdgykrRiy7IyR/LAQgZmeVf9IxVgEmUnauWYlQPvHWc9wz0JEv3
         lAgg==
X-Gm-Message-State: AOAM530woSu5wdwX9FlRNsYi1WINUg31jNeiwfoNEhch4QWKEixLXyZs
	aNOkWJmLNa1XzPRwU4W7E1VM2G8BV30=
X-Google-Smtp-Source: ABdhPJx3bA4lBzvv9M6Xf9zrpFmV13u4eZSH31d+DkeJ0aGcLtSTmVRSPhTQ8lt7HhfQaKjgFjk05g==
X-Received: by 2002:a62:ee07:0:b029:2d8:dea3:7892 with SMTP id e7-20020a62ee070000b02902d8dea37892mr11528207pfi.78.1621261510261;
        Mon, 17 May 2021 07:25:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:09 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 03/11] aom: Match the name for AOM-Patent-License-1.0
Date: Mon, 17 May 2021 07:24:56 -0700
Message-Id: <d914d2b2fe3b66a800e523627490576bc9fa4517.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 30ca058a1e45cf924e204e816f7c2f9b691ed74f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
index 7ea9b199bf..f5a42fb860 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Alliance for Open Media - AV1 Codec Library"
 DESCRIPTION = "Alliance for Open Media AV1 codec library"
 
-LICENSE = "BSD-2-Clause & AOM-Patent-1.0"
+LICENSE = "BSD-2-Clause & AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=e69ad12202bd20da3c76a5d3648cfa83 \
                    "
-- 
2.17.1

