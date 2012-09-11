Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TBQJr-0003UL-LO
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 15:15:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Sep 2012 06:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,404,1344236400"; d="scan'208";a="220710985"
Received: from unknown (HELO helios.localnet) ([10.252.121.164])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2012 06:03:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Sep 2012 14:03:23 +0100
Message-ID: <2875794.FvkJFEeAV6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAJTo0Lahx_1K64aBhag10RN=jSE+fz=APC9HnCwp-zxyb0-qgw@mail.gmail.com>
References: <504D81F8.9020702@dresearch-fe.de>
	<1347367374-10517-1-git-send-email-sledz@dresearch-fe.de>
	<CAJTo0Lahx_1K64aBhag10RN=jSE+fz=APC9HnCwp-zxyb0-qgw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance][PATCH] gdk-pixbuf: add missing dependencies
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
X-List-Received-Date: Tue, 11 Sep 2012 13:15:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 11 September 2012 13:59:21 Burton, Ross wrote:
> On 11 September 2012 13:42, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> > | No package 'atk' found
> > | No package 'pango' found
> > | No package 'cairo' found
> 
> Those are spurious dependencies in a very old version of gdk-pixbuf.
> 
> oe-core master has 2.24.1 at the moment, is there a good reason why
> meta-oe is hanging onto 2.10.14?

This is the OE-Classic 2011.03-maintenance branch. I was surprised too until I 
realised where this was :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


