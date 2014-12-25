Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 98F4F72644
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Dec 2014 01:34:57 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so10842951pde.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Dec 2014 17:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=zSnq63xEdVott+eo6Yr8LOuwCs7oDdILPAMEdeGSwZA=;
	b=dzdK95gANLx/7vGB/W1j+Ww3JqmAKF9bv6drlLQrz6fg8pSCTJ6urwTKDzelSFhvvz
	Xk6Rf5L3xdgGaxgXc4cneH46oyDBaMO3VfdNNpq04PobeENzVqCOTh2P8/lMf6pyKi/q
	hwdSXYtGAq4WwZq12brz038clN6Ip8zk3uGTSh21w0o+pBtQSYp5bR3n9AZwAKHdPQMo
	7Q/FbZIbQZIaMQJoq2OVErsso5npZ7MPC52XO4ophzeDY3w18mRxq5K+GYWy91nzUXt5
	DDeWA80JvexVQKFmZ2odiQG8u0ZATdPZ4ypD4p9+Ig8ZUjYLrLiseK9q8l8Crq6wIU5Z
	oEvQ==
X-Received: by 10.70.128.80 with SMTP id nm16mr57765210pdb.1.1419471298000;
	Wed, 24 Dec 2014 17:34:58 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:5d28:e12b:b1:5c36?
	([2601:c:a700:272f:5d28:e12b:b1:5c36])
	by mx.google.com with ESMTPSA id 9sm23989228pdg.38.2014.12.24.17.34.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Dec 2014 17:34:56 -0800 (PST)
Message-ID: <549B69BB.5000804@gmail.com>
Date: Wed, 24 Dec 2014 17:34:51 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Joe MacDonald <joe@deserted.net>
Subject: proftpd update
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
X-List-Received-Date: Thu, 25 Dec 2014 01:35:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Is anyone working on back porting CVE-2013-4359 to proftpd?  if not, I 
intend on upgrading the recipe to 1.3.5. I will send patches for Dizzy 
and Daisy. ETA, sometime before year's end.

- Armin

