Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6719777F90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 09:30:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAM9UBvr028293
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Nov 2017 01:30:11 -0800 (PST)
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 01:30:04 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, akuster808
	<akuster808@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, Khem Raj
	<raj.khem@gmail.com>
References: <bfbfad0b-af40-5448-4aed-fc70eeb95c6c@windriver.com>
	<7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com>
	<37b787d0-ef5a-d821-0c09-a8547c58c52d@gmail.com>
	<e9e12bfb-1b89-d9f1-619e-1896e83837cb@windriver.com>
	<23178b55-e416-a67f-f90f-041f2ab21080@windriver.com>
	<fef8df4e-613a-2baa-398c-f137ce4f8dd1@linux.intel.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <b8624e9c-4dd1-b902-4d0d-0da5d5dacb8c@windriver.com>
Date: Wed, 22 Nov 2017 17:32:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <fef8df4e-613a-2baa-398c-f137ce4f8dd1@linux.intel.com>
Cc: +lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Contribute meta-installer to yocto
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
X-List-Received-Date: Wed, 22 Nov 2017 09:30:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年11月22日 16:58, Alexander Kanavin wrote:
> On 11/22/2017 04:26 AM, Hongxu Jia wrote:
>>> If it is OK, I will send pull request to OE for review, and
>>> my opinion is to suggest to create meta-installer sub layer in OE.
>>>
>>
>> To clarify, I mean to create sub dir meta-installer in
>> git://git.openembedded.org/meta-openembedded
>
> Should the directory be called meta-anaconda then? There are many 
> available installers, and this would make it clear what the directory 
> contains, I think.
>

No problem, the meta-anaconda is OK, thanks for pointing it out

//Hongxu

>
> Alex



