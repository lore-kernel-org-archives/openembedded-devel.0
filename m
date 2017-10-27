Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 46A0E7197A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 08:49:41 +0000 (UTC)
Received: from [192.168.24.183] (p54AC5F3C.dip0.t-ipconnect.de [84.172.95.60])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 93B36280903;
	Fri, 27 Oct 2017 08:46:35 +0000 (UTC)
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	Trevor Woerner <twoerner@gmail.com>
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<87d15w4a02.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapSvuLFcVyjc+FB4cG7U753SeedOfJ5xCtFLCx-+fK0QVQ@mail.gmail.com>
	<1507662641.20629.9.camel@intel.com>
	<CAHUNapRps8ck3S=aKHYH3UmzBgsZW-VDx4x0PgY2D4zXuh88_Q@mail.gmail.com>
	<87r2u93f1r.fsf@rkubodac-desk.ger.corp.intel.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <b8acd1ce-4c60-ac3d-4c48-fca5d9b43f26@zonque.org>
Date: Fri, 27 Oct 2017 10:49:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <87r2u93f1r.fsf@rkubodac-desk.ger.corp.intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 27 Oct 2017 08:49:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On Wednesday, October 11, 2017 05:00 PM, Raphael Kubo da Costa wrote:
> Trevor Woerner <twoerner@gmail.com> writes:
>> Hi Raphael,
>>
>> On Tue, Oct 10, 2017 at 3:10 PM, Kubo Da Costa, Raphael
>> <raphael.kubo.da.costa@intel.com> wrote:
>>> On Tue, 2017-10-10 at 14:28 -0400, Trevor Woerner wrote:
>>> I've pushed commit a0db280 to my chromium61 branch; that one allowed me
>>> to get to the end of the build without any other issues. Let me know if
>>> that's enough to get master working for you.
>>
>> Excellent! Yes, this update works for me against master :-)
>>
>> Has anyone started trying to integrate this with meta-browser?
> 
> That's the next part of my plan, I hope to get around to it this week.

I'd like to give Chromium 62 a shot on arm64, but the recipes currently
only support x11, is that correct? My platform is based on wayland, any
plans on supporting that?


Thanks,
Daniel

