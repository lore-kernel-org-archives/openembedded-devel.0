Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TqimF-0004Ja-Hy
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jan 2013 12:16:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2013 02:59:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,402,1355126400"; d="scan'208";a="266689810"
Received: from unknown (HELO helios.localnet) ([10.252.123.62])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2013 03:00:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 03 Jan 2013 11:00:32 +0000
Message-ID: <3624723.LPVMAxKVvK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <CAJTo0LZNprjMsqdVH=xzcr_0TtJ1o9BF2sAjYyYJzViHw6Smvg@mail.gmail.com>
References: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
	<1494272.pND5Ntq0Hj@helios>
	<CAJTo0LZNprjMsqdVH=xzcr_0TtJ1o9BF2sAjYyYJzViHw6Smvg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia PATCH V2 1/6] gssdp: add 0.12.2.1 and 0.13.2
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
X-List-Received-Date: Thu, 03 Jan 2013 11:16:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 03 January 2013 10:26:35 Burton, Ross wrote:
> On 23 December 2012 19:44, Paul Eggleton <paul.eggleton@linux.intel.com> 
wrote:
> > On Friday 21 December 2012 13:43:37 Ross Burton wrote:
> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
> > 
> > Why both versions?
> 
> GUPnP uses the GNOME-style stable/development even/odd versioning so
> there's value in having both.  Specifically, dLeyna requires the
> current development releases as that's where several critical bug
> fixes have landed (ideally those fixes would be pushed to the stable
> series, but I'm not in a position to suggest that anymore).

OK, I would definitely recommend noting that in the commit message in that 
case.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


