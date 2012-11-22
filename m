Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbULX-00011T-70
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 11:50:01 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2012 02:35:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,299,1352102400"; d="scan'208";a="252811264"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2012 02:35:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Anders Darander <anders@chargestorm.se>
Date: Thu, 22 Nov 2012 10:35:18 +0000
Message-ID: <2369318.aZASIKluo5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <20121122062224.GB5468@ad.chargestorm.se>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<1351681706-12778-2-git-send-email-otavio@ossystems.com.br>
	<20121122062224.GB5468@ad.chargestorm.se>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 2/3] meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p5
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
X-List-Received-Date: Thu, 22 Nov 2012 10:50:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 November 2012 07:22:25 Anders Darander wrote:
> * Otavio Salvador <otavio@ossystems.com.br> [121031 12:08]:
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> > 
> >  .../{ntp_4.2.6p3.bbappend => ntp_4.2.6p5.bbappend} |    0
> >  1 files changed, 0 insertions(+), 0 deletions(-)
> >  rename
> >  meta-systemd/meta-networking/recipes-support/ntp/{ntp_4.2.6p3.bbappend
> >  => ntp_4.2.6p5.bbappend} (100%)
> Ping?
> 
> Could we have this patch (and the 1/3, which moved systemd-support to
> meta-systemd/meta-networking/....) applied?
> 
> meta-systemd has been unparsable for quite some time now, as
> meta-networking has ntp 4.2.6p5, and the bbappend in meta-systemd is for
> 4.2.6p3...

I'm not sure why this had to be delayed - it could have been applied 
immediately. Assuming it doesn't get applied this morning I will include it in 
my ntp patch series since I apparently need to update the systemd service 
anyway.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


