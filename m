Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Spi9v-0000tE-DQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 17:51:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jul 2012 08:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176975519"
Received: from unknown (HELO helios.localnet) ([10.252.121.15])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jul 2012 08:40:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Jul 2012 16:40:42 +0100
Message-ID: <1545322.vi2fespzus@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <3797A80A-708E-422C-B501-ADDB47AD4541@dominion.thruhere.net>
References: <1342193205-25293-1-git-send-email-koen@dominion.thruhere.net>
	<4461686.rdlsglFAG9@helios>
	<3797A80A-708E-422C-B501-ADDB47AD4541@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][PATCH] various: update ; proto= to ; protocol= in SRC_URI
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
X-List-Received-Date: Fri, 13 Jul 2012 15:51:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 13 July 2012 17:37:47 Koen Kooi wrote:
> Op 13 jul. 2012, om 17:35 heeft Paul Eggleton het volgende geschreven:
> > On Friday 13 July 2012 17:26:45 Koen Kooi wrote:
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > 
> > Just checking, you're aware that for the svn fetcher this will break with
> > older versions of bitbake that don't have the recent patch applied?
> > 
> > If that's not a concern, no problem.
> 
> Not a concern for meta-oe master, only for release branches :)

My thinking was that at least in the OE-Classic days we didn't expect the user 
to have bleeding edge bitbake even in master.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


