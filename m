Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UAUkA-00081o-So
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 01:19:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2013 16:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,743,1355126400"; d="scan'208";a="268129345"
Received: from unknown (HELO helios.localnet) ([10.255.13.53])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2013 16:03:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2013 00:03:12 +0000
Message-ID: <29610694.jSKIIbYMnE@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <CAMKF1spvgucpsYJs9q16_o7Qz5+WeXmgDFFaF_-uJzx_BLbvdQ@mail.gmail.com>
References: <1361432524-26238-1-git-send-email-raj.khem@gmail.com>
	<10163036.J0OQEGjt9t@helios>
	<CAMKF1spvgucpsYJs9q16_o7Qz5+WeXmgDFFaF_-uJzx_BLbvdQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] kdepimpi: Fix multiline comments
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
X-List-Received-Date: Wed, 27 Feb 2013 00:19:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 26 February 2013 15:28:04 Khem Raj wrote:
> hmmm in angstrom we have been using
> git://github.com/bluelightning/meta-opie.git for fetching meta-opie and
> thats the problem here. I guess above link is not true mirror
> therefore we should use git.oe.org ?

Ah, oops... I neglected to push to that repo as well, now I have done so. 
Mirroring is manual for meta-opie / meta-handheld - maybe it shouldn't be.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


