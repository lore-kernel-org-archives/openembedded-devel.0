Received: from mail-yh0-f46.google.com ([209.85.213.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tryhg-0004Ww-I1
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 23:28:40 +0100
Received: by mail-yh0-f46.google.com with SMTP id i21so1218310yha.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 14:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=GNVvlv1DtSwwejKryQnIYslvg0TeCUjosdKQ44Qyg1Y=;
	b=fSy6+8fOb5u8GgQWagXsa3+NJhkFr0dc14g3b+HID+GGU7J+B+hcgFebsloem3mXTt
	Cc8pMkElRFCADmJWatwpTwihBSkktfS0dZsmHQAEEPn5WSXTBQ0nKRNWdqQJl+HMZGYx
	fQuomfoUB6zFQBZPd5ZpZp//3JYOGW9XVxQ67fNYIeg5sjA+P8Yzeig8qQhT55CqWKEV
	9pZh+YFZhr4fIiPSVWKIzN35KC2TejeOWsnKbY5ceF2jUnpyijkC3oV2M+990k2LqmLB
	9orsApdlnqIGOtXOuAyYz4CwzZIDHJ+x+S5/2wAD73wgX4FnmhN+thXON6fDAW6RnKPQ
	pqjg==
X-Received: by 10.101.106.39 with SMTP id i39mr3364028anm.33.1357510399687;
	Sun, 06 Jan 2013 14:13:19 -0800 (PST)
Received: from localhost.localdomain ([187.23.158.26])
	by mx.google.com with ESMTPS id x9sm64284375yhl.17.2013.01.06.14.13.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 14:13:18 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 20:12:59 -0200
Message-Id: <1357510379-14744-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
References: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-browser][PATCH 3/3] firefox-l10n: Update all languages for 10.0.11esr release
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
X-List-Received-Date: Sun, 06 Jan 2013 22:28:41 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../firefox-l10n/firefox-l10n-af_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-af_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ak_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ak_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ar_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ar_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-as_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-as_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ast_10.0.11esr.bb    |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ast_10.0.2.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-be_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-be_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-bg_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-bg_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-bn-in_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-br_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-br_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-bs_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-bs_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ca_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ca_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-cs_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-cs_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-csb_10.0.11esr.bb    |    9 +++++++++
 .../firefox-l10n/firefox-l10n-csb_10.0.2.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-cy_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-cy_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-da_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-da_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-de_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-de_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-el_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-el_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-en-gb_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-en-us_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-en-za_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-eo_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-eo_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-es-ar_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-es-cl_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-es-es_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-es-mx_10.0.2.bb      |    9 ---------
 ...-sk_10.0.2.bb => firefox-l10n-et_10.0.11esr.bb} |    6 +++---
 .../firefox-l10n/firefox-l10n-et_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-eu_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-eu_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-fa_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-fa_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-fi_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-fi_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-fr_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-fr_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-gd_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-gd_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-gl_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-gl_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-gu-in_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-he_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-he_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-hi-in_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-hr_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-hr_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-hu_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-hu_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-hy-am_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-id_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-id_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-is_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-is_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-it_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-it_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ja_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ja_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-kk_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-kk_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-kn_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-kn_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ko_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ko_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ku_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ku_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-lg_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-lg_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-lt_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-lt_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-lv_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-lv_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-mai_10.0.11esr.bb    |    9 +++++++++
 .../firefox-l10n/firefox-l10n-mai_10.0.2.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-mk_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-mk_10.0.2.bb         |    9 ---------
 ...-ie_10.0.2.bb => firefox-l10n-ml_10.0.11esr.bb} |    6 +++---
 .../firefox-l10n/firefox-l10n-ml_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-mr_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-mr_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-nb-no_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-nl_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-nl_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-nn-no_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-nso_10.0.11esr.bb    |    9 +++++++++
 .../firefox-l10n/firefox-l10n-nso_10.0.2.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-or_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-or_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-pa-in_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-pl_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-pl_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-pt-br_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-rm_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-rm_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ro_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ro_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-ru_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ru_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-si_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-si_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-sk_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sl_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sl_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-son_10.0.11esr.bb    |    9 +++++++++
 .../firefox-l10n/firefox-l10n-son_10.0.2.bb        |    9 ---------
 .../firefox-l10n/firefox-l10n-sq_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sq_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-sr_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sr_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-sv-se_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-ta_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-ta_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-te_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-te_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-th_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-th_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-tr_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-tr_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-uk_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-uk_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-vi_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-vi_10.0.2.bb         |    9 ---------
 .../firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb  |    9 +++++++++
 .../firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb      |    9 ---------
 .../firefox-l10n/firefox-l10n-zu_10.0.11esr.bb     |    9 +++++++++
 .../firefox-l10n/firefox-l10n-zu_10.0.2.bb         |    9 ---------
 recipes-mozilla/firefox-l10n/firefox-l10n.inc      |    2 +-
 169 files changed, 754 insertions(+), 754 deletions(-)
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.2.bb
 rename recipes-mozilla/firefox-l10n/{firefox-l10n-sk_10.0.2.bb => firefox-l10n-et_10.0.11esr.bb} (52%)
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.2.bb
 rename recipes-mozilla/firefox-l10n/{firefox-l10n-ga-ie_10.0.2.bb => firefox-l10n-ml_10.0.11esr.bb} (52%)
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb
 create mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.11esr.bb
 delete mode 100644 recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.2.bb

diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.11esr.bb
new file mode 100644
index 0000000..711a270
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "49462b42ebcfdd5c9a2c48375133ae04"
+SRC_URI[sha256sum] = "90ece8bfb785765f665cd15683009b1e35426b68e94205bd0b706902697fbd59"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.2.bb
deleted file mode 100644
index 00178ae..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-af_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "7f4701eb3a8a1e62e78f47eadbf9a91a"
-SRC_URI[sha256sum] = "daa87573d904a63438398e6a974848b8c1fed735f4daaeb08ccd3f8c6a36c93b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.11esr.bb
new file mode 100644
index 0000000..1bd7d67
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "b4987d56d15ade8af2a6136f1abbd73a"
+SRC_URI[sha256sum] = "9aea100e427b299226ea334c47d668200bd58bf630657776440c2ff32509f4a2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.2.bb
deleted file mode 100644
index 2c5355d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ak_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "05f2f4087edc60cf5568ebc012eeb151"
-SRC_URI[sha256sum] = "0010843264a6eb9b45a1b7bc26b202bebf77d1684de0babc3740cf399bce1799"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.11esr.bb
new file mode 100644
index 0000000..c2e020d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "ccd1e708141a3cecdafdf4bff5cf6d71"
+SRC_URI[sha256sum] = "1bf9bcf59939bb4a24ab1c36d1a8edecbf7c383484d3dbd56d5418a25dc95e96"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.2.bb
deleted file mode 100644
index 42a5d14..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ar_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "51b177d9ec096b5dd17966b28348846b"
-SRC_URI[sha256sum] = "7b6fa8c4ff34c25149992c7ab9bc469198aa92598c6cc42554ca6f91bb75dfa3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.11esr.bb
new file mode 100644
index 0000000..8de52b6
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "6da8f4df99d55daa2178634b021f1e04"
+SRC_URI[sha256sum] = "719e62f4992f4cb3cc9ca129e10b72794cdbce864dd76d75107a0dce08d994ea"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.2.bb
deleted file mode 100644
index 7de6857..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-as_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "65d168befac8473619536e9929e1ee2d"
-SRC_URI[sha256sum] = "20da82bf879a19302a21ed599c5fab070f556473a37a4003c1401c66b1b35d6e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.11esr.bb
new file mode 100644
index 0000000..472734d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "e81b1d71dbecb02b8a9556dbdac45dba"
+SRC_URI[sha256sum] = "e4ee31393e42505360a466e870abc28890c648a23f7fce8041dbf8b464628de5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.2.bb
deleted file mode 100644
index 78cc024..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ast_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "6eb7708684954fe6ff768852ee00aafb"
-SRC_URI[sha256sum] = "74aa3898790162e8b5d64a477683155e5fb3e5c93de04613125ea0152876e2e0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.11esr.bb
new file mode 100644
index 0000000..77fe2d7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "2d7a0e96a3f6ee5092cc34f7771378f0"
+SRC_URI[sha256sum] = "3b5a43bb9175bcd12d81f67d3699b7851dc44ef79b25f53aea87c292ee670982"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.2.bb
deleted file mode 100644
index 288f680..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-be_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "4f2967d89a5a944a48685d88717dc125"
-SRC_URI[sha256sum] = "34705c150939fa8e80d096209ec358c3cb149dabedf4fdb6fe04b1fd2bfc3c77"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.11esr.bb
new file mode 100644
index 0000000..60819b0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a17e04b45b12297a9eadf5d9119d29a3"
+SRC_URI[sha256sum] = "cfe29da7a6308836ca25531c44ab458e3e1bb484d2f743655d2157a31ef5d98e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.2.bb
deleted file mode 100644
index 39c2bc2..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bg_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "10e4703183c43a9d498826676c667a35"
-SRC_URI[sha256sum] = "41fdaa5bbde164b7b5d46f1c9274869fddcdd07f204bc986246c9224591463d1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb
new file mode 100644
index 0000000..d1f45d0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "4130e44ed071331e0c8b1fdd34262fa7"
+SRC_URI[sha256sum] = "8697b84e257a88664ec88e074fb39913289e15f3fe89370fdb7e53c09071ab5c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb
deleted file mode 100644
index 7b0e324..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-bd_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "abb0655ddb3f14cda06b54d7305accb5"
-SRC_URI[sha256sum] = "a1c447856394e01d5251192d4f29d0f7e9aac49c043ad1e5b4007903e766ff26"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb
new file mode 100644
index 0000000..107af21
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "b68302716bbb274f7a385559a91f265c"
+SRC_URI[sha256sum] = "f96afb1587eebb95577f1f55d42396a76ed660cd3c91edcf62d765906c6975f2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.2.bb
deleted file mode 100644
index b60dafc..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bn-in_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "1ee1656e08c7cfc4b237343a11dae0d8"
-SRC_URI[sha256sum] = "330fe9a49e28b8a183bbd9d9e7d9d9cee2da654b2995bce3579312eee0da299c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.11esr.bb
new file mode 100644
index 0000000..525752d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "b14a15949dab8dcfa8cf4c650ab7f7ce"
+SRC_URI[sha256sum] = "2ca127fc72121b42cfa879bc83614041388da802518668c16511b9d252c9f8a9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.2.bb
deleted file mode 100644
index 8c98c79..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-br_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "fea37a88ac67ea3cb7db2a6b44bdcff5"
-SRC_URI[sha256sum] = "57b3195bd05b2c48eae3117b957f448c0cc8810b8c89ced9f690184f889656b1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.11esr.bb
new file mode 100644
index 0000000..79472b4
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a91c69396c0bf908671abc34223d274b"
+SRC_URI[sha256sum] = "43ec26eec3280d79f8ffd18b42b0d4d1f8e290f64a4d7d2b3241c6f428c20a26"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.2.bb
deleted file mode 100644
index 21d7d79..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-bs_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "ceb884c8969b5be251727f831b1fc3bf"
-SRC_URI[sha256sum] = "529c0973398e5f2202d40f90f3970587090397a6a3da294d3024bde8fe490383"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.11esr.bb
new file mode 100644
index 0000000..394d897
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "388f6eb8212ddadcfc0f7a20adb2a4a0"
+SRC_URI[sha256sum] = "9784161ef50ecf8a0037901fc867938575c2fc8691f1726bba303efd6b9be776"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.2.bb
deleted file mode 100644
index fd2d62b..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ca_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "b100190d7a0a40b24236e99b031d63d6"
-SRC_URI[sha256sum] = "fd0823787e2517ef868a732956651a578b92ded60e3608c2474a776677578590"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.11esr.bb
new file mode 100644
index 0000000..072b84a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "9150f9a2ca8fda7357a3988ab5883f5e"
+SRC_URI[sha256sum] = "96b782caf8d73fe848cdc1c851f6b325a140cf84c7d40a0cb1d13602bc2dbcf9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.2.bb
deleted file mode 100644
index ae51aa5..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-cs_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "ccdaf566315bb4d8108b0c400bf5b28d"
-SRC_URI[sha256sum] = "cdce3a6a1b8c2723ca748da738fd803a0130f13285009197b7f5e65b935fbd31"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.11esr.bb
new file mode 100644
index 0000000..d248f27
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "e55e3836d045e4f067f41a275c2f6106"
+SRC_URI[sha256sum] = "53e28ab8af1550d6f913841afc44c098a3118a3701aac0de8475250d1059517c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.2.bb
deleted file mode 100644
index d1471d4..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-csb_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "da702ed829874be13c2ab19b98764fe1"
-SRC_URI[sha256sum] = "9979c3870009dd16cec07c6c0c4ae328897aa465bc1a22a85f35b69150749e68"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.11esr.bb
new file mode 100644
index 0000000..bfe9911
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "09080b30adafd30b629fa5360efc261b"
+SRC_URI[sha256sum] = "059d36645fa9099b35f100cc2fd75dce78be7c40eb8c969668b7105e383309a3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.2.bb
deleted file mode 100644
index dd6abd1..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-cy_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "b44b249224b023cb20cf7b787a70de4a"
-SRC_URI[sha256sum] = "46e2a3c5999e860a701795cd9f007f23ee85d172089443771993cc3f749fdc9b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.11esr.bb
new file mode 100644
index 0000000..5c9f957
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c2a33edf0ef3812894fe712b64baf9ee"
+SRC_URI[sha256sum] = "30c0d33590c2ba72ae9a1e22ecf5214ca3f44e24db871f337f8a169409b75f74"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.2.bb
deleted file mode 100644
index 7813d33..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-da_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "1adc9f41248a12f4e2e081fda0c81577"
-SRC_URI[sha256sum] = "9744fc961c9185c9c5585f563aa8075767ad3cfb7be310c6c48bcaec6538a3f5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.11esr.bb
new file mode 100644
index 0000000..5ddae01
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c7343d81b5b310f3e9dd5ede1d90a75a"
+SRC_URI[sha256sum] = "6e2488e7136dc5d67548d806175feecd0d94b75f48901e023305c7befda9268f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.2.bb
deleted file mode 100644
index c7211c0..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-de_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "e3cc6de453da650747e89fe222c7d236"
-SRC_URI[sha256sum] = "9c691c1733ef5a500f37e87b11fab6852e9bc1c0da6c6252e4e9f01e6c0ca7ac"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.11esr.bb
new file mode 100644
index 0000000..6a78d33
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "0b74b2964b44555dd94945536ce57f15"
+SRC_URI[sha256sum] = "18a012130ca0501a6ce700639d4223837738886a1cbd70b5573011c3769a9c54"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.2.bb
deleted file mode 100644
index 9e7de2f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-el_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "4b978b67f7e0259e22cc2b163c8ed044"
-SRC_URI[sha256sum] = "4e91ab483fa6d62c7e2aeaa418549954695ecc01c674893c90faa4803355f541"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb
new file mode 100644
index 0000000..a6eb5b2
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "bf548055fecc52e5ac41e484fe1e98bd"
+SRC_URI[sha256sum] = "b392ec30ce941d4761f2c53ccca02edf7be1b8f06390642b584bdfb2f8705e6c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.2.bb
deleted file mode 100644
index 88f4022..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-gb_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "857009a7d9c60faf676bb42b09d4fbe5"
-SRC_URI[sha256sum] = "d2055988dd8d93d849dc2e4f6933f0d31cf025377d29d9a8a4bd7a32d8b06075"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb
new file mode 100644
index 0000000..521139e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "7621011f267c7e8f5ac894aa4acc4f33"
+SRC_URI[sha256sum] = "6b9df8158e63b30bad7f112852408cda926f89677a44cf4d9a37a2bcec635eff"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.2.bb
deleted file mode 100644
index 818d331..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-us_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "a0cf04d0a4d808bfc20427395c110214"
-SRC_URI[sha256sum] = "5ea221d3945ce36df401d76338b809168739646c699dbc08dc77714aa7c3ac80"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb
new file mode 100644
index 0000000..11cd278
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "fdbec5d8503ca928f674acb068e5c385"
+SRC_URI[sha256sum] = "e481c04f33ba14f4760258ada9ba5727ec501a3399a4ab1bde5a5446184f6146"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.2.bb
deleted file mode 100644
index c82688f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-en-za_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "56644b8637d12ebbb465baefee45cdb0"
-SRC_URI[sha256sum] = "e64bee6d33633bb79111b1b3e5196adaf6dbb7c525c51146e17cef7b348f2ab5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.11esr.bb
new file mode 100644
index 0000000..d24a399
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "85e78651109e4a1a8fa2147e69651448"
+SRC_URI[sha256sum] = "4b11045857c9d215826bf13ae3a8dac8b8e87e3441593d49b263aea83a48ea26"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.2.bb
deleted file mode 100644
index 50afb6c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-eo_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "95053c7f6f40caa4b63abfe5f42e3ae0"
-SRC_URI[sha256sum] = "2492cfcfa007f3c8a42a5f528b8db6a222473fb73d683e471daa7b34763e41fc"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb
new file mode 100644
index 0000000..54b69b9
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "1d062ef69b128e15eba47ca289dbc30d"
+SRC_URI[sha256sum] = "d3fb903212edc4a40c5004fee75b0f9f1c0e04583c8b289192f22076e0c98cd4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.2.bb
deleted file mode 100644
index 844836c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-ar_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "bd7ae99d5cdf6773c44b04fe35df7e99"
-SRC_URI[sha256sum] = "115e15a7a05d8b5e10eac83d805120023eedbe222354f94ec4f22957649f076b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb
new file mode 100644
index 0000000..cab7957
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "e4c0a8e17a0624d6bd2a3b7546de3bd0"
+SRC_URI[sha256sum] = "0630d0535e6930818ad685567b8d83a860ea3a3f5791bd5d1f0ae20a8ec95dda"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.2.bb
deleted file mode 100644
index ca1bf41..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-cl_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "01669b3b8b1c6a197b65dd411fae6911"
-SRC_URI[sha256sum] = "1feab4d72b4dc178f6c96c13eefef8f60f8c8eddc7312d887c06cc0332b8ff78"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb
new file mode 100644
index 0000000..5566ac6
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "0b4a2bca0ff661336294437fcbd0763f"
+SRC_URI[sha256sum] = "fb3617624d8606a3155a224078a26a48a01cc7537f3dfa63acbc0b17c21253fd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.2.bb
deleted file mode 100644
index 7b7e1b9..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-es_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "d9b4ca176968c3cdf5ee9388505dd657"
-SRC_URI[sha256sum] = "b7375eca052c9d9b18a785cb36ed6e589c38420bfd1949df4cf6e8461bbf2490"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb
new file mode 100644
index 0000000..a5d7589
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "d56a1eb7355840de6756af6c33e05e24"
+SRC_URI[sha256sum] = "86bd2bb3d9b5480906f8c060432bdb824d616dc1376536cbd3d7169a65afdc64"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.2.bb
deleted file mode 100644
index c715cae..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-es-mx_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "a06b8bbe3d57474a6e8bbee7fc8eb054"
-SRC_URI[sha256sum] = "2f4035c80b7c2b5d8085d3a2a33e7e2e60e064843676b9571d3ed1f358bfeb7c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.11esr.bb
similarity index 52%
rename from recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.2.bb
rename to recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.11esr.bb
index f0cfb49..874bfa7 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.2.bb
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.11esr.bb
@@ -1,9 +1,9 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
 require firefox-l10n.inc
 
 PR = "${INC_PR}"
 
-SRC_URI[md5sum] = "6fd115213b097ac203cbfe5988e394cc"
-SRC_URI[sha256sum] = "8e5c79ef138bb89b8c35120bf44a38bfc8ff8b9b73d1ecbc839c05e7ea8139a6"
+SRC_URI[md5sum] = "79b3c229300e0900a7d33ee3ff0572fd"
+SRC_URI[sha256sum] = "a507c129c1cffc8f3cf1d824f3684ef91d3abdb12d3cad9e9665e6824289495f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.2.bb
deleted file mode 100644
index d9e3200..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-et_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "0091992f96645d70bec6689e6b416410"
-SRC_URI[sha256sum] = "f34b86859b2f39265c06d1709e2699a820e37835ff811cdf3049d9d097ff9618"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.11esr.bb
new file mode 100644
index 0000000..2d30ceb
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "7239fd87d0269a238c3a8280f4438fef"
+SRC_URI[sha256sum] = "a2dc136240db5c0ff1215674c415624e8f21dd8623dbe87725ef6c9d2226fb1d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.2.bb
deleted file mode 100644
index bb5f176..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-eu_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "87a52ae34c6addc4ac96db55c63d3cfd"
-SRC_URI[sha256sum] = "cd1bf9c1e62694a1490ae4b46528aace88fd523f9f8cd51c219fab8d6cd2f81b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.11esr.bb
new file mode 100644
index 0000000..344db98
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "5ddef0d87bdc0820acfe2de0fb40d08b"
+SRC_URI[sha256sum] = "4d740a9f10d053c58358b2a98557954ca718aa8484786c8259752b2c395b0dd2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.2.bb
deleted file mode 100644
index 0743221..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fa_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "1b1d887356c414a31e295e043d75a5ae"
-SRC_URI[sha256sum] = "b5a2e077af5549fd4fcedea0d86beeb55d2badf806048eb4df83dd74e999df9e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.11esr.bb
new file mode 100644
index 0000000..8c9eee1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c95dcdf825bea695ab66084f1814e25a"
+SRC_URI[sha256sum] = "72e96b22cec634a5a05524c17aeaa2480374d60cd6862e5a4aa9bda0c6f29a37"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.2.bb
deleted file mode 100644
index 5eee02d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fi_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "4993448d3a7d41ebc44aeb54ac16c8d8"
-SRC_URI[sha256sum] = "e7dbdb40a6d8129bce25d65c213c0a1212ff7a092e44a7a74f241a206d8d3633"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.11esr.bb
new file mode 100644
index 0000000..9ca7b2f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "3c944b143ce943dc1de8d23a70a0f148"
+SRC_URI[sha256sum] = "31811aee809cb8896470d5f9e279e44e2ffbaa99b7265a9e21a52c2c35324c68"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.2.bb
deleted file mode 100644
index 9dbdadd..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fr_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "e99926ae86964cca90686e8bd26ea243"
-SRC_URI[sha256sum] = "621bc8ec3b8dbf8d5d2d76bf105dd306812d1f4e5c524ec5afb6ae7b039d86b9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb
new file mode 100644
index 0000000..c107f5d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "2fc234bd271bdd9ce868f0047cbe4cf0"
+SRC_URI[sha256sum] = "b4282711697e6dd54b31765355e3cc488c00f375022ce81dad0a8d73bad07d2a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb
deleted file mode 100644
index b596a1d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-fy-nl_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "b578e7ef198c2f05e0afdefd28f66927"
-SRC_URI[sha256sum] = "84a537338c886d208a05923ab1742d029409af40017e718318b9ee10d9822315"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb
new file mode 100644
index 0000000..b86456b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "4b2f6454f3a7094882afc0e3ab494bad"
+SRC_URI[sha256sum] = "33cc30bf1b2a4bc028db85eb83387a393c8e306f703b1b6e2b282e661d71f584"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.11esr.bb
new file mode 100644
index 0000000..d65910c
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "f1319904fdb10c1b3ef6f12f28d319fc"
+SRC_URI[sha256sum] = "768594a4526184c4e8e48698f3b87ad94c325b2a8a9dc98dba106a1a702a5f1b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.2.bb
deleted file mode 100644
index f68d8f5..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gd_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "a6b315502d44c8bb80334434f2f18507"
-SRC_URI[sha256sum] = "2731e8d49395e0ebadb6a7c5edfba44b7c5e3ddf3689d35fe6b358fcd5f681ad"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.11esr.bb
new file mode 100644
index 0000000..f36e612
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "5b6ab4f347619ae01de03df7f798803c"
+SRC_URI[sha256sum] = "96a188af032c3dc13976475d97b936ac7f3e6eb6ee8d4a6cf54494d122fd9f69"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.2.bb
deleted file mode 100644
index 3bfd12c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gl_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "631258d258221542bdf75d4ed9290002"
-SRC_URI[sha256sum] = "6bc2beef01163c295b2f25bb55b7e5d0a40edd0fa4a7746625388baf33ddc899"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb
new file mode 100644
index 0000000..2b32a39
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c4c3dca0fef1bfe9a5d399d4f1942edc"
+SRC_URI[sha256sum] = "facd8483801bc169a9d5ee4674e5a9ba343b0348ee4957158141f73bf291e8db"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.2.bb
deleted file mode 100644
index 8dd3ceb..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-gu-in_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "fa0e332f3b967e21892b3b9fd70e7454"
-SRC_URI[sha256sum] = "295729f7aa69d6cbac135ca9fad1388dc73298d04dd591607480ed3eeec49196"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.11esr.bb
new file mode 100644
index 0000000..0e6d081
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "2e06fb09c0078aa0405dccec5162a255"
+SRC_URI[sha256sum] = "bf586d97424d0b07e7bd08ccb7dfd65eb66a9f00d8bec0a9be79f8cea10a85a0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.2.bb
deleted file mode 100644
index 23b1fd5..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-he_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "4f22aba166f56bd528d307b0e7b541f2"
-SRC_URI[sha256sum] = "8853d4a52b1e045b29659c97fe03b4048155b54841b53e20765b220eb0af2bdd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb
new file mode 100644
index 0000000..dd0d302
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "40cf834613f38c3de24cb8956484e6a8"
+SRC_URI[sha256sum] = "2a7f647f27b118ecb238ea39739afcb285347fdd581d2aef6ee31921d5f88187"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.2.bb
deleted file mode 100644
index 4dd96cd..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hi-in_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "6d00a14d6de40a098ad1bc0896e8edc7"
-SRC_URI[sha256sum] = "5ef6c1f39c331ab694a17f7054c56c3c91fb43cdfcfe14d8e24e19b299873ff0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.11esr.bb
new file mode 100644
index 0000000..01689f0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "16bc70ee0d694cc1cb0319cb722f6f7b"
+SRC_URI[sha256sum] = "aa4a53ecd79c026bd28d7be2a8bc62f6a97b129e3f9c6b4b7d9cf64e9c5797a3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.2.bb
deleted file mode 100644
index 4d984a1..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hr_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "a49b79d9dfea54f15475b00d580d231d"
-SRC_URI[sha256sum] = "4558dd94f4b938c533f7205c1e48024801d63a17b0df290a9d9810234fcb1706"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.11esr.bb
new file mode 100644
index 0000000..a5cce1a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "34f5e62b4674cdaf3b3f4ece56540406"
+SRC_URI[sha256sum] = "dcccb43804ff627cb2bf6404e961b0cc7beab8d8c1318471ad7117fc1154a2ba"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.2.bb
deleted file mode 100644
index 87e5177..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hu_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "4c4347cdf626e8ab384ab4a14591575b"
-SRC_URI[sha256sum] = "61ca8a31c76265353d9748f2f7a2602dcebe5b605326113fc84937a84a305785"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb
new file mode 100644
index 0000000..96d353a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "f7405f329b64d8b596c2962fe847a3a3"
+SRC_URI[sha256sum] = "483dd0db1b5ef9a22f6069e372467a9e683863dfd20c5e2aa74c7d8d3b9fb842"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.2.bb
deleted file mode 100644
index be109ab..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-hy-am_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "75ec28198ce998e30b14bb7711d8892f"
-SRC_URI[sha256sum] = "e07ef11f7e5f0fc0f5ca6590d3561f8c7cc55391cf68f31e3cb0a29209fa802a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.11esr.bb
new file mode 100644
index 0000000..7db2add
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "23928c032ff024fee398f325a0405af4"
+SRC_URI[sha256sum] = "e527a326a558be79a787fc53cb1e1333cbc99d555f256c4570ecbd7f79ab927b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.2.bb
deleted file mode 100644
index 9d1fa6e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-id_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "eb8f58688655fc1d263c2329a99eb029"
-SRC_URI[sha256sum] = "c77ea31f83bc1f44d15d35031a124da263fb6a2e3ef49e3752bf2091b9eb1ea9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.11esr.bb
new file mode 100644
index 0000000..5402b96
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a33546c8d1b2d1848ec2da9c28d74dfb"
+SRC_URI[sha256sum] = "5fe7ae96611fad428064aedffd35078df7ad59eacaea80c74b84deb2d0affaa6"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.2.bb
deleted file mode 100644
index e637a10..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-is_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "a5ce1203f5cd8860c41ed641f5076cd8"
-SRC_URI[sha256sum] = "d83fb6f13b2dc3e4d4ecdd77bc6786a42cdbbfb5e93560d3cbf068d84fc2a76e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.11esr.bb
new file mode 100644
index 0000000..5764adb
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "bc7c7aff1b76be5311773aea366671df"
+SRC_URI[sha256sum] = "3090a4c7144c2dc3da2e48e12d6de8948af810230b9ed148213af304f0652fa1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.2.bb
deleted file mode 100644
index 0b57214..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-it_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "42e5097e7ac595f104e295039f2868b1"
-SRC_URI[sha256sum] = "6d2556c7e4c8bb4fb1a710dce95589042dcae1866e3ecadab0f71a82af8acc76"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.11esr.bb
new file mode 100644
index 0000000..fbf41cb
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "5a8d6c07e4f6a3d5c4eb8482c51ef451"
+SRC_URI[sha256sum] = "0f8b69eb5ddc9b2dd3980f643a0961721efec591c88810fb089e894b8a22ddc3"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.2.bb
deleted file mode 100644
index ccd673a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ja_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "2310a609bb5690c6f57d83ada587a835"
-SRC_URI[sha256sum] = "b215fff64302f79febb18b1d631eb0598f2d9fb82077f7f1679e0d4054a6ba30"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.11esr.bb
new file mode 100644
index 0000000..67a42e1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "833f0f6da712a0c57c0c1fc3fcfc1885"
+SRC_URI[sha256sum] = "35a71e82a33ebef14cbbc86bf58a0223356aecf1a5607e81c75c2f2b206f2c1c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.2.bb
deleted file mode 100644
index 02189dc..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-kk_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "6c7ed99b39ac13319616a4fd18f211db"
-SRC_URI[sha256sum] = "7faa096832581d7de94ee092084b6a748c423e419b31692effa68ec2bb07265a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.11esr.bb
new file mode 100644
index 0000000..aa9e2e6
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "552936179c5bf0554496fe15fe0036b9"
+SRC_URI[sha256sum] = "4c3ceac9bec6807115249f2a6eb8481dd06b1f88e85e8bd7047fa94187b146ee"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.2.bb
deleted file mode 100644
index 6b7689b..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-kn_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "c5df7357307d2f7ea16100ab2f763c03"
-SRC_URI[sha256sum] = "822889e8a6991e9f36a81d6faa382e44f5db7e0490fde8b66bbd85830e379b6e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.11esr.bb
new file mode 100644
index 0000000..5aa6ee1
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "2d2a5f0fcbc2fa60c805b63a1298ecf7"
+SRC_URI[sha256sum] = "c789168594f6575a1127f9e6e9fc7b01516410a9af8dc6c54b3e33539893320f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.2.bb
deleted file mode 100644
index 4b69728..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ko_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "6f6ffa9946556d0da77b7c2f924882a0"
-SRC_URI[sha256sum] = "f7e137fdf10eb1b3c3f24b40b10be75daaa0fc598b96cfe3af38d4f2a2bacbef"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.11esr.bb
new file mode 100644
index 0000000..a807360
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "2db725e68c9d3a2f383a9c885a5eb23e"
+SRC_URI[sha256sum] = "5dc01d26576ea193ebb0ae6191da70be1b0ea4fefab3f83933ae7df6d599408d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.2.bb
deleted file mode 100644
index eb3b10c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ku_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "b6570c9ca260eed33001be4b9f916bcd"
-SRC_URI[sha256sum] = "9905f103df5f5656abaa5bd5bbbf3d0ab07512e2527c838dd7cd0137807f4f8b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.11esr.bb
new file mode 100644
index 0000000..e23e638
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "8396078d24d9b3e13b8ac62839e91ab4"
+SRC_URI[sha256sum] = "e7a64db780496953dfb9d623307ef087f09009daa4c0e1161e99100e5c971339"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.2.bb
deleted file mode 100644
index 4f2051b..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lg_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "49306764b7978df9f76ceed98ccd22f7"
-SRC_URI[sha256sum] = "7726b7d8669d11a03cff334aeb360944ec488cf0e8ca6d15b41e1cb59eeb8e5f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.11esr.bb
new file mode 100644
index 0000000..c38a7d4
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "30a19199a4ee543015f052d2bf921a70"
+SRC_URI[sha256sum] = "13fac6431709afd0741a94f4f3ecd365926b43c4a01f0eb1f4e592e32f62113c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.2.bb
deleted file mode 100644
index 30f264e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lt_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "c17b2c4fd8a2f168cc8be04b12c286ab"
-SRC_URI[sha256sum] = "9a7ce7dbfa680229653b9de4024f29629b4722624d8cc4f8c3714d52dd616116"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.11esr.bb
new file mode 100644
index 0000000..b4f3ad7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "ec88dca1799e93d4d04a2e709afbeff4"
+SRC_URI[sha256sum] = "6190c2da9b08c0d75f430a7d30a06e7b3991cc888cfe491e512b3ceb49b9a6ea"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.2.bb
deleted file mode 100644
index adb9653..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-lv_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "9bc7eeea1ca1d3d94a666e49cbc0211c"
-SRC_URI[sha256sum] = "e6f7a957ba96f0502da88164055f5af61e42a4373b13689ba4e3c040af3d528c"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.11esr.bb
new file mode 100644
index 0000000..5bef37d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "692fbe858b0344d476d439301530520a"
+SRC_URI[sha256sum] = "4fbe32f1dcf63e78950a95fa77caf78e93e54a7a0c88be5bb73ac07d89cccf6f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.2.bb
deleted file mode 100644
index ca7c418..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mai_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "f1534cc436d5260b2ce1233c0ee218cd"
-SRC_URI[sha256sum] = "19587c35b14604c5d1d558b9436803d551b148aa74852e16488c8ab072636723"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.11esr.bb
new file mode 100644
index 0000000..92ea57e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c07bedf6f375d8f257f480a49c302bcf"
+SRC_URI[sha256sum] = "71ef2339a6a8b4bb6e6f8a755c8250aba8e4d214fbb36ca2bdfcb219cbfc1e9a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.2.bb
deleted file mode 100644
index f1f3e29..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mk_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "2ebf64e05d51b50ed7aab906542967b3"
-SRC_URI[sha256sum] = "b1c8f2accecaf4ed98e09625abd377a4483321aeaea46b6a780098dffe21c2b5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.11esr.bb
similarity index 52%
rename from recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.2.bb
rename to recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.11esr.bb
index 6d3cc1c..01c6425 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ga-ie_10.0.2.bb
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.11esr.bb
@@ -1,9 +1,9 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
 require firefox-l10n.inc
 
 PR = "${INC_PR}"
 
-SRC_URI[md5sum] = "0cd6526db231075101f19f90b759b1b8"
-SRC_URI[sha256sum] = "13bb31fc6ed5d4d3541e1d51b96d4fce797fef7be9ee0b884cb8d3d86359e499"
+SRC_URI[md5sum] = "eaec4aba2593a8d5ea4874e7358b02c0"
+SRC_URI[sha256sum] = "0931b0d3302867d43724e61a7912988f44de9d72d671a7c70675cb641efa72cd"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.2.bb
deleted file mode 100644
index 7151b7e..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ml_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "1c0072d639560da4d21a563fb0ee2d7d"
-SRC_URI[sha256sum] = "6f32259a0e8da61b0c80a7f05a0c7e495121644b57cdfbe8972951961766b468"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.11esr.bb
new file mode 100644
index 0000000..176b110
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "99a341a891a5ab9b9630486c1440d104"
+SRC_URI[sha256sum] = "f10a7722375b3ec12065beb08ddd0c1da87e6d6bce92463a7ca15765d54d52ea"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.2.bb
deleted file mode 100644
index 79e764c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-mr_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "ea933b76c85d8bb8773df28de0b55e12"
-SRC_URI[sha256sum] = "431d2cf448041cba56245744c18a24c68679d922d1c6106e45313009072acf39"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb
new file mode 100644
index 0000000..8a00f8d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "1b342c1a425e0c3d23a00d760ca1bf30"
+SRC_URI[sha256sum] = "c5b49962a4f5cb7c81fb72428478ccbb9cfba4508e6916b4ce0968caa5b95ab9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.2.bb
deleted file mode 100644
index 93cc69c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nb-no_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "2430fed18db7a031d0312837d4592471"
-SRC_URI[sha256sum] = "3a869fe9bfa24d48737a1c53056303112c9185d931a6062533ab5febf7482c81"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.11esr.bb
new file mode 100644
index 0000000..b790721
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "99e92201c8623356cef2a08f98ee014d"
+SRC_URI[sha256sum] = "b05fc760572c72dafbaa53c2b249e19b5fe119568cff724ee1a7410bcb8eaaa8"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.2.bb
deleted file mode 100644
index 261eb8d..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nl_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "cfee821757e3d4e3c89492f6c48a5c26"
-SRC_URI[sha256sum] = "f07ab4dd5165eeaa614e7bf396dfa6f4bd74cb316d9f67f158efe7376f3e1b96"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb
new file mode 100644
index 0000000..174f8cf
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "a419902f9dd91ab5b6c3c0f314574192"
+SRC_URI[sha256sum] = "b25c05f8f767ec38c5a40c10330a7ca93509dfef5769997170b9aa7caab367e8"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.2.bb
deleted file mode 100644
index 905e7ac..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nn-no_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "67dfcc550adb117a55090b6dcdf71515"
-SRC_URI[sha256sum] = "f0d73dc68761a9b8e906cb4c04b551482cd53bdeb76f6aca23b80057026d4e93"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.11esr.bb
new file mode 100644
index 0000000..782ee66
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "7dbacf9701b343ed2e5f35320693ca4e"
+SRC_URI[sha256sum] = "166d3c6f4b30cfa51bdddd04834ff95461650c41bb83c02482f12f119f0630a9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.2.bb
deleted file mode 100644
index aba4253..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-nso_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "e330e3fe565cc6538d3f17024c6c9387"
-SRC_URI[sha256sum] = "9fe64c82e31464747bf231b8a98482b3b8b83097df689d653fb316e2bf495ee0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.11esr.bb
new file mode 100644
index 0000000..6dbb3c2
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "fe630c0a8b553c1ba19e37cc72b0be9a"
+SRC_URI[sha256sum] = "3353de0d6b62d5b604bce992504354d3da22c61aa591392833058020b00bb182"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.2.bb
deleted file mode 100644
index 00449c0..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-or_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "50166fc7bea8714d48908abd64ac220b"
-SRC_URI[sha256sum] = "7de503c7fe755f0878c367b464a93d95863ba2b18593dfcfd6e25f43f7e6a961"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb
new file mode 100644
index 0000000..6cce08a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c28c8bdf0d0807dd20e3db34309a4a72"
+SRC_URI[sha256sum] = "4b0bbbd5bb310711abea9a347747cea6778dd3e5c01a325023e86a5cc710bb3b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.2.bb
deleted file mode 100644
index 02b24fc..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pa-in_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "c4b181dbda18672b371ee3ede30a3178"
-SRC_URI[sha256sum] = "fa09349dc5d7f46cc1b3a02e8bb67dd789016618a6e5d4001c63461dfc80d82a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.11esr.bb
new file mode 100644
index 0000000..f6da2a0
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "d437125e1009b0f12128ba7f766a192a"
+SRC_URI[sha256sum] = "b3c34eb9c030976f6acd45247c70725c22ce0dd1262376ab155e73670b627cca"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.2.bb
deleted file mode 100644
index c14b4f1..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pl_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "440d2fdc9a6d9ff2f7d3112c79506fa4"
-SRC_URI[sha256sum] = "60b743040fbf19944ed28d075e43bb215a362f17910fd821d7b70ed329f8bf2d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb
new file mode 100644
index 0000000..8207619
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "d264fb9b0116eece43395acf1528ccd7"
+SRC_URI[sha256sum] = "2a87614897d01560f6eca36c94bc988805b7a6b2b896e11668da87174c36fbb4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.2.bb
deleted file mode 100644
index ef4aec7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-br_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "23f06b6c1762c8f9cb1cea05efbb5ecc"
-SRC_URI[sha256sum] = "3e153fb554e5001560d76b9e8ec57fa2644a3124b8a68f9830514bacf8de4898"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb
new file mode 100644
index 0000000..f0d8e3f
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "675a0ea6ea04234b17b99c0f80b77ab8"
+SRC_URI[sha256sum] = "7bee6a6533029db35546bd401ef2b6cd60edf5c8ec334181ab3e4a915ae24c35"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb
deleted file mode 100644
index 9ddba92..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-pt-pt_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "bbc3bcf2686e8d92bd7b7865c56e9615"
-SRC_URI[sha256sum] = "915a3534b42a952aad218a05ba7bd72bd74619104c9e592f8654704cd96fa4f4"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.11esr.bb
new file mode 100644
index 0000000..d874f38
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "0c0ef89c5e014d497889df88b33e6365"
+SRC_URI[sha256sum] = "31190db630ee3dbb8f1fc8f097dea93eac380ee99e87b581b919d3a47af02f98"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.2.bb
deleted file mode 100644
index c4a4421..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-rm_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "2887b2d0791211afdfc1b0bba55c914c"
-SRC_URI[sha256sum] = "0e3f3e3208d494fb23577d88b01e8540889d041e9cff140470e87634c81fcd1b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.11esr.bb
new file mode 100644
index 0000000..9cfcd29
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "50abc165ca5b92e39f686080c80e702c"
+SRC_URI[sha256sum] = "45d422e0719308cd2540bd331b7439579b265e9679de1051e7f8e006ecbf0899"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.2.bb
deleted file mode 100644
index 6409c6c..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ro_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "1f7c0699652dc0fc4a851e41d5e73240"
-SRC_URI[sha256sum] = "bbc5c4bb14b27a9b1b28081135495a62e32e089fa958537be808fefcb96476b2"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.11esr.bb
new file mode 100644
index 0000000..8b945d7
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "81b25728f8354ab267ccc15e55296e3d"
+SRC_URI[sha256sum] = "b856c77141af93ccf0268278e7325e6367da86c53d3644089ea22b1e8daec828"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.2.bb
deleted file mode 100644
index 1e3bda0..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ru_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "ec6769a7a81990d063fdf48094e4adfd"
-SRC_URI[sha256sum] = "0ab72adb367b54267a6b094edeff5c9f2e99598979854f66ae12d771a6396c9e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.11esr.bb
new file mode 100644
index 0000000..4cd652e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "3b544db2fcc106d80b2f82da6a482efc"
+SRC_URI[sha256sum] = "16791cce9532b68b946e90015235e24f7b9b3b7f3931c222449f0da9342624e7"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.2.bb
deleted file mode 100644
index 973aa40..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-si_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "a8b769f4d39b22f34c693d2698005453"
-SRC_URI[sha256sum] = "fb809623835e0c1cfd6c1522dc05c5f3dedf9a04e86f63dc8d1d527f0f7deb55"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.11esr.bb
new file mode 100644
index 0000000..1451e07
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sk_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "cfca66b1443852661c52b5cdcf79ff93"
+SRC_URI[sha256sum] = "a4585d5dc8052f53c8951892fd72a2c853d92174e94ecd1a002451983e461d6d"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.11esr.bb
new file mode 100644
index 0000000..ab94491
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "6c55f43d10815aa4795137a8d3052181"
+SRC_URI[sha256sum] = "fd2747d6f0e5949fcd39d4e7a6cc568a417fce034b1cc94615c5216070f3dcec"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.2.bb
deleted file mode 100644
index 9b83b58..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sl_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "a0adb35944f631ce8b4756ca3b93cf68"
-SRC_URI[sha256sum] = "802aa30b5c4a8bb905929786064c5cfd56a8ba2380cf348bf04f0202e95d5ec9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.11esr.bb
new file mode 100644
index 0000000..b31d1b3
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "b28ae14429ec3c78df05b5c40b808525"
+SRC_URI[sha256sum] = "01fe863e1bd6a0d75d7d64663f8550e70501f63454eb3d919e5c7d3ccb806610"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.2.bb
deleted file mode 100644
index 63cbc33..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-son_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "8d59aa0a3dd7296a0cdd3461455c5d1b"
-SRC_URI[sha256sum] = "9e28607f32c02f090d9c4120ea154d28ba70547d1f92ee06b38a93435846be98"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.11esr.bb
new file mode 100644
index 0000000..050897d
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "4c9232eb01117cbce09a2808870fb642"
+SRC_URI[sha256sum] = "bbc5088737f3c3fdf4c1f0e099bfd21ab20afaeff544095a0fc0e9b39c45771a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.2.bb
deleted file mode 100644
index cdf3393..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sq_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "89c33e78a267c0b616ae04e00725aed8"
-SRC_URI[sha256sum] = "a5eb8a0d32fb14d631287e26a4fadc6d4a11af6524c4212afc7a09bc1b04705f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.11esr.bb
new file mode 100644
index 0000000..27d13f5
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "526a84cf109a342a5b778d2507a6036f"
+SRC_URI[sha256sum] = "635a327b322995d2bbe0967bc7bead3c19105dc27476e6a657981fe1d095693b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.2.bb
deleted file mode 100644
index 12d84b6..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sr_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "ad6ff42d79aa736eb3dac16482c11ed7"
-SRC_URI[sha256sum] = "4c43e3daaf8609b20244c6ae731fe643ac1cbbc0ee9d9c41708181740a5ffcfa"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb
new file mode 100644
index 0000000..2d10115
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "c90b91251e08f822f8105d0a8921a72b"
+SRC_URI[sha256sum] = "0e35b899fdcd77a00a76833911862079ea2777f705da904d0b7693d4a1e7958b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.2.bb
deleted file mode 100644
index 1114d25..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-sv-se_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "6bda3609ddf8d02d2d9c2214bcc9337f"
-SRC_URI[sha256sum] = "c49fb957cee13c0bcf48b65065e96bab1bee701cc7cb71f7facde6deb40efd25"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb
new file mode 100644
index 0000000..2103051
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "ee42c9f050fa5ca5791119207539792d"
+SRC_URI[sha256sum] = "d5e1f81c716bb307a73c1d25ec22e72666b4f9e27ab2921859cb96082bbc05d5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb
deleted file mode 100644
index b5a9dc7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ta-lk_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "f868b6d9a8a5d50f86e9c8320d791e46"
-SRC_URI[sha256sum] = "c4bcc4120d35c7dc7d5d57854b38395f6a3214736673c64528045adaca34d8c5"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.11esr.bb
new file mode 100644
index 0000000..80d8e0a
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "53fdd689b4badfe13121cda96150548d"
+SRC_URI[sha256sum] = "5ba580f167a9bf1fd28d7a1d82b33f5d0727693b926ece0e28813250542d0345"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.2.bb
deleted file mode 100644
index af5dd4a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-ta_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "8d04aa1d64223481ed856d028b485612"
-SRC_URI[sha256sum] = "9fbaf396db32be7f05c1f0b22a98bdacc9b79ac1ca1e808188d20659240c55e1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.11esr.bb
new file mode 100644
index 0000000..c430a70
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "ab3f8eaae10e46c62a251f949ebf213d"
+SRC_URI[sha256sum] = "49f3f8ac436c99cfaba4d5870a8b7e52a36534ff6eb1dd96b9204858da93534f"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.2.bb
deleted file mode 100644
index 6d1ea07..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-te_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "0fdc2f3e4ec88f58fdf2c3abe97f74bf"
-SRC_URI[sha256sum] = "db7eb0a2ac12b9f8809aee46b13477db28f90c6698b7f5b123e491186b12ea98"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.11esr.bb
new file mode 100644
index 0000000..80ca4e3
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "19fb21b95adc4c47c5362ce1aa027578"
+SRC_URI[sha256sum] = "b37d9376d43608d0a96a7d52ec7548822936bb853dd08a0b62aac16102f5c0ea"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.2.bb
deleted file mode 100644
index 5975c1a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-th_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "0a27e88bdee857c0e3f5d3373404a16d"
-SRC_URI[sha256sum] = "1fa91ae74f1b5eeece382b7bc37b0038b6c9a56b47d200080e8f565bbd18e685"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.11esr.bb
new file mode 100644
index 0000000..a9b1b05
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "79bfea915507b750d7027ff1aaeab539"
+SRC_URI[sha256sum] = "bc690ed31ab5e890682ba08ffdd28210047394e3581ec960043028dc5bad911a"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.2.bb
deleted file mode 100644
index 43abe92..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-tr_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "274202e7fe73f70a43429dbed048b401"
-SRC_URI[sha256sum] = "686866fd17909bf10e43ec03693f16f90970e32cbf68c37f1d44fd41cf92186e"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.11esr.bb
new file mode 100644
index 0000000..b5d168e
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "92b979b5271158d5134892e10897c636"
+SRC_URI[sha256sum] = "ef7bd32e6dc545f4bbac5951446bb24cfdf092d60edc0383f20ce6ec9fbe9cb8"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.2.bb
deleted file mode 100644
index 1efcdb7..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-uk_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "709c3e9538cfb44ff0d07bd207176045"
-SRC_URI[sha256sum] = "de97a8491be17955c05fbc9cd19698c89cd8fec9878ea99576608db6d989d1b0"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.11esr.bb
new file mode 100644
index 0000000..6f3d33b
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "abd7bd9bd97ae54cb008433ab3f73e1f"
+SRC_URI[sha256sum] = "54e2954f1d24ee9935a5c4532575adc6ff133297de0b79ffb226031eaa863935"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.2.bb
deleted file mode 100644
index 88a0e0f..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-vi_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "125999659a554ba8f41572f9542679ad"
-SRC_URI[sha256sum] = "d9cf5c1f7111c3db76315b444d9ef5932d84274b6fb360b24e7e341f4295cac1"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb
new file mode 100644
index 0000000..91723ca
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "b94a8c40120b8fc771cd06c03fede64f"
+SRC_URI[sha256sum] = "7f948e543242bdbdd14de4d63cdbf81999b83709f1d9f964565f525b3e9de8ac"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb
deleted file mode 100644
index f52d653..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-cn_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "4058aefe2988d911f62e9dd2a9d1a7f2"
-SRC_URI[sha256sum] = "6b8f03e07ad020a9ba0a6935d916ef6c707b72faefd66049da4718d08d0bf0b9"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb
new file mode 100644
index 0000000..0dcb091
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "dc5fe151034465cd9837dd2197108666"
+SRC_URI[sha256sum] = "0d719d4d9635df855bde99c8bf654c5172672eacfd6d9d068706683464ddad2b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb
deleted file mode 100644
index 56bb5ce..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zh-tw_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "01af6c3654a1211f257be2dfd1951a02"
-SRC_URI[sha256sum] = "b17a795360b8272dfdbcdf4fdd4a67f544405a0c5557fedf31448ad962c66923"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.11esr.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.11esr.bb
new file mode 100644
index 0000000..ed59aff
--- /dev/null
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.11esr.bb
@@ -0,0 +1,9 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require firefox-l10n.inc
+
+PR = "${INC_PR}"
+
+SRC_URI[md5sum] = "29def81ccb1438e471bb56b3775e35ea"
+SRC_URI[sha256sum] = "26ac7353f3a526559330e800899790698a3b92d61289e3dd19a84623b43bf264"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.2.bb b/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.2.bb
deleted file mode 100644
index 26c698a..0000000
--- a/recipes-mozilla/firefox-l10n/firefox-l10n-zu_10.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require firefox-l10n.inc
-
-PR = "${INC_PR}"
-
-SRC_URI[md5sum] = "0aedd199ae05bdbdfbdae7dcd0776fcd"
-SRC_URI[sha256sum] = "74f0dec5c9fa7576445c2d230074218d69b62921211a0cd72c1c0a99394d8e5b"
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
index 3968605..95e86a7 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
@@ -1,4 +1,4 @@
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
 DEPENDS = "mozilla-devscripts-native"
-- 
1.7.2.5



