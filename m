Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4D6860807
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 18:16:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0OIG6Wf018590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 10:16:16 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 24 Jan 2019 10:15:55 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <20190124035832.14257-1-Randy.MacLeod@windriver.com>
	<4dec5db8-8391-9c4f-74b0-a06c974358fc@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <45ad54a4-338d-f50f-7780-a5fea2e7d0b2@windriver.com>
Date: Thu, 24 Jan 2019 13:15:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <4dec5db8-8391-9c4f-74b0-a06c974358fc@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] libvncserver: Update to latest commit post 0.9.12
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
X-List-Received-Date: Thu, 24 Jan 2019 18:16:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

I missed that there were a couple of updates to libvncserver in flight.
I've rebased noted that the PKGCFG[lzo] needs -DWITH_LZO=OFF
I'll retest and resend.

../Randy

