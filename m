Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 355007F3DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:34:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6V6YVU9024578
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Jul 2019 23:34:31 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 30 Jul 2019 23:34:31 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20190731061107.129941-1-kai.kang@windriver.com>
	<20190731063332.GA1647@localhost>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <af9d0099-7723-d772-5028-b72745f50300@windriver.com>
Date: Wed, 31 Jul 2019 14:33:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731063332.GA1647@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] poppler: 0.75.0 -> 0.79.0
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
X-List-Received-Date: Wed, 31 Jul 2019 06:34:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/31 下午2:33, Adrian Bunk wrote:
> On Wed, Jul 31, 2019 at 02:11:07AM -0400, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Update poppler from 0.75.0 to 0.79.0:
>>
>> * remove patch which has been fixed in upstream
> The upgrade was already sent and is now on master-next
> (submitted by Randy MacLeod).
>
>> * correct the way to toggle gobject-introspect support respect to
>>    variable GI_DATA_ENABLED
>> ...
> Looks good to me, can you submit just this on top of master-next?

OK. Got it.

Regards,
Kai


>
> cu
> Adrian
>

-- 
Kai Kang


