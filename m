Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TPZMh-000247-7z
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 15:45:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Oct 2012 06:31:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,621,1344236400"; d="scan'208";a="208447421"
Received: from unknown (HELO helios.localnet) ([10.252.122.100])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2012 06:31:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 20 Oct 2012 14:31:57 +0100
Message-ID: <5449472.OOgUu9G1KU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CAP9ODKruOzzkoRVKcCSRUe6Rmnhh+++gDNEYGOf8-GSuw0b5Ug@mail.gmail.com>
References: <1350665204-7352-1-git-send-email-paul.eggleton@linux.intel.com>
	<2065132.7T5jEHvO3o@helios>
	<CAP9ODKruOzzkoRVKcCSRUe6Rmnhh+++gDNEYGOf8-GSuw0b5Ug@mail.gmail.com>
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
X-List-Received-Date: Sat, 20 Oct 2012 13:45:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 20 October 2012 10:13:50 Otavio Salvador wrote:
> On Sat, Oct 20, 2012 at 9:22 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Saturday 20 October 2012 08:54:37 Otavio Salvador wrote:
> >> I think some patches could be cleaned up. Specially the generated
> >> files. Debian includes them in the patch and the packaging guide
> >> advices to do it (there're reasons for it) but OE regenerated those so
> >> I think it could be dropped.
> > 
> > I'd really rather not touch the content of the patches - hddtemp upstream
> > is dead, we're not intending to maintain our own fork and it's easier if
> > we can just pull in any new patches as-is from Debian or Fedora (with
> > source information, which I did add to the top of each patch).
> 
> Right but including generated files is waste of space, unpack time and
> patching time. We're rewrite those in do_configure.

So leaving aside the tiny amount of time/space we're talking about for a 
second, which files are you referring to exactly?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


