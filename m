Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24ACC6025E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 20:15:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v86KFhOk001177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 6 Sep 2017 13:15:43 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 13:15:42 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-31-git-send-email-mark.hatle@windriver.com>
	<CALbNGRTmfx=4wMisDjkpkLmudikRdtf21YFtPjCK1FJJw7JMFQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <25388b3d-1aef-a470-72bd-21d7dc6b995e@windriver.com>
Date: Wed, 6 Sep 2017 15:15:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRTmfx=4wMisDjkpkLmudikRdtf21YFtPjCK1FJJw7JMFQ@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 30/31] florence: update 0.6.3
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
X-List-Received-Date: Wed, 06 Sep 2017 20:15:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/6/17 2:59 PM, Andreas Müller wrote:
> On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> From: Andreas Müller <schnitzeltony@googlemail.com>
>>
>> * patches were either leftovers or do not match the code
>> * DESCRIPTION -> shortened SUMMARY
>>
>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>>
>> Added gtk+3 dependency and resolved conflicts
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

> There were certain reasons this was not accepted. Are these obsolete these days?

Reading back a year ago the comments indicated that some of the dependencies
were incorrect and there were some other packages that may be wrong.  These have
been fixed (in the other packages).

I do not have a way to check the functionality of the patch, other then it
compiles and I'm going off your original patch.

Looking at Debian and others, this appears to be the version of florence they
are using.

--Mark

