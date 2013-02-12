Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U5Gju-0005S0-Oj
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 15:21:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2013 06:05:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="261519923"
Received: from unknown (HELO helios.localnet) ([10.252.120.87])
	by orsmga001.jf.intel.com with ESMTP; 12 Feb 2013 06:05:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Seth Bollinger <seth.boll@gmail.com>
Date: Tue, 12 Feb 2013 14:05:40 +0000
Message-ID: <7914520.L5PIRPJvTF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <CA+JN8xNsJ-74AP6g30Bmt7u4Qg2PWC46E-s3ZS5_mFKgUhyKSg@mail.gmail.com>
References: <CA+JN8xNsJ-74AP6g30Bmt7u4Qg2PWC46E-s3ZS5_mFKgUhyKSg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Recipes for building ruby modules (rake, gems, etc.)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 14:21:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 01 September 2012 08:54:11 Seth Bollinger wrote:
> I have a few ruby modules I need to create recipes for.  Are there any that
> already exist to run rake and gem building tasks (I need to build C
> extensions as well)?  I spent some time looking, but didn't find any.  I
> would like to reuse work before trying to roll my own.

Hi, I know this is quite an old post but in case you haven't seen, we now have 
a meta-ruby layer in the meta-openembedded repository which at least has the 
beginnings of ruby support. We'd welcome patches to improve this if you have 
anything beyond what's there.

http://cgit.openembedded.org/meta-openembedded/tree/meta-ruby

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


