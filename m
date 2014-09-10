Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1F81A711EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 18:37:53 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id y20so1637735ier.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 11:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nSD/kIdRkX+DcpJNdOPdM/XghWlwyQj66eDu9KFSZ9A=;
	b=j4/ls0t+4LAVJUsAqUXgwZnxLAafSDzoy0YEksttxj8zXDpcOLIAfNs141c/Kf1T+h
	WojVFhiU/RmJBo0KZUHDgzm5wNfAF18SbyzUr7njfDn5cHtLWLSaDtHAGr9WBPsXpE7q
	ytXQPtVvIv1HJLrieY/cWi9hfFRsm9lBPbdylC8jrsSP4wObic4t8DkChXkThx2LxkK3
	7Z5R6L4rA6qJLRufPa33TbJnQ/QGstQEQy6hnBKft4HMXxMmPHtj8hAEj2aVR2yYzdfW
	V0r8UhyhsqBT0jUiQO8p9tpDBS6laAYDXTN520DzIp290KRmxAVHnZE2LVoofjVQyszh
	oZlQ==
X-Gm-Message-State: ALoCoQmZErZtGTTdNL29xRA/NGBvoC56OfCGvMVNZBtwjAeZ+IDDymE5J72IkTG5PFiMEJK5PxRZ
X-Received: by 10.43.136.134 with SMTP id ik6mr47205395icc.6.1410374274487;
	Wed, 10 Sep 2014 11:37:54 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-204-8-249.acanac.net. [67.204.8.249])
	by mx.google.com with ESMTPSA id
	cz10sm2688298igc.5.2014.09.10.11.37.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Sep 2014 11:37:53 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Sep 2014 14:37:41 -0400
Message-Id: <1410374261-10233-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 2.0.1.563.g66f467c
Cc: otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH] nspr: rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Wed, 10 Sep 2014 18:38:02 -0000

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 recipes-support/nspr/{nspr_4.10.3.bbappend => nspr_4.10.7.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-support/nspr/{nspr_4.10.3.bbappend => nspr_4.10.7.bbappend} (100%)

diff --git a/recipes-support/nspr/nspr_4.10.3.bbappend b/recipes-support/nspr/nspr_4.10.7.bbappend
similarity index 100%
rename from recipes-support/nspr/nspr_4.10.3.bbappend
rename to recipes-support/nspr/nspr_4.10.7.bbappend
-- 
2.0.1.563.g66f467c


