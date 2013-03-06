Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UD9Wk-00082H-C5
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Mar 2013 09:16:57 +0100
Received: by mail-ee0-f44.google.com with SMTP id l10so5431444eei.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2013 00:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=emzxCe6l8pP60KOTh/j+4rqqtw+aVayu6xOtCT8c2MU=;
	b=qgPKhXCicGy7NHAz2+a2oGNgb1xJxwrf1hp279Y+6YkMC6qfOKzUpeGLavxEtLiYYH
	qDENSaEzUARJKZXBpugfUFz2c+uz09dsUfv4qTIPyW3nB4PSx/zRuzCUoctPysbWvvIm
	X9GOGGWDFPstS/O4On1117bTeODVXCD5N8XzHDrA6ebmazt+8y+cPu5cRUAoffEOmPsz
	wuunemMHRYjvxk8WGdyPUabAYpojyH/DPd5mek2cDxeS9G2N4wruaqVSTCCZhulpXOnZ
	UidMm4clT/OStAHDOHPMho4QCAIwCQJHY4lhIEuylEbUtlMYQXlCE1rrhBPp4SWhpLuf
	ipyg==
X-Received: by 10.14.207.73 with SMTP id m49mr79652610eeo.24.1362556812133;
	Wed, 06 Mar 2013 00:00:12 -0800 (PST)
Received: from localhost.localdomain (p4FDF07E0.dip.t-dialin.net.
	[79.223.7.224])
	by mx.google.com with ESMTPS id k7sm41017281een.8.2013.03.06.00.00.10
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 06 Mar 2013 00:00:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Mar 2013 09:00:02 +0100
Message-Id: <1362556802-17246-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Cc: otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser] nspr: follow oe-core to 4.9.5
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
X-List-Received-Date: Wed, 06 Mar 2013 08:16:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{nspr_4.9.4.bbappend => nspr_4.9.5.bbappend}   |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-support/nspr/{nspr_4.9.4.bbappend => nspr_4.9.5.bbappend} (100%)

diff --git a/recipes-support/nspr/nspr_4.9.4.bbappend b/recipes-support/nspr/nspr_4.9.5.bbappend
similarity index 100%
rename from recipes-support/nspr/nspr_4.9.4.bbappend
rename to recipes-support/nspr/nspr_4.9.5.bbappend
-- 
1.7.4.4



