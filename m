Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 344DC747FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 16:02:03 +0000 (UTC)
Received: from [192.168.0.106] (cpe-174-109-247-98.nc.res.rr.com
	[174.109.247.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0B2822084D;
	Fri,  5 Oct 2018 16:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1538755324;
	bh=fJqIRYvR+djyiqB/krDCz7EZ9zNh/x/dsJ0mEfm4CdI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=ORupC40mlZIVz6N5py44Q0vuwYYY0wRc5GdBH56qZ7Hu5Bfxez39Tanb/hGOtOMRb
	DBOH2V5gLwfei4qLRsatC+V1sjxeV62FnMWcBhf6XEzd4IMlCtrdtNbxz7S1BVPjmp
	+gys0vuuJxCwU2d6gXX/ENt2IqAURZlAYzhrkxbo=
To: akuster808 <akuster808@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
References: <fe502ba2-ec63-285a-9e43-1a72d8e9365d@kernel.org>
	<CADkTA4MXWfH=TY4hDro=33nvoPBYNx3P-4uEY2k=Li+xsadhfQ@mail.gmail.com>
	<5e0741fc-371c-16ac-ae02-0c5a02167a91@kernel.org>
	<728619d5-f5bc-f0ed-a1ac-bc1ef905ae68@gmail.com>
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <c2ace759-e477-7d2c-05c4-9fe92b9cfd93@kernel.org>
Date: Fri, 5 Oct 2018 12:02:02 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <728619d5-f5bc-f0ed-a1ac-bc1ef905ae68@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [sumo] [meta-virtualization] [PATCH v1] docker: CVE-2018-10892
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
X-List-Received-Date: Fri, 05 Oct 2018 16:02:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/5/2018 12:00 PM, akuster808 wrote:
> Sinan,
> 
> 
> On 10/05/2018 08:55 AM, Sinan Kaya wrote:
>> On 10/5/2018 11:41 AM, Bruce Ashfield wrote:
>>> Wrong list.
>>>
>>> This needs to go to the meta-virtualization mailing list.
>>
>> Thanks for the heads up. Is there a document somewhere saying which
>> patch needs to go to which list?
> 
> Every Layer should have  a README. That README should include where to
> send patches.
> 
> |Maintenance ----------- Send pull requests, patches, comments or
> questions to meta-virtualization@yoctoproject.org Maintainer: Bruce
> Ashfield <bruce.ashfield@gmail.com> When sending single patches, please
> using something like: $ git send-email -1 -M --to
> meta-virtualization@yoctoproject.org
> --subject-prefix='meta-virtualization][PATCH' The mailing list you will
> need to subscribe to Hope this helps. - Armin |
> 
>>
>> This is the second time I screwed up.
> 
> 

Got it. I just needed to know where to look.

