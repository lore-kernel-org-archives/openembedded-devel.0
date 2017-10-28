Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2113D71975
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2017 16:13:23 +0000 (UTC)
Received: from [192.168.178.170] (pD95EFDA0.dip0.t-ipconnect.de
	[217.94.253.160])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 175F3280321;
	Sat, 28 Oct 2017 16:10:16 +0000 (UTC)
To: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>,
	openembedded-devel@lists.openembedded.org
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<87d15w4a02.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapSvuLFcVyjc+FB4cG7U753SeedOfJ5xCtFLCx-+fK0QVQ@mail.gmail.com>
	<1507662641.20629.9.camel@intel.com>
	<CAHUNapRps8ck3S=aKHYH3UmzBgsZW-VDx4x0PgY2D4zXuh88_Q@mail.gmail.com>
	<87r2u93f1r.fsf@rkubodac-desk.ger.corp.intel.com>
	<b8acd1ce-4c60-ac3d-4c48-fca5d9b43f26@zonque.org>
	<26a54d7c-1c81-8ba9-9d1f-3a62803a85a8@igalia.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <12b79fae-1807-1f2e-8d9b-527cdf8a7ee4@zonque.org>
Date: Sat, 28 Oct 2017 18:13:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <26a54d7c-1c81-8ba9-9d1f-3a62803a85a8@igalia.com>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Sat, 28 Oct 2017 16:13:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On Friday, October 27, 2017 11:19 AM, Jacobo Aragunde Pérez wrote:
> On 27/10/17 10:49, Daniel Mack wrote:
>>
>> I'd like to give Chromium 62 a shot on arm64, but the recipes currently
>> only support x11, is that correct? My platform is based on wayland, any
>> plans on supporting that?
>>
> 
> The problem is that upstream Chromium does not support Wayland natively
> yet. There is a fork under development to implement this support, which
> is quite advanced now: https://github.com/Igalia/chromium
> 
> Patches from the fork will start pouring into upstream Chromium shortly.
> 

I see, thanks for explaining. I'll wait for these upstream patches and
your recipes to land then!


Thanks,
Daniel

