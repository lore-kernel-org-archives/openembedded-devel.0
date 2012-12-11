Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TiQO4-0004mP-91
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 15:00:50 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Dec 2012 05:46:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,259,1355126400"; d="scan'208";a="179393366"
Received: from unknown (HELO helios.localnet) ([10.252.122.234])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Dec 2012 05:46:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 13:46:08 +0000
Message-ID: <7705762.IhEbGrFqxK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <ka794i$apv$1@ger.gmane.org>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<cover.1355187290.git.Martin.Jansa@gmail.com>
	<ka794i$apv$1@ger.gmane.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/90] [meta-oe] Small fixes from bitbake world - updated cover letter
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
X-List-Received-Date: Tue, 11 Dec 2012 14:00:50 -0000
X-List-Received-Date: Tue, 11 Dec 2012 14:00:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 11 December 2012 13:32:24 Koen Kooi wrote:
> Op 11-12-12 02:04, Martin Jansa schreef:
> > As builder was finishing more recipes in world build, I've added few
> > more commits to this branch and also sent some v2
> > 
> > Here is updated cover letter.
> > 
> > I've also forget to set [meta-oe] prefix for individual commits, only
> > cover letter has it, but I guess that nobody will try to apply 90
> > commits from patchwork.. and merging this branch should work fine.
> 
> Any objections to merging this branch?

The vpnc recipe could do with a bit of cleanup but nothing major, so it can 
wait until after this is merged. Other than that it all looks good to me, 
FWIW.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


