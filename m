Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71A987C3E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2019 01:26:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0V1QLu3004630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Jan 2019 17:26:21 -0800 (PST)
Received: from [128.224.163.169] (128.224.163.169) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Wed, 30 Jan 2019 17:26:08 -0800
To: Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <1537974727-33976-1-git-send-email-hongxu.jia@windriver.com>
	<576ae4d4-e072-bdcb-ac85-7f3cd14a7352@windriver.com>
	<CAMKF1sqpB=Ymvc1bb=tr+if1+9hkb4fOjNV_1xsHr=SPz6npMg@mail.gmail.com>
	<865340f5-30d3-9110-3799-709babb2cf9b@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <4f5552c0-730c-46ca-3ea6-88fb2c326cc4@windriver.com>
Date: Thu, 31 Jan 2019 09:26:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <865340f5-30d3-9110-3799-709babb2cf9b@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] php5: 5.6.36 -> 5.6.38
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
X-List-Received-Date: Thu, 31 Jan 2019 01:26:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/1/31 上午12:43, Randy MacLeod wrote:
> On 1/30/19 11:33 AM, Khem Raj wrote:
>> Hi Randy
>>
>> It would better to put it on the list of deprecated packages for a
>> release before removing it.
>
> Khem,
>
> That works for me.
> Where is the list of deprecated packages?
> Neither google nor I could find it.
>
> Hongxu,
> Will you update to 5.6.40 sometime please?

I am afraid no, the reason why I upgraded it is the compiling failure

with new openssl 1.1.x, after fix the build failure, I am no longer to

maintain php5.

//Hongxu


