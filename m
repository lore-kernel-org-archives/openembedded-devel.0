Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0456C994
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 17:16:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2013 10:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,972,1371106800"; d="scan'208";a="382913055"
Received: from unknown (HELO helios.localnet) ([10.252.120.52])
	by orsmga001.jf.intel.com with ESMTP; 24 Sep 2013 10:16:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <joe@deserted.net>
Date: Tue, 24 Sep 2013 18:16:33 +0100
Message-ID: <62747590.0CPS7u3973@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130923182159.GA30829@deserted.net>
References: <1379927191-21769-1-git-send-email-b40290@freescale.com>
	<10075581.zIxvIPmXvh@helios> <20130923182159.GA30829@deserted.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] snort: add recipe
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
X-List-Received-Date: Tue, 24 Sep 2013 17:16:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Joe,

On Monday 23 September 2013 14:22:02 Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH 1/3] snort: add recipe] On 13.09.23 (Mon
> 18:56) Paul Eggleton wrote:
> > 
> > I'm a bit confused; is this recipe supposed to be going into
> > meta-networking or meta-security? Because patches have been sent
> > recently to add it to both.
> 
> I had mentioned that I would accept snort into meta-networking if it
> wasn't a good fit for meta-security since it was something I'd started
> working on integrating anyway a while back.  I assumed that was the case
> since it was sent to the list for meta-networking today.
> 
> I don't think we need copies in both places, though, and since it was
> first aimed at meta-security, if it gets merged there, I won't merge it
> here.
> 
> Hopefully nothing I've said here contradicts what the meta-security
> maintainers would want to see.

I would have thought it would go into meta-security myself; but ultimately 
it's up to you and Saul really. I just wanted to make sure we didn't somehow 
end up with it in both layers since we have patches for adding it to both.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

