Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A92456D843
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 09:52:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2013 01:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,691,1378882800"; d="scan'208";a="426749780"
Received: from junemccl-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 01:52:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 13 Nov 2013 09:52:12 +0000
Message-ID: <4288657.uTRHH4GjS9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAAQYJAurVuJ8oW67e9Y+JbMQBc4H1uccZPNJ1F6LLJZ3_=B1OQ@mail.gmail.com>
References: <1384292479-15815-1-git-send-email-andrea.adami@gmail.com>
	<CALT56yO=e=o-ZJQqjFS=tYGjeX6YcgfRosTuxn_NnM7g1dHB4Q@mail.gmail.com>
	<CAAQYJAurVuJ8oW67e9Y+JbMQBc4H1uccZPNJ1F6LLJZ3_=B1OQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-yocto: collie: add pcmcia clock fixes for sa11xx
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
X-List-Received-Date: Wed, 13 Nov 2013 09:52:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andrea,

On Wednesday 13 November 2013 10:49:18 Andrea Adami wrote:
> On Wed, Nov 13, 2013 at 12:31 AM, Dmitry Eremin-Solenikov
> 
> <dbaryshkov@gmail.com> wrote:
> > Hello,
> > 
> > On Wed, Nov 13, 2013 at 1:41 AM, Andrea Adami <andrea.adami@gmail.com> 
wrote:
> >> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >> ---
> >> 
> >>  .../linux/linux-yocto-3.10/collie/collie.scc       |   5 +-
> >>  .../patches-sa1100/pcmcia-clock-alias-sa1111.patch |  31 +++++++
> >>  .../pcmcia-sa1100-device-clock.patch               | 100
> >>  +++++++++++++++++++++ .../pcmcia-sa1111-device-clock.patch             
> >>   |  44 +++++++++> 
> > I'd suggest to get only pcmcia-sa1100-device-clock.patch and drop two
> > other patches.
> > They are not of use for collie, since they are for devices with sa1111
> > companion chip
> > 
> > --
> > With best wishes
> > Dmitry
> 
> Good to know, 2 patches less!
> Paul, do you prefer a v2 or a successive patch for cleaning?

I'll take a v2 please since I haven't merged these yet.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

