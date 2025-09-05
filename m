Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506CCCA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 07:45:35 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web10.15794.1757058329906145349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 00:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@datenfreihafen.org header.s=2021 header.b=jkH2JhTl;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185, mailfrom: stefan@datenfreihafen.org)
Received: from [192.168.2.30] (unknown [45.118.184.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 0689BC0488;
	Fri,  5 Sep 2025 09:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1757058327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xkWeTb8lOsbwxHBNQAiLG/GOYrFmBBfRltFTpI+7WeM=;
	b=jkH2JhTlc3PgelBVDX5sr4jT/CL6PhAkkZdJOddka0LABnij0/XsXaCjyoUYwP2oOxCc1d
	zmsfMyOORa3rkDhMHBEvuB6O3NpvP7Iz/RtXddbVPZBceefiFSELJQklV1z7XAx2Pfop4/
	l87zZcva+wNvTcX7tfeWY12F8AiXZjVm6l8JqoJ95lH3d+QJ3R9CAZOu4uMUJmZYjUnjql
	WtASpzUH2B9H0/YLmg6Sc0Rg5TXaqAupLnf4UIlGPdNgt32apBXe63tWWIbefHqcM81uUt
	7oiKJ5dEYEHFIyE7ikB+Ri7wRybfom7u/kRtFNjS84bmkKE2HsMCqz0VQbyP7Q==
Message-ID: <2a353817-f1da-4e7c-8b2c-0853779ec054@datenfreihafen.org>
Date: Fri, 5 Sep 2025 09:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Schmidt <stefan@datenfreihafen.org>
Content-Language: en-US
Cc: Jan Lubbe <jlu@pengutronix.de>, stefan.schmidt@linaro.org
Subject: Call for Participation: Embedded & IoT micro-conference at Linux
 Plumbers 2025
To: linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 "linux-wpan@vger.kernel.org" <linux-wpan@vger.kernel.org>,
 BlueZ development <linux-bluetooth@vger.kernel.org>,
 linux-can <linux-can@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>,
 boot-architecture@lists.linaro.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 07:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119312

We are happy to announce that the Embedded & IoT micro-conference was
again accepted for Linux Plumbers this year. Hosted in beautiful Tokyo,
Japan December 11-13.
https://lpc.events/event/19/contributions/2005/

Topics cover all things embedded and IoT. Boot time to kernel size, low
power communication, telemetry and also RTOS. Devicetree and build
system have their own MC and we can move sessions between them as needed.

As with all MC's at Plumbers we are not looking for talks, but rather
discussing current problems and working towards their solution. If your
proposal has a specific stakeholder (maintainer, developer, company)
that would be needed for a fruitful discussion, please mention it in
your submission.

The CfP is open now and will run until October 3rd. Please do not wait
until the end with your submissions as we are going to accept good
proposals even before the end, so the MC might be filled up before 
October 3rd.

Jan & Stefan

