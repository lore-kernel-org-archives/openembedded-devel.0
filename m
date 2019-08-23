Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B32C97F31F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 08:43:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7N8hM4b007856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 01:43:23 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 23 Aug 2019 01:42:37 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20190821123824.17831-1-bunk@stusta.de>
	<53f16418-c309-9809-969a-faf81fb0c0a9@windriver.com>
	<20190823083221.GA9224@localhost>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <2deee8b3-6374-bf4c-56d1-c2c432d87a48@windriver.com>
Date: Fri, 23 Aug 2019 16:42:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823083221.GA9224@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkmanager: Upgrade 1.18.0 -> 1.18.2
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
X-List-Received-Date: Fri, 23 Aug 2019 08:43:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/23 下午4:32, Adrian Bunk wrote:
> On Fri, Aug 23, 2019 at 04:12:25PM +0800, Kang Kai wrote:
>> On 2019/8/21 下午8:38, Adrian Bunk wrote:
>>> Remove a generated file with always changing hash from LIC_FILES_CHKSUM.
>> Why not just upgrade to version 1.20.0 which is the latest major release?
> I was just doing the low-effort upgrade on the same stable branch,
> if you want to upgrade to 1.20 then go ahead.

OK.

Kai


>
>> Regards,
>> Kai
> cu
> Adrian
>

-- 
Kai Kang


