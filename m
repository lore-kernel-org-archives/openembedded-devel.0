Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6FC60B05
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 02:10:38 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hn18so4282167igb.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 19:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XR0WgeyqeweAur0XjTNLhRGr+RGhMJ8ADX6HbhgJt4o=;
	b=Vt7cRZZg/bOtWWr2cXJ/9seziEtJeXBNvTF/RxrZCFgsCSVyv156ctQ5FkRToV3nCc
	7Z04FtIl0KnwHdYthKTb94Nfkjkon2c+GRl2qw9kVsT1cHuqJzb2g5WPsMsjBBsR7C4+
	/hkawgN5h//rIWKUAU2xLCBjbCAhpJAWFMljFIHn7CwDt4cXcjgjxUnJxW9PK+aqlVZh
	S/4v4DlI8SrgfQV0z++9R2gMJswmHXYRb2fAWy+TMxUmbywENzRbEJHYkKVIPaE5VL+Y
	tEewICkehwU6el0ReA89+kF9leq18XoP+7Fv1GNNbutgB/Pc3C0bp5G+IOfpehF1+Yn4
	EfnA==
X-Gm-Message-State: ALoCoQkXtWBXL1JRO2YIoc9oCJKj58lxa4/BJplJ3hHvgHj/SmaQHf6sslEsSAa5mePekW1AWzVj
X-Received: by 10.43.57.19 with SMTP id we19mr8995370icb.89.1396318239097;
	Mon, 31 Mar 2014 19:10:39 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id j2sm29054148igx.13.2014.03.31.19.10.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 19:10:38 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 22:10:28 -0400
Message-Id: <1396318229-13509-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: 'asio' fix for SOBBW (2014-03-29)
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
X-List-Received-Date: Tue, 01 Apr 2014 02:10:38 -0000

Hi Martin,

Here is a fix for your "State of bitbake world, Failed tasks 2014-03-29".

Best regards,
    Trevor

Trevor Woerner (1):
  asio: package bump

 meta-oe/recipes-support/asio/asio.inc       | 11 ++++++-----
 meta-oe/recipes-support/asio/asio_1.10.1.bb |  6 ++++++
 meta-oe/recipes-support/asio/asio_1.4.1.bb  |  8 --------
 3 files changed, 12 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/recipes-support/asio/asio_1.10.1.bb
 delete mode 100644 meta-oe/recipes-support/asio/asio_1.4.1.bb

-- 
1.9.0


