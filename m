Return-Path: <andreas.baak@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D8707605D2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jul 2015 11:05:23 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so77030124wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jul 2015 04:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:date:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=1ymORoZ5sjLov51McESdwSu338qqWwvZ1bMskCnzno8=;
	b=F3KBPNC3iiu0HRzGMX7NtVJaJVz+j6t5EtUF4xO4n/RsnSr+iK0ZM5pjl9bcu/Th33
	FzQVT35GO+ITcZnHO6Za4C6k89GBQRS4S1oNHRCK2h2K4qWBiWgGRIj6muYBjkBVQR5W
	uK5bXzJ/n2swMIbcZ/VQKABi811iQ1KCvwJJQ6vybg1Cm45zfns5E5ivinzoJl/s1NnL
	U1lZJ7uZmGnN2LF2s++0aT66lik9IRZBaQAqBpLyPysG0Ob9xCkdQ0ynCQrcvUPyjiFc
	0iJg4HIJPwnjUyfhA1Fm3vsveEmYxw2P29PcXQwtAnSFwlniW4TUudLPX6csf0duliG6
	OzsQ==
X-Received: by 10.180.182.112 with SMTP id ed16mr13690748wic.19.1437908722594; 
	Sun, 26 Jul 2015 04:05:22 -0700 (PDT)
Received: from [192.168.178.33]
	(ipservice-092-211-162-020.092.211.pools.vodafone-ip.de.
	[92.211.162.20]) by smtp.googlemail.com with ESMTPSA id
	fz16sm7744786wic.3.2015.07.26.04.05.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Jul 2015 04:05:22 -0700 (PDT)
From: Andreas Baak <andreas.baak@gmail.com>
X-Google-Original-From: Andreas Baak <Andreas.Baak@gmail.com>
Message-ID: <55B4BEF1.8050901@gmail.com>
Date: Sun, 26 Jul 2015 13:05:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][fido] Pull request: ligphoto update to v2.5.8 + new recipe for gphoto2 v2.5.8
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
X-List-Received-Date: Sun, 26 Jul 2015 11:05:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm using github since one of the paches has got a size of 2.5 MB due to 
regenerated config files.

https://github.com/openembedded/meta-openembedded/pull/15

Cheers,
Andreas

