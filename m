Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EDC0E60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:00:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1024105042"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.13.242])
	by orsmga003.jf.intel.com with ESMTP; 11 Oct 2017 08:00:33 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <CAHUNapRps8ck3S=aKHYH3UmzBgsZW-VDx4x0PgY2D4zXuh88_Q@mail.gmail.com>
	(Trevor Woerner's message of "Wed, 11 Oct 2017 08:20:44 -0400")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<87d15w4a02.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapSvuLFcVyjc+FB4cG7U753SeedOfJ5xCtFLCx-+fK0QVQ@mail.gmail.com>
	<1507662641.20629.9.camel@intel.com>
	<CAHUNapRps8ck3S=aKHYH3UmzBgsZW-VDx4x0PgY2D4zXuh88_Q@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Wed, 11 Oct 2017 17:00:32 +0200
Message-ID: <87r2u93f1r.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 11 Oct 2017 15:00:34 -0000
Content-Type: text/plain

Trevor Woerner <twoerner@gmail.com> writes:

> Hi Raphael,
>
> On Tue, Oct 10, 2017 at 3:10 PM, Kubo Da Costa, Raphael
> <raphael.kubo.da.costa@intel.com> wrote:
>> On Tue, 2017-10-10 at 14:28 -0400, Trevor Woerner wrote:
>> I've pushed commit a0db280 to my chromium61 branch; that one allowed me
>> to get to the end of the build without any other issues. Let me know if
>> that's enough to get master working for you.
>
> Excellent! Yes, this update works for me against master :-)
>
> Has anyone started trying to integrate this with meta-browser?

That's the next part of my plan, I hope to get around to it this week.

