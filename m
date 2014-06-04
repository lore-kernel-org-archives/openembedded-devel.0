Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE5256FA73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 01:25:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s541P6hR025287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jun 2014 18:25:06 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 3 Jun 2014 18:25:05 -0700
Message-ID: <538E7566.7070506@windriver.com>
Date: Wed, 4 Jun 2014 09:24:54 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
	<537D5AC7.8040302@windriver.com>
	<1823759.lCmpzXZFSI@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1823759.lCmpzXZFSI@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH v4 00/10] add perl modules
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
X-List-Received-Date: Wed, 04 Jun 2014 01:25:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2014 12:19 AM, Paul Eggleton wrote:
> Hi Hongxu,
>
> On Thursday 22 May 2014 10:02:47 Hongxu Jia wrote:
>> On 05/21/2014 03:43 PM, Tim Orling wrote:
>>> From: Tim Orling <TicoTimo@gmail.com>
>>>
>>> Changes since v3:
>>>     * Use ${CPAN_MIRROR} for all recipes
>>>     
>>>         * See patches for oe-core:
>>>             http://patches.openembedded.org/patch/72457/
>>>             http://patches.openembedded.org/patch/72459/
>> It seems these patches for oe-core have not been merged.
> They have been merged now, in which case should I merge these meta-perl
> patches or do you want to?

Hi Paul,

They are fine to me since the oe-core patches have been merged,
I am afraid I do not have the permission to merge these meta-perl
patches, so you could merge these [v4 1-9] and [v5 10] patches.

//Hongxu

> Cheers,
> Paul
>


