Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTDBn-0002Ki-0n
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 15:53:11 +0100
Received: by mail-yh0-f47.google.com with SMTP id g23so60634yhg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zNqwVtewXyflOxFMdUKp8D6urRIkcfr4wyewdYfzZK0=;
	b=nmvu6g2K99Qcy4EDMiYMPORRf/RgLAb31bbz/UBePvL0dPYTUcVokLekjYWeF9acx7
	PpMse5tvLI8F1pFe43Dv2Mn5fOwdSl7mA/zocGmsYHxTMfV/+/Vhf8chhIpW1Nbpdrgp
	PzEC+mgYeDlH4pfL6sxGqhBcOA0WtrDJHR9JmXvdCQmUcSYQlinqFWJH9sprkiMd3PSP
	ysDRwqxQMoAFrd8AnsoBdwo97XEogxXTNrzZMRADkVtGTnGaDC7jZk8b/WkwbgRUzf3V
	/xy2Pc9AWT7uuuN4V/yMcHJ/9Cz9uOyq85YSaIGqc88Xpn5gZJUcdemWgv2ZARcgE9Yo
	DnBg==
Received: by 10.236.137.112 with SMTP id x76mr32487208yhi.56.1351607975321;
	Tue, 30 Oct 2012 07:39:35 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u49sm801500yhd.18.2012.10.30.07.39.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Oct 2012 07:39:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Oct 2012 12:39:22 -0200
Message-Id: <1351607962-13469-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1351607962-13469-1-git-send-email-otavio@ossystems.com.br>
References: <1351607962-13469-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p6
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
X-List-Received-Date: Tue, 30 Oct 2012 14:53:11 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{ntp_4.2.6p3.bbappend => ntp_4.2.6p6.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/meta-networking/recipes-support/ntp/{ntp_4.2.6p3.bbappend => ntp_4.2.6p6.bbappend} (100%)

diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p6.bbappend
similarity index 100%
rename from meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p6.bbappend
-- 
1.7.2.5



