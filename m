Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrrX3-0006kb-FR
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 16:16:45 +0200
Received: by bkcik5 with SMTP id ik5so2024631bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=AsQdu5pGaDKyWnozuafBkHYoO8A2WwQFcpPvBb2Vhu4=;
	b=jS7+KYjhEZhqhyPHEklmZ4CUTqPC5i7MPe7JSHRvKIPOU2S8tX/jTvO9YDArTdI7Ts
	kQyfT0GiHP7yi91KfxX33n2lhYi5Bw6LLEkyN4gfYJoutGkUQsu8MIe31VtSDeJOB9Xb
	uGu+J2E0Okta74ysILVNpZEB/HkdzeCoJEaW1v7oH17n7n/SJ/5t+vA1bnuPfhctaDhK
	pvoFhw9LY9J5VmUNYHdUcg3krx2uyQ0l36F+vHkcJO2mIiEYLmgv7Y2GRLkYnFK0XmsP
	2vCHTR+iuGZftQt+524mwOtpu6gqfT1ocpV8YBQtF92NM9Hb0wETo9BOr38Krqr/DJm2
	8lRQ==
Received: by 10.204.145.82 with SMTP id c18mr1124256bkv.133.1342706723616;
	Thu, 19 Jul 2012 07:05:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm1270900bkc.5.2012.07.19.07.05.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 07:05:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 16:05:33 +0200
Message-Id: <cover.1342706683.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH 0/5] Whitespace changes to make it parse again
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
X-List-Received-Date: Thu, 19 Jul 2012 14:16:45 -0000

The following changes since commit 4c0420d83090c6bdec8aff94555401d499c696f1:

  rp-pppoe: discard use of dnl in Makefile.am (2012-07-19 12:11:59 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (5):
  recipes: convert tabs to 4 spaces in populate_packages
  poppler-fp: convert tabs to 4 spaces in get_poppler_fpu_setting
  lzma: use 4 spaces instead of 8 in do_unpack_append
  libopus: use 4 spaces instead of tabs in get_libopus_fpu_setting
  navit: use 4 spaces instead of tabs in get_navit_fpu_setting



