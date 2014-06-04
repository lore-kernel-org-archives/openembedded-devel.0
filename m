Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C2D60609BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 10:03:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jun 2014 03:03:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,972,1392192000"; d="scan'208";a="440719763"
Received: from sawijeko-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.128])
	by azsmga001.ch.intel.com with ESMTP; 04 Jun 2014 03:03:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 04 Jun 2014 11:03:01 +0100
Message-ID: <1411184.bND7zk5i1B@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <538E7566.7070506@windriver.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
	<1823759.lCmpzXZFSI@peggleto-mobl5.ger.corp.intel.com>
	<538E7566.7070506@windriver.com>
MIME-Version: 1.0
Subject: Re: [meta-perl][PATCH v4 00/10] add perl modules
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
X-List-Received-Date: Wed, 04 Jun 2014 10:03:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 04 June 2014 09:24:54 Hongxu Jia wrote:
> On 05/31/2014 12:19 AM, Paul Eggleton wrote:
> > Hi Hongxu,
> > 
> > On Thursday 22 May 2014 10:02:47 Hongxu Jia wrote:
> >> On 05/21/2014 03:43 PM, Tim Orling wrote:
> >>> From: Tim Orling <TicoTimo@gmail.com>
> >>> 
> >>> Changes since v3:
> >>>     * Use ${CPAN_MIRROR} for all recipes
> >>>     
> >>>         * See patches for oe-core:
> >>>             http://patches.openembedded.org/patch/72457/
> >>>             http://patches.openembedded.org/patch/72459/
> >> 
> >> It seems these patches for oe-core have not been merged.
> > 
> > They have been merged now, in which case should I merge these meta-perl
> > patches or do you want to?
> 
> Hi Paul,
> 
> They are fine to me since the oe-core patches have been merged,
> I am afraid I do not have the permission to merge these meta-perl
> patches, so you could merge these [v4 1-9] and [v5 10] patches.

OK, I've merged these.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

