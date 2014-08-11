Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 047AD65DB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:25:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Aug 2014 13:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,844,1400050800"; d="scan'208";a="467569137"
Received: from sdoherty-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.218])
	by azsmga001.ch.intel.com with ESMTP; 11 Aug 2014 13:25:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 11 Aug 2014 21:25:45 +0100
Message-ID: <1467178.TQ7IpLXcoq@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CAP9ODKpGbmi=dsvubh9O-ok9_Enc5cewtdC6TQ+H0OJo3Y3_-w@mail.gmail.com>
References: <1407177515-15086-1-git-send-email-otavio@ossystems.com.br>
	<CAOd_LFyOC8uR2gk=u2YpB1cq8P_hkqHoYKDxUmou=y1UcBDnVA@mail.gmail.com>
	<CAP9ODKpGbmi=dsvubh9O-ok9_Enc5cewtdC6TQ+H0OJo3Y3_-w@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] evtest: Stop using Cgit based archive
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
X-List-Received-Date: Mon, 11 Aug 2014 20:25:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 11 August 2014 17:06:30 Otavio Salvador wrote:
> Hello Martin,
> 
> On Mon, Aug 4, 2014 at 6:26 PM, Cliff Brake <cbrake@bec-systems.com> wrote:
> > On Mon, Aug 4, 2014 at 2:46 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >> Hello Martin,
> >> 
> >> On Mon, Aug 4, 2014 at 3:38 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >>> The Cgit based archive may change depending on the order of images,
> >>> timestamp and like causing checksum to change.
> >>> 
> >>> This patch uses the same 1.25 version but fetching it using Git, so no
> >>> code changes are done.
> >>> 
> >>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> 
> >> Please queue this update for Daisy as well, as this is failing to
> >> fetch currently (cced other Daisy maintainers).
> >> 
> >> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> > 
> > Acked-by: Cliff Brake <cbrake@bec-systems.com>
> 
> Please merged this.

It's already merged:

http://cgit.openembedded.org/meta-openembedded/commit/?id=9c762b824cbf7ecd9ce7f7859d22ff89c59fa28d

-- 

Paul Eggleton
Intel Open Source Technology Centre

