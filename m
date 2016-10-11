Return-Path: <akuster808@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8495D6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 22:06:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 123so745505wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 15:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=G6lrSi+D2FuET/UzqMRX4nAuskHuzPNY5dmKkpegbSk=;
	b=GWD5TlpJcY2y5jS5T/5lVU3L5rMJc2eRbO3l+f0b5i4aqNXMDFE5fxgOpwd9Ha9Eer
	lSSTPceve/bnzOQYxmGKkeWdNqz2Cp09jn1HHlIaFNZh1zmOigtDBTTIqjUCkHd8M68I
	gQg6tnx819Sw4EyUedD7RhD7jFbEpkNP27W/O12VzIwAaMCw0jMlhI0UVaKSpy1mZhAO
	odBbkGdrzak4xOgokQTScIjIEJU3jpK7S0KK6lGjJqt/u99YlR7LhMwLewbWupcOyP1Y
	4cdnbU6z+1fb4A9sAoh1S2/vQ23z7ssfsfMzfepihU79q2xw/8/6hbfV4Jzou+4kJy/4
	p0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=G6lrSi+D2FuET/UzqMRX4nAuskHuzPNY5dmKkpegbSk=;
	b=OGd9KLdYO4ZkjLHt9aJ12BZ39dNYuqMZNqoFEsOpbJ3SQ36Mr4V+k4n7SSvfbCes+O
	CFv1Ft3jLp59EzgkcEyB4zmej3TZNmN+qEm0Jw3nyX091Lmb7HcJRGuaZ5YE1nnzaACD
	icONsVxFOB6+toqtqd0L+P52KEnAqGn5hCiXWfN+DxZeqQVS7ANadMRLsFCdOHbNLyEs
	+N/KhYauqy6k28kBes6gEoKi3LUbJS+xQ8P0IUiahIC8xepS8qW5Kb9dJtEtFmNI5GT9
	udqU20zNxIK4A3EGyKkNqDSssSNKLttCSbyEIkWmuUKUk4dz/Pe62HoKAZIGHi47m/mj
	F/dw==
X-Gm-Message-State: AA6/9RksEeT16wH6McwiS3PuFK6Kw+u9wrsPbFi6obF03dJTmhGRzL0zINiMOsLqc4JWBw==
X-Received: by 10.28.87.149 with SMTP id l143mr742187wmb.78.1476223606596;
	Tue, 11 Oct 2016 15:06:46 -0700 (PDT)
Received: from akuster-ThinkPad-X240.rieo.lan ([94.186.205.19])
	by smtp.gmail.com with ESMTPSA id
	w131sm920095wmf.15.2016.10.11.15.06.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Oct 2016 15:06:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: Martin.Jansa@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2016 15:06:43 -0700
Message-Id: <1476223604-6284-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] Morty mainainer list
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
X-List-Received-Date: Tue, 11 Oct 2016 22:06:46 -0000

please consider me for maintainting the morty branch of
meta-openembedded

Armin Kuster (1):
  meta-openembedded: Add me to morty maintainer's list

 meta-efl/README             | 10 +++++-----
 meta-filesystems/README     | 10 ++++++----
 meta-gnome/README           | 10 ++++++----
 meta-gpe/README             |  9 +++++----
 meta-initramfs/README       |  8 ++++----
 meta-multimedia/README      | 11 +++++------
 meta-networking/MAINTAINERS |  5 ++++-
 meta-networking/README      |  6 +++---
 meta-oe/README              |  9 +++++----
 meta-perl/README            |  7 ++++---
 meta-python/README          | 12 +++++-------
 meta-ruby/README            | 10 ++++++----
 meta-systemd/README         | 10 +++++-----
 meta-webserver/README       |  9 +++++----
 meta-xfce/README            |  9 +++++----
 15 files changed, 73 insertions(+), 62 deletions(-)

-- 
2.7.4


