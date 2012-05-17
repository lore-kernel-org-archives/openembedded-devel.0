Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SUz2U-00036L-OW
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 13:38:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 04:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144347334"
Received: from unknown (HELO helios.localnet) ([10.252.120.140])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 04:28:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 May 2012 12:28:33 +0100
Message-ID: <1682908.OEHQSIBnpA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <20120517112446.GG3164@jama.jama.net>
References: <1337237919-17155-1-git-send-email-Martin.Jansa@gmail.com>
	<3144141.bgKGuF394S@helios> <20120517112446.GG3164@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] pidgin: explicitly disable nss
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
X-List-Received-Date: Thu, 17 May 2012 11:38:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 17 May 2012 13:24:46 Martin Jansa wrote:
> On Thu, May 17, 2012 at 12:20:12PM +0100, Paul Eggleton wrote:
> > On Thursday 17 May 2012 08:58:39 Martin Jansa wrote:
> > > * sometimes it leaks from meta-chromium and breaks pidgin build
> > 
> > Does that mean SSL will be unavailable in pidgin after this change?
> 
> No it means that it should always detect gnutls, not nss when chromium
> was built before pidgin.

OK, cool, just checking.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


