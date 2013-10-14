Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id ED3FF6CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 12:57:02 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Oct 2013 05:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,492,1378882800"; d="scan'208";a="374439590"
Received: from unknown (HELO helios.localnet) ([10.252.120.188])
	by azsmga001.ch.intel.com with ESMTP; 14 Oct 2013 05:56:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Oct 2013 13:56:58 +0100
Message-ID: <2456950.UMMXiRMQjO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <l3gp6o$uq8$1@ger.gmane.org>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
	<1596233.ZQ7J3xl2Nd@helios> <l3gp6o$uq8$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/6] libraw1394: add recipe
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
X-List-Received-Date: Mon, 14 Oct 2013 12:57:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 October 2013 14:48:36 Koen Kooi wrote:
> Op 13-10-13 13:10, Paul Eggleton schreef:
> > On Sunday 13 October 2013 01:43:50 Khem Raj wrote:
> >> From: Cliff Brake <cbrake@bec-systems.com>
> >> 
> >> Initial recipe created by Khem Raj
> >> 
> >> Signed-off-by: Cliff Brake <cbrake@bec-systems.com> Signed-off-by: Khem
> >> Raj <raj.khem@gmail.com> ---
> >> meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb | 11
> >> +++++++++++
> > 
> > Could these multimedia recipes go into meta-multimedia instead of
> > meta-oe?
> 
> FWIW, libraw1394 is the libusb for firewire, so it's not multimedia related,
> the other recipes like coriander and mikmod are. I'm not sure I'd put
> opencv in the multimedia category, though.

Right, agreed. So of this patchset coriander should probably go into meta-
multimedia. There are other multimedia recipes in meta-oe that ought to be 
moved there, so we could leave moving libmikmod until those are moved.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

