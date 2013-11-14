Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DF6CF6D614
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 11:57:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2013 03:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="435172065"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.79])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2013 03:57:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Adam Lee <adam.yh.lee@gmail.com>, Tom King <ka6sox@gmail.com>
Date: Thu, 14 Nov 2013 11:57:08 +0000
Message-ID: <11078227.Ap2jLt1X9L@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
	<CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: libmpd-11.8.17 gets 404 Not Found
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
X-List-Received-Date: Thu, 14 Nov 2013 11:57:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 November 2013 19:14:22 Adam Lee wrote:
> Sorry, I shouldn't have mentioned anything about updating to Dora from
> Dylan.
> This 404 is happening in Dylan build.
> 
> On Tue, Nov 12, 2013 at 7:07 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Hello everyone, my first post here. Not sure if I am posting at the right
> > place.
> > I am updating my meta layer to Dora from Dylan. At the moment,
> > libmpd-11.8.17 is getting 404 Not Found. It is here -
> > http://downloads.sourceforge.net/musicpd/libmpd/11.8.17/libmpd-11.8.17.tar
> > .gz .
> > 
> > Not sure if it's a temporary issue. Anyone else ran into this?

Looks like it's vanished upstream... :/ I'm not familiar with this particular 
project and I can't tell what's going on with this particular component, but I 
did find an alternative download location:

http://download.sarine.nl/Programs/gmpc/11.8/libmpd-11.8.17.tar.gz

Until we figure out what's happened upstream we can add this to the OE source 
mirror. Tom, could you please take care of that?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

