Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ULDFJ-0005CL-4H
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 14:52:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2013 06:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,925,1355126400"; d="scan'208";a="309755595"
Received: from unknown (HELO helios.localnet) ([10.255.13.158])
	by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2013 06:34:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 28 Mar 2013 13:34:56 +0000
Message-ID: <11972732.k3n4Vx4bzS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1364469370-12082-1-git-send-email-paul@paulbarker.me.uk>
References: <1364469370-12082-1-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][TEMP PATCH] gd: Temporary patch while libgd.org is down, do not commit to main repository!
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
X-List-Received-Date: Thu, 28 Mar 2013 13:52:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 28 March 2013 11:16:10 Paul Barker wrote:
> This is just a temporary patch to change the SRC_URI for gd as the upstream
> source libgd.org has been down for a week or so now. The MD5 and SHA256 sums
> match so this should be the exact same archive. It is not intended to go in
> the main repository but may be useful to some of you until libgd.org is
> back up.

This is what we have MIRRORS for - perhaps we could add an entry to MIRRORS to 
handle this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


