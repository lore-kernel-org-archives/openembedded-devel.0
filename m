Received: from mail-we0-f177.google.com ([74.125.82.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UV2wc-0005B1-4u
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 18:53:29 +0200
Received: by mail-we0-f177.google.com with SMTP id s47so1029663wey.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2013 09:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=dm3Bjb0/oE4cLDC8h6CKYpnYK2bAPTlOwu6cRVN1NQA=;
	b=ngJ5nHLYwwlNxtyb1pbPb3+Cylo2ZgxTYLKmGonE+5Vmzv9Rs93EVCkQH8WNLf7eEW
	mTh9dWi8dDHlN209T0DbnGuJpWnD/xm5EBOuvZu5NLvZD+8QSzUr2cWVuUxKar8PEFcR
	J+3bgjNcbc00Vt2y8DmNveIXPPXtK5dNsPN6aG/lG4bJvA7mlFPV3wWPl7GB6OmdLL/h
	Djjci8ieDC4ea9ZVq8w2FOH/+rq0d9Y6OgT4XSx/vWRO8s5PVVI9Jq48zTumV+R3JUTz
	EXWpGXRGnd1PY+c2VmagpEVxCUxGz/dLCEhrRFC7abA7TlHNcpQzw/cCs04he0yKvWDx
	ROpw==
X-Received: by 10.194.8.99 with SMTP id q3mr3307912wja.34.1366821340222;
	Wed, 24 Apr 2013 09:35:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id er1sm33432791wib.5.2013.04.24.09.35.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 09:35:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2013 17:32:41 +0100
Message-Id: <cover.1366821077.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQm5+2J+vk6X2AygBR+RSWv1c83hUiHocAllajS2HPUGBcNIvcuemK4Qx/LOfgi9W2gRbnDH
Subject: [PATCH 0/2][meta-gnome] Add gnome-keyring
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
X-List-Received-Date: Wed, 24 Apr 2013 16:53:50 -0000

Hi,

This is currently in oe-core but shortly there will be nothing depending on it,
so it can move to meta-gnome.

Ross

The following changes since commit 2a5dea2399e2be5e5d964eda7465dcaf4c2e152b:

  ttf-arphic-uming: remove whitespace from license (2013-04-22 19:00:56 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib ross/keyring

for you to fetch changes up to 71a4379c48d50d14128938bacfb29be4a966fad3:

  gnome-keyring: add (from oe-core) (2013-04-24 17:27:08 +0100)

----------------------------------------------------------------
Ross Burton (2):
      libgnome-keyring: add (from oe-core)
      gnome-keyring: add (from oe-core)

 .../gnome-keyring/gnome-keyring_2.32.1.bb          |   37 ++++++++++++++++++++
 .../gnome-keyring/libgnome-keyring_2.32.0.bb       |   19 ++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb

Ross Burton (2):
  libgnome-keyring: add (from oe-core)
  gnome-keyring: add (from oe-core)

 .../gnome-keyring/gnome-keyring_2.32.1.bb          |   37 ++++++++++++++++++++
 .../gnome-keyring/libgnome-keyring_2.32.0.bb       |   19 ++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb

-- 
1.7.10.4



