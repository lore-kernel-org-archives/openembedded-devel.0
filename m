Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TYEJh-0004e4-IJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Nov 2012 12:06:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2012 02:52:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="218870808"
Received: from unknown (HELO helios.localnet) ([10.252.122.166])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2012 02:52:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stefan Schmidt <stefan@datenfreihafen.org>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 13 Nov 2012 10:52:08 +0000
Message-ID: <1929015.S4sbRGzyuA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121112182616.GB22235@novatech.datenfreihafen.org>
References: <12301427.Yf0uchSh3U@helios>
	<20121112182616.GB22235@novatech.datenfreihafen.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] OE-Classic recipe migration status
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
X-List-Received-Date: Tue, 13 Nov 2012 11:06:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 12 November 2012 18:26:16 Stefan Schmidt wrote:
> On Sun, 2012-11-11 at 19:11, Paul Eggleton wrote:
> >    1484 other
> >     218 BSP
> >     211 BugLabs
> 
> I now longer work for BugLabs but  during my last months there I split
> up our bunch of recipes according to what we think was sane at that
> time. Think end of last year here.
> 
> The BSP layer can be found here:
> https://github.com/buglabs/meta-bug
> 
> And BugLabs specific recipes here:
> https://github.com/buglabs/meta-buglabs
> 
> All OpenJDK related stuff was going directly into upstream through
> Tarent anyway. This should cover all stuff that was worth bringing
> over.

OK, I've removed everything that is now in meta-bug/meta-buglabs and marked 
everything else as obsolete. Thanks!
 
> >      11 EFL
> 
> I think everything worth working with is in meta-efl in meta-oe.
> Martin is doing a great job catching up with everything we do
> upstream. If something is really missing it might now longer work or
> is just not worth bringing over.

Martin, can you look over the EFL marked recipes and confirm this?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


