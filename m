Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 790D77589E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2015 03:03:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5933aQe006305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Jun 2015 20:03:36 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 20:03:36 -0700
Message-ID: <55765787.8020403@windriver.com>
Date: Tue, 9 Jun 2015 11:03:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1433032319-13061-1-git-send-email-kergoth@gmail.com>	<CAMKF1srmP=02oMEvuNMPbsdd5u3vvc6fv_QmOtL07ydUTuDC0Q@mail.gmail.com>
	<CABcZANnBy7iruPexD8Skf7zXxCHhNg0s4Nru89AniW=uvO-fhA@mail.gmail.com>
In-Reply-To: <CABcZANnBy7iruPexD8Skf7zXxCHhNg0s4Nru89AniW=uvO-fhA@mail.gmail.com>
Subject: Re: [PATCH] ntimed: add recipe to meta-networking (git version)
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
X-List-Received-Date: Tue, 09 Jun 2015 03:03:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 06/09/2015 10:38 AM, Christopher Larson wrote:
> On Mon, Jun 1, 2015 at 1:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sat, May 30, 2015 at 5:31 PM, Christopher Larson <kergoth@gmail.com>
>> wrote:
>>> Ntimed is an unreleased ntpd replacement being sponsored by the Linux
>>> Foundation. Currently it only includes a work-in-progress client, but for
>>> future use this recipe emits an ntimed-client package and an ntimed meta
>>> package which will pull in client and server.
>>>
>>
>> should it have RCONFLICTS with ntp ?
>
>
> Probably, I’ll look into that as well as see about adding a service file &
> startup script, and re-submit after testing that. Thanks.

FYI, it had been merged.

// Robert

>

