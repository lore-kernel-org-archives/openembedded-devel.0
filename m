Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2ADH-00043R-6d
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 01:47:13 +0100
Received: by mail-ee0-f53.google.com with SMTP id e53so2935655eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2013 16:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=mtn8ZvFgtWsd0JXcg4kHlpPeRvCNeGkqvVAQSNqsock=;
	b=pI2fyLFMkiIW8Rg+5f4cOtHtzpj5mMUkguUvfMn9eeEls1+fG/WrjHW4TNoXj3LdWg
	rFiMm5g6eGZ6QnTf0KTQ5uakJ4llJXtWn4fbyhaBALDIPe3ErKFEJSh9RyOzRaCnsBjy
	ofE48iGzWaGmrOvFwRX/eZ3MXqqMLSU6jl9qVr4wDDzKihCaIFaaudlvEc01Z170Cd/q
	pU4jLwWnUwg7k9sm2aA6+ntXq5H90Mv2u6BeyAQQXkOs2E2emnKn1B0QPHefWKSQJjW3
	yJmdQ6SsGV6vQhgvNidMka/0Ioy68W7+z5yFGk4Rz/9tl11whZDVLsf5E80j2eCmzmKX
	CjGw==
X-Received: by 10.14.211.137 with SMTP id w9mr64830285eeo.39.1359937883767;
	Sun, 03 Feb 2013 16:31:23 -0800 (PST)
Received: from localhost.localdomain (p5B0A0847.dip.t-dialin.net. [91.10.8.71])
	by mx.google.com with ESMTPS id j46sm21263378eeo.3.2013.02.03.16.31.22
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 16:31:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 01:31:08 +0100
Message-Id: <1359937872-26028-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce 0/4] further plugins
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
X-List-Received-Date: Mon, 04 Feb 2013 00:47:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 74ec0813562525d02da6ac45eb0237382e98a72f:

  xchat: add libsexy to DEPENDS (2013-02-01 17:44:22 +0100)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git xfce-patches

Andreas Müller (4):
      xfce4-mount-plugin: initial add 0.6.4
      packagegroup-xfce-extended: add xfce4-mount-plugin
      packagegroup-xfce-extended: add xfce4-brightness-plugin
      orage: initial add 4.8.4

 meta-xfce/recipes-apps/orage/orage_4.8.4.bb        |   16 ++++++++++++++++
 .../mount/xfce4-mount-plugin_0.6.4.bb              |   10 ++++++++++
 .../packagegroups/packagegroup-xfce-extended.bb    |    4 +++-
 3 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/orage/orage_4.8.4.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_0.6.4.bb

-- 
1.7.4.4



