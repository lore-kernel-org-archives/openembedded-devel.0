Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 680A272F96
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 07:51:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7T7pYa7011189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 00:51:34 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 29 Aug 2017 00:51:33 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20170824151657.20748-1-kai.kang@windriver.com>
	<937cda69-98b8-358b-b027-24d90b954597@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <53d8d212-14a3-d8c7-085b-7ab70ee96735@windriver.com>
Date: Tue, 29 Aug 2017 15:53:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <937cda69-98b8-358b-b027-24d90b954597@windriver.com>
Subject: Re: [meta-oe][PATCH] imagemagick: 7.0.5 -> 7.0.6_9
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
X-List-Received-Date: Tue, 29 Aug 2017 07:51:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年08月25日 05:29, Randy MacLeod wrote:
> On 2017-08-24 11:16 AM, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade imagemagick from 7.0.5 patchset 6 to 7.0.9 patchset 9.
>>
>> * update SRC_URI. Replace tarball with git repo that it only keeps
>>    latest tarball on www.imagemagick.org
>
> This avoids the imagemagick disappearing tarball problem but
> the impact is ~350 MB for the git repo rather than  8 MB for
> the tarball.
>
> Any objections to using the gentoo distfiles site:
> http://distfiles.gentoo.org/distfiles/
>
>
> Kai, If not please send a revised upgrade to 7.0.6 using that URL.

OK. I'll be waiting for 2 more days.

--Kai

>
> ../Randy
>
>
>
>

-- 
Regards,
Neil | Kai Kang


