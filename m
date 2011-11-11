Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ROsuL-0003ED-Hj
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 16:20:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Nov 2011 07:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,494,1315206000"; d="scan'208";a="89163837"
Received: from unknown (HELO helios.localnet) ([10.252.121.143])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2011 07:14:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David Thomas <david.thomas@microbee-systems.com>
Date: Fri, 11 Nov 2011 15:14:23 +0000
Message-ID: <1997795.hUxCJJ3qle@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <CALJpqJzSkZ9g1kSqztyjHk6M-cjZX=Bj-5K06D0V7nHJpLesxQ@mail.gmail.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<6416131.BOns2L3oYb@helios>
	<CALJpqJzSkZ9g1kSqztyjHk6M-cjZX=Bj-5K06D0V7nHJpLesxQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Fri, 11 Nov 2011 15:20:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 11 November 2011 08:51:15 you wrote:
> Returning the recipe to the original

Sorry if it wasn't clear but the matchbox svn repositories are gone and won't 
be coming back - they have been replaced by git repositories on 
yoctoproject.org; so you do need to at least correct that assuming you aren't 
using any mirrors (and it sounds like you aren't - I verified this morning that 
Angstrom has matchbox-keyboard in its source mirror).

> I am building for the COMPULAB T-CM3530 using the kernel they post online.
> The build platform is Ubuntu 10 LTS

What I was after was what DISTRO is set to in your conf/local.conf...?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


