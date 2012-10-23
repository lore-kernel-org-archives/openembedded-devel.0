Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TQaXY-00017z-Ta
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 11:12:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Oct 2012 01:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,634,1344236400"; d="scan'208";a="238916840"
Received: from unknown (HELO helios.localnet) ([10.252.122.83])
	by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2012 01:59:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Oct 2012 09:59:19 +0100
Message-ID: <1564404.2akYnFFVx7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CAMKF1spmOOZXgWTSigq7PKDPYwi7j-273cwEM6ryFM0P1cHe+A@mail.gmail.com>
References: <CAMKF1sqkMb8Z5Cda7qDXKYF1npKbJ-2yOAdWA=gNADs5UJAEew@mail.gmail.com>
	<7074844.QapBLE5b39@helios>
	<CAMKF1spmOOZXgWTSigq7PKDPYwi7j-273cwEM6ryFM0P1cHe+A@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: patchwork is up again
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
X-List-Received-Date: Tue, 23 Oct 2012 09:12:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 22 October 2012 09:25:45 Khem Raj wrote:
> On Sat, Oct 20, 2012 at 4:45 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 19 October 2012 16:37:19 Khem Raj wrote:
> >> If you dont use patchwork dont bother but if you do then it had some
> >> hiccups which now has been fixed hopefully. So if you dont see your
> >> latest patch on patchwork resend it.
> > 
> > I just sent my hddtemp patch for the third time and it still hasn't been
> > picked up by patchwork, so I'm afraid something is still not working
> > properly.
>
> we have always had issue with large patches. I dont know exact size but
> pw did not parse large emails well. I wonder if your patch is large enough
> to cross the bar.

I've just posted v2 of the patch which is less than half the size, still no 
dice though.

However, one unusual thing about this patch (and the previous version) is that 
git send-email did prompt me for an encoding, I used the default (UTF-8); even 
the subject line is encoded. Maybe patchwork doesn't understand UTF-8 - could 
that be the reason it's not being picked up?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


