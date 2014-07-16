Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 53D5270282
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:21:23 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id nu7so1079976obb.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=ksFP7DItognA6sAOAKddcztxuSoyCAoKWk04LZD00SU=;
	b=JrZPynO3Zp/VOU7l0WkCzC+zscNmgj0lwhQhY11dB5sCJpUapdjfRYbXLRRC0P7M0X
	WfAHsoyiMgcQCndZdDXI+hgK2EwfIukKt7lxG9f0DBHTmi38LlSMBN7CRcE0wkkMm9no
	tl+J5D/F1lI23FSe3qRDIqU1HLXNoxXNaRITYVtxcCI/mWJJ15MR0GbXVt40KUzqjmmZ
	lnH1nWONC/X9E67S1MdbbDIo66Iv+pp7mZvCiIzLt2Mg0bfd+keA7O564QzUiBabobX3
	pZQsjCZrsNUHq3rjmEPYo7EfK8K3kQ1hldgpdaHPlo9CpM8Y4XJnKuRzoa1MZj5Wh00C
	suag==
MIME-Version: 1.0
X-Received: by 10.182.104.104 with SMTP id gd8mr28335287obb.17.1405524084967; 
	Wed, 16 Jul 2014 08:21:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Wed, 16 Jul 2014 08:21:24 -0700 (PDT)
Date: Wed, 16 Jul 2014 12:21:24 -0300
X-Google-Sender-Auth: UHyQvZEX75IH1CHdftFAz3Duzm4
Message-ID: <CAP9ODKow7gr1J8_peZJNT4+soQ_vDQP_hi4DYnjx7E0uTCUoBg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [for-daisy][meta-oe] Patches to cherry-pick from master
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
X-List-Received-Date: Wed, 16 Jul 2014 15:21:37 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Please cherry-pick following patches into daisy branch:

aa7cccf cpuburn-neon: Upgrade to version 20140626
6006202 v4l-utils: Add virtual/libx11 dependency only if X11 is available

I am adding the other maintainers so they can add other changes to be picked.

Cliff and Armin, please ack those if you have no concerns about them.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

