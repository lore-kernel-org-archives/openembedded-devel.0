Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R498F-0000Hb-2z
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 12:25:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2011 03:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,386,1312182000"; d="scan'208";a="53831815"
Received: from unknown (HELO helios.localnet) ([10.252.120.100])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2011 03:20:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:20:09 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1316081269.4523.54.camel@mattotaupa>
In-Reply-To: <1316081269.4523.54.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201109151120.09382.paul.eggleton@linux.intel.com>
Subject: Re: How to call the old repository: oe.dev or OE classic?
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
X-List-Received-Date: Thu, 15 Sep 2011 10:25:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Thursday 15 September 2011 11:07:48 Paul Menzel wrote:
> it is confusing for outsiders if oe.dev and OE classic are referring to
> the same repository or not.

I can see how people could be confused, so yes we probably ought to have just 
one name.
 
> So we need to make up an official name for the old repository. oe.dev or
> OE classic? I favor oe.dev, because it is shorter

oe-dev/oe.dev being a shortened "org.openembedded.dev" is kind of a relic of 
the old (was it bitkeeper or monotone?) days prior to git. The benefit of 
"classic" is it draws attention to the fact that it's deprecated, whereas to 
me, dev implies that's where development still occurs. So my personal vote is 
for OE-classic.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


