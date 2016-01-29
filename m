Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 259097717F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:04:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l66so12212263wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=qJOKBlQxaNHBD2lqeIzAE/0GuwIVO/gRi1Wpky15c/g=;
	b=qMxIVN57RO8U4WwzVQTKLCim4Zl7SG+VFhbyUKVITRlqa/EMGFkEDNeEIVtJboxi44
	q70juhvgReAF7Hz3ZJ5Z8/QVXLJUX+fvO+nYgHr2W07Ya/+sYOcLfbzTbVTxYlxIto2Y
	3w04+kO0VURtKnT51OAYKZl46PLyUJqVgVTSRWDQxdSeGOXCSqbzrA95OrmpfkS58UYu
	KG2vglcpHfFqB6lA2flI5SobwLodPaIIg8GXZjO910J/lrPhMpOTxAizzavF51RLabJZ
	zoUWkqMRKrpX9Rj9992QilfFR3m9ugdonW2KSmoRXKWK/phM5zBn+72f1xLMtomEZvDZ
	x1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=qJOKBlQxaNHBD2lqeIzAE/0GuwIVO/gRi1Wpky15c/g=;
	b=ZXXUu493wVs3fIwUp5+uDs9iHRL5ouADcWZZAcUhcIJf057UkKfNhr48J9aT03mxLN
	xh3WJLGsiw13gMdF+M78kT7Bayh4DfbuVh9D6tICyyBVkRZaHZH69nXRoIw6J1IyQkaa
	gTLvqEeOKv/onQnJkkQeLb8bkPb/c72PPe9un+lsZGGoGE9cFb6Pyy8sPjz2cPRqIoZm
	Q8HPAcKgBgYblvBST2gd7m/0nYroOLCHGv2i1lIJCaxtfD5Dv2F1icTGLd/OZ7EbENAn
	RBceh6yVIRNT9KE3bO9RfHS4svFEb1SjtTl8A177fVRJ1x2ojX3MN0oKwW5i/23JhlpI
	znQA==
X-Gm-Message-State: AG10YORd3v8AwOM9lJzm7PT2ZObXbBzVaV5eS14M61Du3YDxCLx3wMiXsbLPtuTXwAYj6w==
X-Received: by 10.28.99.69 with SMTP id x66mr11427447wmb.10.1454105042150;
	Fri, 29 Jan 2016 14:04:02 -0800 (PST)
Received: from localhost.localdomain (p5B0A0123.dip0.t-ipconnect.de.
	[91.10.1.35]) by smtp.googlemail.com with ESMTPSA id
	yz5sm17335616wjc.36.2016.01.29.14.04.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jan 2016 14:04:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2016 23:03:52 +0100
Message-Id: <1454105033-30479-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/1] hunspell: initial add 1.3.3
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
X-List-Received-Date: Fri, 29 Jan 2016 22:04:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of sending gazillions of patches I cc'd maintainers for mentioned layers.

Andreas Müller (1):
  hunspell: initial add 1.3.3

 meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb

-- 
2.5.0


