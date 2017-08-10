Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 868C9719C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 14:18:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 10 Aug 2017 07:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,353,1498546800"; d="scan'208";a="1002162291"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2017 07:18:14 -0700
Message-ID: <1502375212.29285.17.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Behan Webster <behanw@converseincode.com>
Date: Thu, 10 Aug 2017 09:26:52 -0500
In-Reply-To: <879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
	<879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Alpha release of check-requirement.sh
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
X-List-Received-Date: Thu, 10 Aug 2017 14:18:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-09 at 21:40 -0700, Behan Webster wrote:
> > On Aug 9, 2017, at 7:22 AM, Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> > 
> > in my opinion, this fits nicely into the oe-core, into the
> > scripts/contrib folder.
> 
> Keeping it in script/contrib seems odd to me (horse before the cart). One of the requirements for OE is git (or tar) to actually get OE in the first place.
> 
> I see this as more something some one would run before cloning OE or Poky. It’s a replacement for needing to read a long HOWTO on a webpage to get started with OE or YP.


this installation way can help

$ curl <path to the script inside git repo> | sh



> 
> Behan



