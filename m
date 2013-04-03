Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UNRaO-0000zt-13
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 19:35:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Apr 2013 10:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="313114306"
Received: from unknown (HELO helios.localnet) ([10.255.13.159])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2013 10:17:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Apelete Seketeli <apelete@seketeli.net>
Date: Wed, 03 Apr 2013 18:17:26 +0100
Message-ID: <1596531.UkNzIxF3VC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <cover.1364806552.git.apelete@seketeli.net>
References: <cover.1364806552.git.apelete@seketeli.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 0/2] Pull request 20130401
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
X-List-Received-Date: Wed, 03 Apr 2013 17:35:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 April 2013 11:13:24 Apelete Seketeli wrote:
> The patches that come as a follow-up of this message add machine
> support for Qi-Hardware's Ben Nanonote handheld.
> The recipes were imported from "oe-classic" and fixed to comply to the
> rules in oe-core. This work is intended to be used by the JLime
> distribution which is being ported to oe-core.
> 
> The modifications are done on top of the master branch in the
> meta-handheld layer.
> Please pull into the meta-handheld layer.
> 
> The following changes since commit a268810f7c2c1f13e01cc02bcddc23c46118551d:
> 
>   linux-yocto-tiny-kexecboot: add patch fixing mtd on SL-C3200 (2013-03-20
> 09:23:00 +0000)
> 
> are available in the git repository at:
> 
>   git://seketeli.fr/~apelete/meta-handheld.git add-nanonote
> 
> Apelete Seketeli (2):
>   ben-nanonote: import ben-nanonote machine support
>   ben-nanonote: clean machine conf according to oe-core rules

Merged these two squashed into commit (as discussed on IRC) - thanks!

FYI you may be able to consider a switch away from kdrive since xorg is a lot 
slimmer these days and is actually maintained, but I'll leave that up to you.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


