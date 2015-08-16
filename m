Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 662F975D4F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:46:50 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so56117731wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 12:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IDFn47ZvOm15C1JNE/Dd7IMsEVfd8jW6YWINnAODbjU=;
	b=taZWaZ2GHRMPV0/QqlGNuhOxHJvJtCj0WEPcu5Z3Ca5SP+1pSp/XZDzlJboes5+tLh
	E/BJZlA7XjViMBZQeHLvV8Ph/5SxIebsufMcRj39NfDz6Igp/awOouk6L59Rbxu78uhn
	q9/PW62DCe8XrmRiLLqIn0tqdeFWguFjCIEofHpqUb3awA8L4Y0nMTrMUHrG2HDzfmlC
	sYfDBTlL0aZXevIdnVc+h0R9Y8pIRADq2WHg1NQiXxHEzzlCfOlB823wCiCIfijGv3We
	ajWEKGRha+VebulwZq3tFaRGbrIok/0D4+UYwsHAzfcS6rPX6XJFlFHVIZtibv8GyGfM
	Wcvg==
X-Received: by 10.180.103.132 with SMTP id fw4mr27458094wib.52.1439754410770; 
	Sun, 16 Aug 2015 12:46:50 -0700 (PDT)
Received: from Saturn.local.all (212-41-85-106.adsl.solnet.ch. [212.41.85.106])
	by smtp.gmail.com with ESMTPSA id
	p1sm18490730wjq.28.2015.08.16.12.46.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Aug 2015 12:46:50 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 21:40:23 +0200
Message-Id: <1439754023-13290-9-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
References: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
Cc: gary@mlbassoc.com, Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-browser][PATCH 8/8] firefox-l10n: Update all languages for 10.0.12esr release
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
X-List-Received-Date: Sun, 16 Aug 2015 19:46:52 -0000

From: Max Krummenacher <max.krummenacher@toradex.com>

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-mozilla/firefox-l10n/README                | 33 ++++++++++++++++++++++
 .../firefox-l10n/firefox-l10n-af_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-af_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ak_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ak_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ar_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ar_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-as_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-as_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ast_10.0.11esr.bb    |  7 -----
 .../firefox-l10n/firefox-l10n-ast_10.0.12esr.bb    |  7 +++++
 .../firefox-l10n/firefox-l10n-be_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-be_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-bg_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-bg_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-br_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-br_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-bs_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-bs_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ca_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ca_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-cs_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-cs_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-csb_10.0.11esr.bb    |  7 -----
 .../firefox-l10n/firefox-l10n-csb_10.0.12esr.bb    |  7 +++++
 .../firefox-l10n/firefox-l10n-cy_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-cy_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-da_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-da_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-de_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-de_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-el_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-el_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-eo_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-eo_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-et_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-et_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-eu_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-eu_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-fa_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-fa_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-fi_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-fi_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-fr_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-fr_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-gd_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-gd_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-gl_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-gl_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-he_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-he_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-hr_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-hr_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-hu_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-hu_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-id_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-id_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-is_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-is_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-it_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-it_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ja_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ja_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-kk_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-kk_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-kn_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-kn_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ko_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ko_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ku_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ku_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-lg_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-lg_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-lt_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-lt_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-lv_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-lv_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-mai_10.0.11esr.bb    |  7 -----
 .../firefox-l10n/firefox-l10n-mai_10.0.12esr.bb    |  7 +++++
 .../firefox-l10n/firefox-l10n-mk_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-mk_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ml_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ml_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-mr_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-mr_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-nl_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-nl_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-nso_10.0.11esr.bb    |  7 -----
 .../firefox-l10n/firefox-l10n-nso_10.0.12esr.bb    |  7 +++++
 .../firefox-l10n/firefox-l10n-or_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-or_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-pl_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-pl_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-rm_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-rm_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ro_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ro_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-ru_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ru_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-si_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-si_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-sk_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-sk_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-sl_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-sl_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-son_10.0.11esr.bb    |  7 -----
 .../firefox-l10n/firefox-l10n-son_10.0.12esr.bb    |  7 +++++
 .../firefox-l10n/firefox-l10n-sq_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-sq_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-sr_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-sr_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-ta_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-ta_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-te_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-te_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-th_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-th_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-tr_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-tr_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-uk_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-uk_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-vi_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-vi_10.0.12esr.bb     |  7 +++++
 .../firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb  |  7 -----
 .../firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb  |  7 +++++
 .../firefox-l10n/firefox-l10n-zu_10.0.11esr.bb     |  7 -----
 .../firefox-l10n/firefox-l10n-zu_10.0.12esr.bb     |  7 +++++
 171 files changed, 628 insertions(+), 595 deletions(-)
 create mode 100755 recipes-mozilla/firefox-l10n/README
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.12esr.bb

diff --git a/recipes-mozilla/firefox-l10n/README b/recipes-mozilla/firefox-l10n/README
new file mode 100755
index 0000000..2df7255
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/README
@@ -0,0 +1,33 @@
+# When updating to a new version the following can be used to automate that
+# a bit.
+# Not automated and needs to be checked manually: languages may have been added or removed
+
+OLD_VER=10.0.11esr
+NEW_VER=10.0.12esr
+
+# # rename recipes, execute line by line
+# find . -name "firefox-l10n-*_${OLD_VER}.bb" > filelist
+# sed 's/\(.*_\)'$OLD_VER'\(.*\)/git mv \1'$OLD_VER'\2 \1'$NEW_VER'\2/' filelist > mv_files
+# . mv_files
+# rm filelist mv_files
+
+# fetchall and update checksums
+# run as a script
+mkdir xpi
+for f in firefox-l10n-*_${NEW_VER}.bb; do
+	LANGUAGE=`echo $f | sed 's/firefox-l10n-\(.*\)_.*/\1/'`
+	langUAGE=`echo ${LANGUAGE} | awk -F "-" '{printf "%s",$1; if($2 != "") {print "-" toupper($2)}}'`
+	echo $langUAGE
+	wget https://archive.mozilla.org/pub/firefox/releases/${NEW_VER}/linux-i686/xpi/${langUAGE}.xpi -O xpi/${langUAGE}.xpi
+	sed -i '/SRC_URI\[.*sum\]/d' firefox-l10n-${LANGUAGE}_${NEW_VER}.bb
+	md5sum xpi/${langUAGE}.xpi | awk '{print "SRC_URI[md5sum] = \"" $1 "\""}' >> firefox-l10n-${LANGUAGE}_${NEW_VER}.bb
+	sha256sum xpi/${langUAGE}.xpi | awk '{print "SRC_URI[sha256sum] = \"" $1 "\""}' >> firefox-l10n-${LANGUAGE}_${NEW_VER}.bb
+done
+
+# create a file which when sourced bitbakes all language packages
+# run in a script
+echo -en bitbake "\t" > build_all
+for f in firefox-l10n-*_${NEW_VER}.bb; do
+	PACKAGE=`echo $f | sed 's/\(firefox-l10n-.*\)_.*/\1/'`
+	echo -en $PACKAGE "\t" >> build_all
+done
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.11esr.bb
deleted file mode 100644
index f24415c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "49462b42ebcfdd5c9a2c48375133ae04"
-SRC_URI[sha256sum] = "90ece8bfb785765f665cd15683009b1e35426b68e94205bd0b706902697fbd59"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.12esr.bb
new file mode 100644
index 0000000..f250a97
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ee09b5ae0b124cb02c91362fad37b08d"
+SRC_URI[sha256sum] = "e67b05f7b2586299f48e1bb2a1194300b07e1645b7a31a41d4c18a3810d6da2a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.11esr.bb
deleted file mode 100644
index 675543a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b4987d56d15ade8af2a6136f1abbd73a"
-SRC_URI[sha256sum] = "9aea100e427b299226ea334c47d668200bd58bf630657776440c2ff32509f4a2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.12esr.bb
new file mode 100644
index 0000000..ce843ab
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "3b4bbc907198a0e7d0e7919347b34a9f"
+SRC_URI[sha256sum] = "1f001cada0cdb54f475aff5d4b565396ec7d17c4523aa7b25e359199661530c6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.11esr.bb
deleted file mode 100644
index c050f2f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ccd1e708141a3cecdafdf4bff5cf6d71"
-SRC_URI[sha256sum] = "1bf9bcf59939bb4a24ab1c36d1a8edecbf7c383484d3dbd56d5418a25dc95e96"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.12esr.bb
new file mode 100644
index 0000000..fda65da
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "b71a07fa3242aa52ca624fa5da3b3bc6"
+SRC_URI[sha256sum] = "31fe7aa9932fc554924bb034d9345ed9b57b9df2cc802e34621d037ee16737e9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.11esr.bb
deleted file mode 100644
index b911911..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "6da8f4df99d55daa2178634b021f1e04"
-SRC_URI[sha256sum] = "719e62f4992f4cb3cc9ca129e10b72794cdbce864dd76d75107a0dce08d994ea"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.12esr.bb
new file mode 100644
index 0000000..97c06a1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "fbb0fe62d7b57ccfe04181d454cae8aa"
+SRC_URI[sha256sum] = "26e61ee3a18eac733e5c8b8feb55df78a97c1d3b0c619c78531deeb7c4bf5f95"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.11esr.bb
deleted file mode 100644
index 352cbf9..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "e81b1d71dbecb02b8a9556dbdac45dba"
-SRC_URI[sha256sum] = "e4ee31393e42505360a466e870abc28890c648a23f7fce8041dbf8b464628de5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.12esr.bb
new file mode 100644
index 0000000..5378ac4
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "110129c392ed671452cee74b9707f09d"
+SRC_URI[sha256sum] = "0cff3692db8cbe875a22114f61319ac7e43e9d39c3f70c8656a2354ab3da5650"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.11esr.bb
deleted file mode 100644
index 2ee83e3..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "2d7a0e96a3f6ee5092cc34f7771378f0"
-SRC_URI[sha256sum] = "3b5a43bb9175bcd12d81f67d3699b7851dc44ef79b25f53aea87c292ee670982"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.12esr.bb
new file mode 100644
index 0000000..917c20d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "b29eee5ae05473eb3e2ca791539bf76a"
+SRC_URI[sha256sum] = "17a5d58a3866567b93e16fdbe6e6ee1815dd0d1911461576bf68a0b77515dd42"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.11esr.bb
deleted file mode 100644
index 518f304..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "a17e04b45b12297a9eadf5d9119d29a3"
-SRC_URI[sha256sum] = "cfe29da7a6308836ca25531c44ab458e3e1bb484d2f743655d2157a31ef5d98e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.12esr.bb
new file mode 100644
index 0000000..ed1b0b5
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "79360625be246e46145179566d46fc64"
+SRC_URI[sha256sum] = "d6057c0c72987fd3cad6c8fd5866e5c65db5c54755674c745a2d76f3b5dd8d01"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb
deleted file mode 100644
index 9a5d3df..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "4130e44ed071331e0c8b1fdd34262fa7"
-SRC_URI[sha256sum] = "8697b84e257a88664ec88e074fb39913289e15f3fe89370fdb7e53c09071ab5c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb
new file mode 100644
index 0000000..e9290b6
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "fa9dba9b48585e5dc0a9bc8b6346f300"
+SRC_URI[sha256sum] = "d55143b3a14e88c24a58fed3865884c23e24194b4ad253624d5d45b7d59d4ac3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb
deleted file mode 100644
index 44ef47c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b68302716bbb274f7a385559a91f265c"
-SRC_URI[sha256sum] = "f96afb1587eebb95577f1f55d42396a76ed660cd3c91edcf62d765906c6975f2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb
new file mode 100644
index 0000000..ecbb73c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "4912298aa808c4c5982687540e790554"
+SRC_URI[sha256sum] = "50aaa09a46d1de6909fe2a9affab6b82a356837b2d6bddc82ee3dc3271dd917c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.11esr.bb
deleted file mode 100644
index caabc6f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b14a15949dab8dcfa8cf4c650ab7f7ce"
-SRC_URI[sha256sum] = "2ca127fc72121b42cfa879bc83614041388da802518668c16511b9d252c9f8a9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.12esr.bb
new file mode 100644
index 0000000..f4e276f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "fc9b36fc2d1124e9f75d05cf1800bcd3"
+SRC_URI[sha256sum] = "d91bf32eeb9de681e216964cd095229ff89cee79fa636edd3b0f4ae263a36d6f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.11esr.bb
deleted file mode 100644
index d2afef8..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "a91c69396c0bf908671abc34223d274b"
-SRC_URI[sha256sum] = "43ec26eec3280d79f8ffd18b42b0d4d1f8e290f64a4d7d2b3241c6f428c20a26"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.12esr.bb
new file mode 100644
index 0000000..e594823
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "657afba75647ed1e0fb65b4056994f3e"
+SRC_URI[sha256sum] = "85890bca4c0e415d4888f9b2e66cf47237fe07a5fc7132b8578492a8d3454f68"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.11esr.bb
deleted file mode 100644
index 97ef2cc..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "388f6eb8212ddadcfc0f7a20adb2a4a0"
-SRC_URI[sha256sum] = "9784161ef50ecf8a0037901fc867938575c2fc8691f1726bba303efd6b9be776"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.12esr.bb
new file mode 100644
index 0000000..0d02663
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "dd6ee6e45308d75fd544b6ed0a42854c"
+SRC_URI[sha256sum] = "df940cb5e7169740f0d3604e5954dd79f255e54578d6931e6fa7a5c1117f5f9e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.11esr.bb
deleted file mode 100644
index 01e1815..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "9150f9a2ca8fda7357a3988ab5883f5e"
-SRC_URI[sha256sum] = "96b782caf8d73fe848cdc1c851f6b325a140cf84c7d40a0cb1d13602bc2dbcf9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.12esr.bb
new file mode 100644
index 0000000..dd97c1c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8de8521ae43fea74760145104beed758"
+SRC_URI[sha256sum] = "844ae2069a614fb33beb18d95659bae3af62dcb497ae4d67e155ce5ec05dedd2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.11esr.bb
deleted file mode 100644
index 2ec18b3..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "e55e3836d045e4f067f41a275c2f6106"
-SRC_URI[sha256sum] = "53e28ab8af1550d6f913841afc44c098a3118a3701aac0de8475250d1059517c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.12esr.bb
new file mode 100644
index 0000000..a3c7645
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8c2fb294898ce50c30c59c74e9794e10"
+SRC_URI[sha256sum] = "97d829a2c7f31575f8c6ef010d1568ebf17b046ae2cc2e3a06a229910e6a5a93"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.11esr.bb
deleted file mode 100644
index af1a414..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "09080b30adafd30b629fa5360efc261b"
-SRC_URI[sha256sum] = "059d36645fa9099b35f100cc2fd75dce78be7c40eb8c969668b7105e383309a3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.12esr.bb
new file mode 100644
index 0000000..5864e10
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "849ccebe1734608daaf100d76af642af"
+SRC_URI[sha256sum] = "b6d3c5d340c5adad2859d57ef9879d70b515f03da07006152e78e1d84ed9210f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.11esr.bb
deleted file mode 100644
index e4b33f0..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "c2a33edf0ef3812894fe712b64baf9ee"
-SRC_URI[sha256sum] = "30c0d33590c2ba72ae9a1e22ecf5214ca3f44e24db871f337f8a169409b75f74"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.12esr.bb
new file mode 100644
index 0000000..f4469ba
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "1e26c844241378906d4a659ffbd4cfcf"
+SRC_URI[sha256sum] = "a46e30922068dd1e74d9a2acc6c5136c4b55a344bc9d7c52afc3336fb0db9b4e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.11esr.bb
deleted file mode 100644
index 85ae033..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "c7343d81b5b310f3e9dd5ede1d90a75a"
-SRC_URI[sha256sum] = "6e2488e7136dc5d67548d806175feecd0d94b75f48901e023305c7befda9268f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.12esr.bb
new file mode 100644
index 0000000..2ef30d7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "3fb6ae874a60c9613f84bdb442350f7e"
+SRC_URI[sha256sum] = "d901f4a9f1067682058d9129b7bb95a9cc9ef87ef509719fd45e6f8de942adff"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.11esr.bb
deleted file mode 100644
index 312cc4f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "0b74b2964b44555dd94945536ce57f15"
-SRC_URI[sha256sum] = "18a012130ca0501a6ce700639d4223837738886a1cbd70b5573011c3769a9c54"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.12esr.bb
new file mode 100644
index 0000000..09e45ce
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "480fea7e61c3b0d7eff0541ea0ddb853"
+SRC_URI[sha256sum] = "d21b0687c2650829fd1e055331a3bb1810a11f9da59fcb8a503390074d299817"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb
deleted file mode 100644
index 28d87f3..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "bf548055fecc52e5ac41e484fe1e98bd"
-SRC_URI[sha256sum] = "b392ec30ce941d4761f2c53ccca02edf7be1b8f06390642b584bdfb2f8705e6c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb
new file mode 100644
index 0000000..a889870
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ea8b587ae206d988c34b970ac0eb6c88"
+SRC_URI[sha256sum] = "4d74084f6b1a95594f4fdfadbce98bb795ef6419bc3cc6d83f019de16674dd44"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb
deleted file mode 100644
index 89588f0..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "7621011f267c7e8f5ac894aa4acc4f33"
-SRC_URI[sha256sum] = "6b9df8158e63b30bad7f112852408cda926f89677a44cf4d9a37a2bcec635eff"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb
new file mode 100644
index 0000000..03d0224
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "b13987e7ef607946556f5110d4ffd797"
+SRC_URI[sha256sum] = "6d5b7decc1b537153b40c8fc31081da50122268ba8f7a7e87df7b4c2ad819a09"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb
deleted file mode 100644
index 944fcd7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "fdbec5d8503ca928f674acb068e5c385"
-SRC_URI[sha256sum] = "e481c04f33ba14f4760258ada9ba5727ec501a3399a4ab1bde5a5446184f6146"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb
new file mode 100644
index 0000000..af4b762
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8d6fb025dc26d5d8920e94542dbe917b"
+SRC_URI[sha256sum] = "2963f434230260f29bb1f69a1e2638568f6c10080d1c4179bd5669d537a6fbce"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.11esr.bb
deleted file mode 100644
index 58e9f2e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "85e78651109e4a1a8fa2147e69651448"
-SRC_URI[sha256sum] = "4b11045857c9d215826bf13ae3a8dac8b8e87e3441593d49b263aea83a48ea26"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.12esr.bb
new file mode 100644
index 0000000..711a2a6
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "b269bd02363bb28ddb6881b25fa50939"
+SRC_URI[sha256sum] = "567f923ab879afbda71121a5b52660fd179c67e97e43ea5908bf155d5a4c99dd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb
deleted file mode 100644
index 91ec413..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "1d062ef69b128e15eba47ca289dbc30d"
-SRC_URI[sha256sum] = "d3fb903212edc4a40c5004fee75b0f9f1c0e04583c8b289192f22076e0c98cd4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb
new file mode 100644
index 0000000..7f4020f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "027ab81e8fa06c4e92bd514fc8b38535"
+SRC_URI[sha256sum] = "0b008ed2230d7646858411d0b2225458e319f14661330e90ed11cf4955a31aa3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb
deleted file mode 100644
index ce379e9..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "e4c0a8e17a0624d6bd2a3b7546de3bd0"
-SRC_URI[sha256sum] = "0630d0535e6930818ad685567b8d83a860ea3a3f5791bd5d1f0ae20a8ec95dda"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb
new file mode 100644
index 0000000..d58c0ce
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "4158a2ffc07f753fb31066258142d43d"
+SRC_URI[sha256sum] = "ecf68a7a48908246a24b6a1e498da76312dfe8375576e604f327899c241aa660"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb
deleted file mode 100644
index a3d90da..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "0b4a2bca0ff661336294437fcbd0763f"
-SRC_URI[sha256sum] = "fb3617624d8606a3155a224078a26a48a01cc7537f3dfa63acbc0b17c21253fd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb
new file mode 100644
index 0000000..9fedcdc
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7d8482919d5c6ef6965c442bb84d0e62"
+SRC_URI[sha256sum] = "4dd4676e59048de312bd3fe6084663281076dd90ab63725b2bdfe3862089b686"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb
deleted file mode 100644
index c0ed96d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "d56a1eb7355840de6756af6c33e05e24"
-SRC_URI[sha256sum] = "86bd2bb3d9b5480906f8c060432bdb824d616dc1376536cbd3d7169a65afdc64"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb
new file mode 100644
index 0000000..4c59a6d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "58dad5b3a614b161156f7642c4522890"
+SRC_URI[sha256sum] = "a17d54a81de9a3f81a7f56adc25f4f040b7e29a28ab946834c5a2a08152fe0d6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.11esr.bb
deleted file mode 100644
index fa6b608..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "79b3c229300e0900a7d33ee3ff0572fd"
-SRC_URI[sha256sum] = "a507c129c1cffc8f3cf1d824f3684ef91d3abdb12d3cad9e9665e6824289495f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.12esr.bb
new file mode 100644
index 0000000..2d08406
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ee8e35e6bfee1814610ba195fd936789"
+SRC_URI[sha256sum] = "4e04dabb3f5dbe5e763f764e48f647f152eda393b0f525aa32f2c0cb42531e9c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.11esr.bb
deleted file mode 100644
index c51b504..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "7239fd87d0269a238c3a8280f4438fef"
-SRC_URI[sha256sum] = "a2dc136240db5c0ff1215674c415624e8f21dd8623dbe87725ef6c9d2226fb1d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.12esr.bb
new file mode 100644
index 0000000..9dd0f42
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "10369d737299aea54b734a369ac72a1a"
+SRC_URI[sha256sum] = "86047af8b5ac6e372c9a5b061fb3df6287a48aa28ec8c379d0cd40cf1a630efa"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.11esr.bb
deleted file mode 100644
index 541cd9a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "5ddef0d87bdc0820acfe2de0fb40d08b"
-SRC_URI[sha256sum] = "4d740a9f10d053c58358b2a98557954ca718aa8484786c8259752b2c395b0dd2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.12esr.bb
new file mode 100644
index 0000000..fb6d9c0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "5a569b5e667bdcc0bc21b6cdf89f7fd2"
+SRC_URI[sha256sum] = "c596082d60d9db633f0228eccac07efb257a222b606f9a388aef2d4906fad7df"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.11esr.bb
deleted file mode 100644
index 811a047..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "c95dcdf825bea695ab66084f1814e25a"
-SRC_URI[sha256sum] = "72e96b22cec634a5a05524c17aeaa2480374d60cd6862e5a4aa9bda0c6f29a37"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.12esr.bb
new file mode 100644
index 0000000..b2c2297
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ecfc9f86287eb154aef8a370692443f5"
+SRC_URI[sha256sum] = "b2e7e8507789c75135582bb8f7a56fe1ac866fce75d4f353b0e613170c9dd4a6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.11esr.bb
deleted file mode 100644
index 89396c7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "3c944b143ce943dc1de8d23a70a0f148"
-SRC_URI[sha256sum] = "31811aee809cb8896470d5f9e279e44e2ffbaa99b7265a9e21a52c2c35324c68"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.12esr.bb
new file mode 100644
index 0000000..488558b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "283cedef2bde143989e1161c7dbcd650"
+SRC_URI[sha256sum] = "e6a6f455e9b0325fc836060d2e2cca71acfb13296017293f018437346d79c19c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb
deleted file mode 100644
index f4f163c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "2fc234bd271bdd9ce868f0047cbe4cf0"
-SRC_URI[sha256sum] = "b4282711697e6dd54b31765355e3cc488c00f375022ce81dad0a8d73bad07d2a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb
new file mode 100644
index 0000000..6d83974
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "72fa2c81af3b3d7831fb43fec8e35a44"
+SRC_URI[sha256sum] = "470ed8f1d8fe386bc3675f67680a3c935f6b5cdc7d08ea8ae4e010739f10cf90"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb
deleted file mode 100644
index 1bcf3e6..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "4b2f6454f3a7094882afc0e3ab494bad"
-SRC_URI[sha256sum] = "33cc30bf1b2a4bc028db85eb83387a393c8e306f703b1b6e2b282e661d71f584"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb
new file mode 100644
index 0000000..30065d7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "867dd8d96873c1ff4604b1fda84e4bea"
+SRC_URI[sha256sum] = "d82c95941c6820a878f37c6bf2e4070a855d3e8b13ee2635f88e65473c9bf7de"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.11esr.bb
deleted file mode 100644
index c5e2e75..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "f1319904fdb10c1b3ef6f12f28d319fc"
-SRC_URI[sha256sum] = "768594a4526184c4e8e48698f3b87ad94c325b2a8a9dc98dba106a1a702a5f1b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.12esr.bb
new file mode 100644
index 0000000..9a34182
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7cf6eeba11bee78f1db75d44bd498dca"
+SRC_URI[sha256sum] = "62b166368da8b91a7c593801c2fb8c791e0579c6a12685bff5389301b9692a7c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.11esr.bb
deleted file mode 100644
index fca697f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "5b6ab4f347619ae01de03df7f798803c"
-SRC_URI[sha256sum] = "96a188af032c3dc13976475d97b936ac7f3e6eb6ee8d4a6cf54494d122fd9f69"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.12esr.bb
new file mode 100644
index 0000000..c7e67bb
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8d8c3493a07b9082860cf84bd945e5b2"
+SRC_URI[sha256sum] = "f5b4a1884103fbf70869cc0c6e0971d6cc14f0ba7c70ecfe9763460024ca6487"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb
deleted file mode 100644
index 10aa2a9..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "c4c3dca0fef1bfe9a5d399d4f1942edc"
-SRC_URI[sha256sum] = "facd8483801bc169a9d5ee4674e5a9ba343b0348ee4957158141f73bf291e8db"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb
new file mode 100644
index 0000000..63774e1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "b3da4d1a61f01f48126f73451403e8ee"
+SRC_URI[sha256sum] = "9de19db6fee44f52c838dfe28b823b6420ec01ab771c6c967528cfd0015c5ccc"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.11esr.bb
deleted file mode 100644
index 4c9398d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "2e06fb09c0078aa0405dccec5162a255"
-SRC_URI[sha256sum] = "bf586d97424d0b07e7bd08ccb7dfd65eb66a9f00d8bec0a9be79f8cea10a85a0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.12esr.bb
new file mode 100644
index 0000000..7123c7e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "19ab7f1e68ffe50f6f40a8e8c46f133e"
+SRC_URI[sha256sum] = "ff8c9cc6568a556c01e47eb398be44f4ff5fae1507272c01f77b7f31210fd2ad"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb
deleted file mode 100644
index f3b2587..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "40cf834613f38c3de24cb8956484e6a8"
-SRC_URI[sha256sum] = "2a7f647f27b118ecb238ea39739afcb285347fdd581d2aef6ee31921d5f88187"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb
new file mode 100644
index 0000000..4ee1cc8
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "db60a38982509666a2202ca513d8cf6f"
+SRC_URI[sha256sum] = "bb86e201c5eb5395eab16edfa2ab4453cf2d0a1053a6ef8392ee3da5883e39d4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.11esr.bb
deleted file mode 100644
index 02ebe22..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "16bc70ee0d694cc1cb0319cb722f6f7b"
-SRC_URI[sha256sum] = "aa4a53ecd79c026bd28d7be2a8bc62f6a97b129e3f9c6b4b7d9cf64e9c5797a3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.12esr.bb
new file mode 100644
index 0000000..5e632ee
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "dc35837bbd4961f3e13972c67072a82a"
+SRC_URI[sha256sum] = "b4559dec7bad9ed97798498cfe386b3a475e2efc67e97d378ebc6711082d1010"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.11esr.bb
deleted file mode 100644
index 5433471..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "34f5e62b4674cdaf3b3f4ece56540406"
-SRC_URI[sha256sum] = "dcccb43804ff627cb2bf6404e961b0cc7beab8d8c1318471ad7117fc1154a2ba"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.12esr.bb
new file mode 100644
index 0000000..4f010bd
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "c30cf67ce1b16a657aa1b1734ad5c4d1"
+SRC_URI[sha256sum] = "605d8bf0293967b7e55ff3b7107106230817249726c1bdbf513a18e4cd6a4adf"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb
deleted file mode 100644
index 75fe175..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "f7405f329b64d8b596c2962fe847a3a3"
-SRC_URI[sha256sum] = "483dd0db1b5ef9a22f6069e372467a9e683863dfd20c5e2aa74c7d8d3b9fb842"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb
new file mode 100644
index 0000000..6e36849
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "327f2ea498b08bb119630a23ba81c395"
+SRC_URI[sha256sum] = "e0606d14afc0607dc4308aabac6c660146571e4494520fc97158dcd71fdbef1f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.11esr.bb
deleted file mode 100644
index ac13d8f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "23928c032ff024fee398f325a0405af4"
-SRC_URI[sha256sum] = "e527a326a558be79a787fc53cb1e1333cbc99d555f256c4570ecbd7f79ab927b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.12esr.bb
new file mode 100644
index 0000000..a5625f5
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "0a51785e7122a08ac93db806c58f1450"
+SRC_URI[sha256sum] = "70d123916f587b933ee1724565bdcd5033ac270b2556b7342886fd76cae56235"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.11esr.bb
deleted file mode 100644
index 588a258..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "a33546c8d1b2d1848ec2da9c28d74dfb"
-SRC_URI[sha256sum] = "5fe7ae96611fad428064aedffd35078df7ad59eacaea80c74b84deb2d0affaa6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.12esr.bb
new file mode 100644
index 0000000..a758f47
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "784cdc9f2f8ed756783597eb1fd204c7"
+SRC_URI[sha256sum] = "29ba39f7c363bbbac34a95d7d2af610f1e05a140ad04246eaee8d50dee1b9c73"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.11esr.bb
deleted file mode 100644
index f035076..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "bc7c7aff1b76be5311773aea366671df"
-SRC_URI[sha256sum] = "3090a4c7144c2dc3da2e48e12d6de8948af810230b9ed148213af304f0652fa1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.12esr.bb
new file mode 100644
index 0000000..cd66340
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8cc49edb54910ca782ea14c0d166a51e"
+SRC_URI[sha256sum] = "6e533b3610fde4b917f924154f6ef5b7f9593128d05df655dc7e1e46b4cec10d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.11esr.bb
deleted file mode 100644
index fe357ea..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "5a8d6c07e4f6a3d5c4eb8482c51ef451"
-SRC_URI[sha256sum] = "0f8b69eb5ddc9b2dd3980f643a0961721efec591c88810fb089e894b8a22ddc3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.12esr.bb
new file mode 100644
index 0000000..96b3120
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "5ab9664966f502711f3703a60896a971"
+SRC_URI[sha256sum] = "3b2e1008033f8e80c135e4f7ee9cd96472be87d7041078cf99575e37c29caa12"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.11esr.bb
deleted file mode 100644
index 397e28c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "833f0f6da712a0c57c0c1fc3fcfc1885"
-SRC_URI[sha256sum] = "35a71e82a33ebef14cbbc86bf58a0223356aecf1a5607e81c75c2f2b206f2c1c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.12esr.bb
new file mode 100644
index 0000000..8ccf8d6
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "51633b555e17c58703db80a3183206dd"
+SRC_URI[sha256sum] = "1e32dfd312adbba86e06e88790cc934c4d1dab6c1a1d611f0bac4cb5fa05456e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.11esr.bb
deleted file mode 100644
index 84089d0..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "552936179c5bf0554496fe15fe0036b9"
-SRC_URI[sha256sum] = "4c3ceac9bec6807115249f2a6eb8481dd06b1f88e85e8bd7047fa94187b146ee"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.12esr.bb
new file mode 100644
index 0000000..56520e0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "934dbb4d5982ed1f32597d7709cdf895"
+SRC_URI[sha256sum] = "295ebccf2462e33facc6018f1124a888e12fd1ba23563bf9545ce4588669ec4e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.11esr.bb
deleted file mode 100644
index 38ace03..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "2d2a5f0fcbc2fa60c805b63a1298ecf7"
-SRC_URI[sha256sum] = "c789168594f6575a1127f9e6e9fc7b01516410a9af8dc6c54b3e33539893320f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.12esr.bb
new file mode 100644
index 0000000..5da6f96
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8dc5155cba07ad55849175a2b551c333"
+SRC_URI[sha256sum] = "7613f6fed1915aa2f9eb19d3b0457c15fd1a871a8e08b090db90c131defc36d6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.11esr.bb
deleted file mode 100644
index 1eeffc8..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "2db725e68c9d3a2f383a9c885a5eb23e"
-SRC_URI[sha256sum] = "5dc01d26576ea193ebb0ae6191da70be1b0ea4fefab3f83933ae7df6d599408d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.12esr.bb
new file mode 100644
index 0000000..a6de9d8
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ea842f8bb93e6182ad41772051754acf"
+SRC_URI[sha256sum] = "f5a5d768af61c1336c1f532f1cfc68e847799c19561591015b70551aba7ccc44"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.11esr.bb
deleted file mode 100644
index 10626e7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "8396078d24d9b3e13b8ac62839e91ab4"
-SRC_URI[sha256sum] = "e7a64db780496953dfb9d623307ef087f09009daa4c0e1161e99100e5c971339"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.12esr.bb
new file mode 100644
index 0000000..bdc504b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "44fb84f92a3d6e2c4ab6db71868af786"
+SRC_URI[sha256sum] = "127028d15502046ed87efa35d47bbc9ec705c09ceb26cd65c37ae1793e4ae4fb"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.11esr.bb
deleted file mode 100644
index 5dcfd83..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "30a19199a4ee543015f052d2bf921a70"
-SRC_URI[sha256sum] = "13fac6431709afd0741a94f4f3ecd365926b43c4a01f0eb1f4e592e32f62113c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.12esr.bb
new file mode 100644
index 0000000..086cfb4
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8394c1a81a79d4c87433da4e2514e8a1"
+SRC_URI[sha256sum] = "64c3cd285a2d6e489513c48d7c6819459329d38e1d0fb83be97094ce7240b065"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.11esr.bb
deleted file mode 100644
index 666cfb7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ec88dca1799e93d4d04a2e709afbeff4"
-SRC_URI[sha256sum] = "6190c2da9b08c0d75f430a7d30a06e7b3991cc888cfe491e512b3ceb49b9a6ea"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.12esr.bb
new file mode 100644
index 0000000..fdddf7d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "dec5d2d3c954ff9a4c0bee17f237685f"
+SRC_URI[sha256sum] = "eea9ca25dd45f1257131e32474ce0f46a04b5327b333afa77c1809d7a017bf10"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.11esr.bb
deleted file mode 100644
index 9f07c1c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "692fbe858b0344d476d439301530520a"
-SRC_URI[sha256sum] = "4fbe32f1dcf63e78950a95fa77caf78e93e54a7a0c88be5bb73ac07d89cccf6f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.12esr.bb
new file mode 100644
index 0000000..34ad951
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "2cbcb8c7f0213d74ccf3322d2545459c"
+SRC_URI[sha256sum] = "cb7731bbd18f44f53ef79134e29b47c1b6df75c811b2d2514b7d2ece6442d855"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.11esr.bb
deleted file mode 100644
index 8923f4a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "c07bedf6f375d8f257f480a49c302bcf"
-SRC_URI[sha256sum] = "71ef2339a6a8b4bb6e6f8a755c8250aba8e4d214fbb36ca2bdfcb219cbfc1e9a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.12esr.bb
new file mode 100644
index 0000000..e31e04d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "48a3962aebd8cf08a29cd290f95175b5"
+SRC_URI[sha256sum] = "15c5cf3bddf26c5d54e88a6806a730ac1816694fe5b946930307097bcfa3224d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.11esr.bb
deleted file mode 100644
index f4652f2..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "eaec4aba2593a8d5ea4874e7358b02c0"
-SRC_URI[sha256sum] = "0931b0d3302867d43724e61a7912988f44de9d72d671a7c70675cb641efa72cd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.12esr.bb
new file mode 100644
index 0000000..2614634
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "c5fbcb56c76449c628cc5ea537eb31ec"
+SRC_URI[sha256sum] = "fd8b7b2c706fb013f452d27a4b5f908504fc712458c6488b8cbdb631ccac1ba3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.11esr.bb
deleted file mode 100644
index 458ac86..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "99a341a891a5ab9b9630486c1440d104"
-SRC_URI[sha256sum] = "f10a7722375b3ec12065beb08ddd0c1da87e6d6bce92463a7ca15765d54d52ea"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.12esr.bb
new file mode 100644
index 0000000..19a8844
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "99f63722c38a275a24e3e25288117414"
+SRC_URI[sha256sum] = "a1e1eef9671fa728fa59a8e682d419b30e46335f822232175f41e512e86500ca"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb
deleted file mode 100644
index c408883..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "1b342c1a425e0c3d23a00d760ca1bf30"
-SRC_URI[sha256sum] = "c5b49962a4f5cb7c81fb72428478ccbb9cfba4508e6916b4ce0968caa5b95ab9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb
new file mode 100644
index 0000000..26a3d2e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "5ac2f7fe64fe4c89a32f63791135eb3f"
+SRC_URI[sha256sum] = "193730e08a92f2bff40c900193a800adf5298436ffb7fcf605f9ae03b75fd884"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.11esr.bb
deleted file mode 100644
index b75a193..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "99e92201c8623356cef2a08f98ee014d"
-SRC_URI[sha256sum] = "b05fc760572c72dafbaa53c2b249e19b5fe119568cff724ee1a7410bcb8eaaa8"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.12esr.bb
new file mode 100644
index 0000000..941825f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "4133d8cbf2bc90721a902e3abf8d700b"
+SRC_URI[sha256sum] = "7413cda659eb5b8d18b00b300d214b2d6912a1174ba09055710ef4243fa235b1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb
deleted file mode 100644
index c31f9ff..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "a419902f9dd91ab5b6c3c0f314574192"
-SRC_URI[sha256sum] = "b25c05f8f767ec38c5a40c10330a7ca93509dfef5769997170b9aa7caab367e8"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb
new file mode 100644
index 0000000..55ec070
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "45606f08a063ecca7a18d3aa7172a0b9"
+SRC_URI[sha256sum] = "968c1256ae207b2c972a97a6d80f675521bab2d9a63f1487c65c1488cdaaa9e0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.11esr.bb
deleted file mode 100644
index 3b9d840..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "7dbacf9701b343ed2e5f35320693ca4e"
-SRC_URI[sha256sum] = "166d3c6f4b30cfa51bdddd04834ff95461650c41bb83c02482f12f119f0630a9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.12esr.bb
new file mode 100644
index 0000000..5957d8d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "033bf193c4251a1d3a333ee781d65b02"
+SRC_URI[sha256sum] = "3913b62c517495eb80f15d47d0a8a27db3d42031ebdeb8c9eb6e8af0a05d5518"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.11esr.bb
deleted file mode 100644
index 2913b64..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "fe630c0a8b553c1ba19e37cc72b0be9a"
-SRC_URI[sha256sum] = "3353de0d6b62d5b604bce992504354d3da22c61aa591392833058020b00bb182"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.12esr.bb
new file mode 100644
index 0000000..f03ed57
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "8f3dc3354297906d74ece9218feb8ee6"
+SRC_URI[sha256sum] = "b29ff9654b439a487fd8c195fc710f0e7c7151cd0dfaa881d6b3cdebd7ee5a8c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb
deleted file mode 100644
index a81cb04..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "c28c8bdf0d0807dd20e3db34309a4a72"
-SRC_URI[sha256sum] = "4b0bbbd5bb310711abea9a347747cea6778dd3e5c01a325023e86a5cc710bb3b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb
new file mode 100644
index 0000000..3466818
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "d9e7e14145c99cc6d73b8fa5cc4ec9d0"
+SRC_URI[sha256sum] = "3392b9dab192d4c6844e4927f81a8b45ad7f099a4eee64025f0f917d9448da1a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.11esr.bb
deleted file mode 100644
index fb00825..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "d437125e1009b0f12128ba7f766a192a"
-SRC_URI[sha256sum] = "b3c34eb9c030976f6acd45247c70725c22ce0dd1262376ab155e73670b627cca"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.12esr.bb
new file mode 100644
index 0000000..e3d54fa
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "f64c928d07b745642aa3e7fb7adc56e5"
+SRC_URI[sha256sum] = "6b2387cc699b80360ec43e48f44a2600bff1bdf6c424ef3cdd6ed13813802b51"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb
deleted file mode 100644
index ed40e7c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "d264fb9b0116eece43395acf1528ccd7"
-SRC_URI[sha256sum] = "2a87614897d01560f6eca36c94bc988805b7a6b2b896e11668da87174c36fbb4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb
new file mode 100644
index 0000000..9944c12
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "077f3e424ae219176c4a39cbc21f36b4"
+SRC_URI[sha256sum] = "4bcdd89faa32fcb5e0d51a5e6987de58250437191cb8f44d248ce03dd6b7cc11"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb
deleted file mode 100644
index 2f15815..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "675a0ea6ea04234b17b99c0f80b77ab8"
-SRC_URI[sha256sum] = "7bee6a6533029db35546bd401ef2b6cd60edf5c8ec334181ab3e4a915ae24c35"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb
new file mode 100644
index 0000000..00410d3
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "5bf54a3c9081ab713dd2dc65b90364ad"
+SRC_URI[sha256sum] = "540c41fa445af03b6b8567cc268c55fd5923d4179c40c6b1dcdad51cfc264c0a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.11esr.bb
deleted file mode 100644
index 3545c14..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "0c0ef89c5e014d497889df88b33e6365"
-SRC_URI[sha256sum] = "31190db630ee3dbb8f1fc8f097dea93eac380ee99e87b581b919d3a47af02f98"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.12esr.bb
new file mode 100644
index 0000000..89ea185
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "d4f2b425ed92c865cf2460b86248e3b8"
+SRC_URI[sha256sum] = "9cf6980f8db99b1994c0bb93cb98b52022fe3acbb1ca669cdd00adda501903f9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.11esr.bb
deleted file mode 100644
index 4409d40..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "50abc165ca5b92e39f686080c80e702c"
-SRC_URI[sha256sum] = "45d422e0719308cd2540bd331b7439579b265e9679de1051e7f8e006ecbf0899"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.12esr.bb
new file mode 100644
index 0000000..1fa5e1c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "23af6ecc67918d668407f65352088060"
+SRC_URI[sha256sum] = "a0058912493ce8f9f8103a7f0d006ea55297af86c23932bf4c1df0f0f6065fd1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.11esr.bb
deleted file mode 100644
index fc02793..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "81b25728f8354ab267ccc15e55296e3d"
-SRC_URI[sha256sum] = "b856c77141af93ccf0268278e7325e6367da86c53d3644089ea22b1e8daec828"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.12esr.bb
new file mode 100644
index 0000000..23fa0e3
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "40319a20c369399a1a95b597c50cabc9"
+SRC_URI[sha256sum] = "20a6c9f6ffe85900bdc615e7f833586fbc51e49d0a68d46cc637f1af978515ef"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.11esr.bb
deleted file mode 100644
index 57a3347..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "3b544db2fcc106d80b2f82da6a482efc"
-SRC_URI[sha256sum] = "16791cce9532b68b946e90015235e24f7b9b3b7f3931c222449f0da9342624e7"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.12esr.bb
new file mode 100644
index 0000000..5d5a807
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "90999b92bb9c55127416effde548cdaa"
+SRC_URI[sha256sum] = "88b5b496bc14b392ff9f0d4105cc89cee74663f7976101ceb36052a89121ce16"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.11esr.bb
deleted file mode 100644
index 42b7fbd..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "cfca66b1443852661c52b5cdcf79ff93"
-SRC_URI[sha256sum] = "a4585d5dc8052f53c8951892fd72a2c853d92174e94ecd1a002451983e461d6d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.12esr.bb
new file mode 100644
index 0000000..c497a9e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "939d58242cd50b247e6293705519e955"
+SRC_URI[sha256sum] = "2f58012a0f4cd304a920392674096db784bceee5fd5b6e2766130836fe080d55"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.11esr.bb
deleted file mode 100644
index 266ace6..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "6c55f43d10815aa4795137a8d3052181"
-SRC_URI[sha256sum] = "fd2747d6f0e5949fcd39d4e7a6cc568a417fce034b1cc94615c5216070f3dcec"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.12esr.bb
new file mode 100644
index 0000000..b2e6d1e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7ef90cf8408341bf6d94efffb96275d6"
+SRC_URI[sha256sum] = "b5ea8d81cecf8dd0608dda3c54d07d928d5fdb235ff689338e8baf127a47ccb2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.11esr.bb
deleted file mode 100644
index 56c8cac..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b28ae14429ec3c78df05b5c40b808525"
-SRC_URI[sha256sum] = "01fe863e1bd6a0d75d7d64663f8550e70501f63454eb3d919e5c7d3ccb806610"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.12esr.bb
new file mode 100644
index 0000000..8de1434
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "3deaa5b6f52d5e5677da30f1a66c03ac"
+SRC_URI[sha256sum] = "f636b42f13657546f6086f52aea799f899f4d0c316dc825240b759db7e41c08e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.11esr.bb
deleted file mode 100644
index e00963d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "4c9232eb01117cbce09a2808870fb642"
-SRC_URI[sha256sum] = "bbc5088737f3c3fdf4c1f0e099bfd21ab20afaeff544095a0fc0e9b39c45771a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.12esr.bb
new file mode 100644
index 0000000..51e7c94
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "aed0b2c05e4ba8145182122ee1f7e391"
+SRC_URI[sha256sum] = "c3a8d6154da20f45417cbc2a8ea1506426c84b604d6d5f4e0b2e1c4ff3ed4597"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.11esr.bb
deleted file mode 100644
index 536f01a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "526a84cf109a342a5b778d2507a6036f"
-SRC_URI[sha256sum] = "635a327b322995d2bbe0967bc7bead3c19105dc27476e6a657981fe1d095693b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.12esr.bb
new file mode 100644
index 0000000..fa65efb
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "dd559e81b95d9743d585b8b843a88c89"
+SRC_URI[sha256sum] = "47eb3ae29732d71408eaacd2d2346f3b8d6a844eb3c058e26f62f18057081e3b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb
deleted file mode 100644
index 501dd6e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "c90b91251e08f822f8105d0a8921a72b"
-SRC_URI[sha256sum] = "0e35b899fdcd77a00a76833911862079ea2777f705da904d0b7693d4a1e7958b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb
new file mode 100644
index 0000000..5ee613e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "851871dc4c8f5a83cc4cf98ff6e53e08"
+SRC_URI[sha256sum] = "b8c52caed67af9850c4b54d1ab8ab84a984d361c1531260d6560aab23b002553"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb
deleted file mode 100644
index 9d382cb..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ee42c9f050fa5ca5791119207539792d"
-SRC_URI[sha256sum] = "d5e1f81c716bb307a73c1d25ec22e72666b4f9e27ab2921859cb96082bbc05d5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb
new file mode 100644
index 0000000..db77c7d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "71551c25e780f052547d7ccc648a5640"
+SRC_URI[sha256sum] = "c8b0774f386e378237af65aa7bb034bb1abda1e4b6b02b53d30fa4b50c09fbdb"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.11esr.bb
deleted file mode 100644
index 624a822..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "53fdd689b4badfe13121cda96150548d"
-SRC_URI[sha256sum] = "5ba580f167a9bf1fd28d7a1d82b33f5d0727693b926ece0e28813250542d0345"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.12esr.bb
new file mode 100644
index 0000000..ddc3cff
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "3a688b30114da995660462f0cf8751b4"
+SRC_URI[sha256sum] = "122e636e6f32e5fca5c99a4bb088e5f9eaffd71d0aca739a8e19fb9a339adf23"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.11esr.bb
deleted file mode 100644
index de1693a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "ab3f8eaae10e46c62a251f949ebf213d"
-SRC_URI[sha256sum] = "49f3f8ac436c99cfaba4d5870a8b7e52a36534ff6eb1dd96b9204858da93534f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.12esr.bb
new file mode 100644
index 0000000..9ac073a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "fb34a6ce053fd6d5134e1304f853ef25"
+SRC_URI[sha256sum] = "1664e90a12b04ce01de0a496ff844cedfc3c99a781067f823f1ef2d6c7dad36d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.11esr.bb
deleted file mode 100644
index b0c22a8..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "19fb21b95adc4c47c5362ce1aa027578"
-SRC_URI[sha256sum] = "b37d9376d43608d0a96a7d52ec7548822936bb853dd08a0b62aac16102f5c0ea"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.12esr.bb
new file mode 100644
index 0000000..30b64ac
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "911b8d155e48215f6fbf1ae839a4acec"
+SRC_URI[sha256sum] = "c8e771db33a32763d9772e8c7e27887d15ca2bf9068415d21d8dff8147fcccca"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.11esr.bb
deleted file mode 100644
index 81e54cd..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "79bfea915507b750d7027ff1aaeab539"
-SRC_URI[sha256sum] = "bc690ed31ab5e890682ba08ffdd28210047394e3581ec960043028dc5bad911a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.12esr.bb
new file mode 100644
index 0000000..3d59f6a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "ea3fa8983c858f090dbefe7ab0b4e10b"
+SRC_URI[sha256sum] = "2b05d41c7e8013166b69f5d89387760636efc44a23cb30f6dd822ece6442c9d2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.11esr.bb
deleted file mode 100644
index 5b3cb82..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "92b979b5271158d5134892e10897c636"
-SRC_URI[sha256sum] = "ef7bd32e6dc545f4bbac5951446bb24cfdf092d60edc0383f20ce6ec9fbe9cb8"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.12esr.bb
new file mode 100644
index 0000000..c75b7cf
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "59fb5f10fcece7167021840b4856beed"
+SRC_URI[sha256sum] = "ab75b09462fe0addde32aebbf57a905c7f248e43aab130fbcce0d5450684d3aa"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.11esr.bb
deleted file mode 100644
index 366fc4a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "abd7bd9bd97ae54cb008433ab3f73e1f"
-SRC_URI[sha256sum] = "54e2954f1d24ee9935a5c4532575adc6ff133297de0b79ffb226031eaa863935"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.12esr.bb
new file mode 100644
index 0000000..bb0f12d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "842bf546fcdf02f6d8ee46f808e3bf5c"
+SRC_URI[sha256sum] = "000dead139dbff4415ad2d926f669e5a22afa9de8ffb209c47cb61c6c6322f87"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb
deleted file mode 100644
index 5ab7546..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "b94a8c40120b8fc771cd06c03fede64f"
-SRC_URI[sha256sum] = "7f948e543242bdbdd14de4d63cdbf81999b83709f1d9f964565f525b3e9de8ac"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb
new file mode 100644
index 0000000..f5b329d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "198b459a7b52d4a7488a7e47b1231f5b"
+SRC_URI[sha256sum] = "229e4467145b3f44b0eaef711e1c79b60aff5cd48691ebeb5d73a171d911e3e9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb
deleted file mode 100644
index 5a72b45..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "dc5fe151034465cd9837dd2197108666"
-SRC_URI[sha256sum] = "0d719d4d9635df855bde99c8bf654c5172672eacfd6d9d068706683464ddad2b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb
new file mode 100644
index 0000000..1e71a37
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "f503ea2dd25203e70c9faf2a65e20fa3"
+SRC_URI[sha256sum] = "2a51a0440d67c3e5067fab99ffed2f8142f058f10910d72b0fec4a461c33d04c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.11esr.bb
deleted file mode 100644
index 17c4e88..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.11esr.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-SRC_URI[md5sum] = "29def81ccb1438e471bb56b3775e35ea"
-SRC_URI[sha256sum] = "26ac7353f3a526559330e800899790698a3b92d61289e3dd19a84623b43bf264"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.12esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.12esr.bb
new file mode 100644
index 0000000..c319a2b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.12esr.bb
@@ -0,0 +1,7 @@
+# Copyright (C) 2009-2014, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+SRC_URI[md5sum] = "7d9d9d7a48a7e4bec69bc12a554210d2"
+SRC_URI[sha256sum] = "c91bfecf01d45e6c36dd31a5eacee1e5b6a2262dafb19a43da60beb8da6da747"
-- 
1.8.4.5


