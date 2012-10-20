Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TPYHB-0000yn-Iv
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 14:35:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Oct 2012 05:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,621,1344236400"; d="scan'208";a="158389429"
Received: from unknown (HELO helios.localnet) ([10.252.122.100])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Oct 2012 05:22:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 20 Oct 2012 13:22:12 +0100
Message-ID: <2065132.7T5jEHvO3o@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CAP9ODKoZgqVc--zoe4vupRL3QfVtYMv-jFvazUqAXiYWoX1J=A@mail.gmail.com>
References: <1350665204-7352-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAP9ODKoZgqVc--zoe4vupRL3QfVtYMv-jFvazUqAXiYWoX1J=A@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hddtemp: add from OE-Classic and update
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
X-List-Received-Date: Sat, 20 Oct 2012 12:35:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 20 October 2012 08:54:37 Otavio Salvador wrote:
> I think some patches could be cleaned up. Specially the generated
> files. Debian includes them in the patch and the packaging guide
> advices to do it (there're reasons for it) but OE regenerated those so
> I think it could be dropped.

I'd really rather not touch the content of the patches - hddtemp upstream is 
dead, we're not intending to maintain our own fork and it's easier if we can 
just pull in any new patches as-is from Debian or Fedora (with source 
information, which I did add to the top of each patch).

> Another thing, I remember to see this patch before on mailing list.
> Did you forget to mark it as v2?

No, all the patches I have sent to the list are the same. Sorry for the noise 
but none of them are being picked up by patchwork for some reason and Khem was 
trying to fix that (still doesn't seem to be fixed as I have noted).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


