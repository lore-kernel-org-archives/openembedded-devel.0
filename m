Return-Path: <k4230r6@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7A871633
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Nov 2015 09:16:48 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so33362002wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Nov 2015 01:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=ze4AFs5jDTrmfKZ0lFcEz9CZHLiEe73ZfwZOAQ3YjjU=;
	b=sF/Zgs2dA1OPf/9s3dAJvcjGh0V9iVekxJLDzzY5mzdqlhvl2W/DuCyYp4pMxOSYnb
	BANYtaD3FF792/qZz1O1gXwaQR0yujTT5Ksq+X1xhuqV5FAP58kYvj569B6XtJImz7I5
	YURY2i/WC84rl6htbycHbnupkwMR1AIRZDfFsOIF7tukQCmOuZEo4NJxvv7qgavmZTIl
	i62FxcIzUND+xLV1sMlQSk4PDSZJ539ZgGbH9PnPhmhhLSsfgKNkPbJCyArKmyZqGW6X
	vM+c70fikouqnTlBdJkdHJyIhm+SzcVF6SWURx4hTLks2Rm0CBkEGa+7HjRgHVOkcb9I
	JUjg==
X-Received: by 10.194.71.16 with SMTP id q16mr16720318wju.49.1446369407548;
	Sun, 01 Nov 2015 01:16:47 -0800 (PST)
Received: from [192.168.23.113]
	(HSI-KBW-46-223-219-101.hsi.kabel-badenwuerttemberg.de.
	[46.223.219.101]) by smtp.googlemail.com with ESMTPSA id
	c1sm16099873wjf.19.2015.11.01.01.16.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Nov 2015 01:16:47 -0800 (PST)
Message-ID: <5635D87E.3070504@gmail.com>
Date: Sun, 01 Nov 2015 10:16:46 +0100
From: Christian Ege <k4230r6@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Yocto on the UDOO Neo
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
X-List-Received-Date: Sun, 01 Nov 2015 09:16:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,

if you have participated in the UDOO Neo Kickstarter campaign and
received your UDOO Neo you can try my meta-fsl-arm-extra fork with
UDOO Neo support

https://github.com/graugans/meta-fsl-arm-extra

My changes are in branch fido.

I'll prepare patches to meta-fsl-arm-extra when I have done more
testing.

In my branch there is also support for udooquad but those are fairly
untested because I do not have one.

regards,
Christian

