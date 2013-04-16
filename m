Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US6sH-0000pu-Da
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 16:28:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Apr 2013 07:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,486,1363158000"; d="scan'208";a="295685192"
Received: from unknown (HELO helios.localnet) ([10.255.14.4])
	by orsmga001.jf.intel.com with ESMTP; 16 Apr 2013 07:11:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 16 Apr 2013 15:11:11 +0100
Message-ID: <28464506.76Htkx7JyD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130416140501.GO10628@jama.dyndns-home.com>
References: <cover.1366119759.git.paul.eggleton@linux.intel.com>
	<20130416140501.GO10628@jama.dyndns-home.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH 0/2] Remove some recipes that are in OE-Core (cover letter only)
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
X-List-Received-Date: Tue, 16 Apr 2013 14:29:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 April 2013 16:05:01 Martin Jansa wrote:
> On Tue, Apr 16, 2013 at 02:46:48PM +0100, Paul Eggleton wrote:
> > In case you're wondering why I've only sent the cover letter for just two
> > patches, I tried sending them as normal and what I got was:
> > 
> > fatal: pull-29844/0001-hicolor-icon-theme-remove.patch: 29: patch contains
> > a line longer than 998 characters warning: no patches were sent
> > 
> > They are just deletes though so they don't contain much in the way of
> > substance.
> 
> libical is fine and I'll merge it shortly, but hicolor-icon-theme needs
> PR bump in oe-core first (and in oe-core/dylan if you want it merged in
> meta-oe before branching dylan).

If you'll accept an OE-Core PR bump for this can we do the same for the 
bbappends that are preserved solely for keeping the same PR?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


