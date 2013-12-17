Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5268060CF8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 18:01:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 17 Dec 2013 09:57:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,502,1384329600"; d="scan'208";a="445798184"
Received: from paulonei-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.28])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2013 09:59:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Dec 2013 17:59:38 +0000
Message-ID: <3298143.iEj80ZMb3k@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20131217173636.GI3706@jama>
References: <1386169150-16816-1-git-send-email-patrick.patat@innotis.org>
	<2191053.tE6l0jqt1n@helios> <20131217173636.GI3706@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH V2] add libcrypt-openssl-rsa-perl
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
X-List-Received-Date: Tue, 17 Dec 2013 18:01:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 December 2013 18:36:36 Martin Jansa wrote:
> On Tue, Dec 17, 2013 at 04:29:04PM +0000, Paul Eggleton wrote:
> > Hongxu, could you please look at this and the other outstanding meta-perl
> > patch?
> > 
> > http://patchwork.openembedded.org/project/oe/list/?q=meta-perl&archive=bot
> > h
> 
> This is even better link:
> http://patchwork.openembedded.org/bundle/jama/meta-perl/?archive=both
> 
> and also
> http://patchwork.openembedded.org/bundle/jama/meta-filesystems/?archive=both

Well, except that those other patches from Emil weren't really sent correctly, 
so I've marked them as rejected. Hopefully Emil will fix up and re-send a new 
series; in the mean time the current WIP is here FYI (see also unmerged pull 
request from me on that repo):

https://github.com/EmilRP/public_bb_recipes/

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

