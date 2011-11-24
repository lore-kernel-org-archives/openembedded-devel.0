Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTVw1-0000u8-5k
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 10:49:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Nov 2011 01:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,563,1315206000"; d="scan'208";a="40810330"
Received: from unknown (HELO helios.localnet) ([10.252.121.185])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Nov 2011 01:43:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 09:43:01 +0000
Message-ID: <1864854.crejHBLR9b@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <CA+chaQeWRbSCXk_vxsB7Nfoarh11fTSAZsteKf62T2DaSt0-xw@mail.gmail.com>
References: <cover.1321575642.git.andrea.adami@gmail.com>
	<CAAQYJAs=jxLf8moiFwNyg3Rnqxe2EHe4c4ARrZW3ms2VrS=5JQ@mail.gmail.com>
	<CA+chaQeWRbSCXk_vxsB7Nfoarh11fTSAZsteKf62T2DaSt0-xw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 5/5] linux: remove unused git version
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
X-List-Received-Date: Thu, 24 Nov 2011 09:49:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 24 November 2011 10:24:44 Martin Jansa wrote:
> Are you going to refresh and refactor something or is this patchset
> fine if Paul applies only first 3? Because your 3.1.2 patch says it
> should be applied on top of this..
> 
> If you or Paul want I can send pull request with first 3 from this +
> 3.1.2 and my changes to linux-kexecboot.inc + 3.2.0-rc3, because I
> have it all in jansa/spitz anyway.

We discovered last night that we can't move hx4700 to 3.1 because the 
necessary patches don't apply. However as of this morning I do now have 
patches against 3.2.0-rc2 (hopefully they also apply against rc3).

My suggestion would be to produce a new set of patches that only affects the 
Zaurus machines and we can handle the iPAQs separately.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


