Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R0ipi-0007as-Hd
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 01:44:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Sep 2011 16:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,335,1312182000"; d="scan'208";a="45790204"
Received: from unknown (HELO helios.localnet) ([10.252.120.35])
	by azsmga001.ch.intel.com with ESMTP; 05 Sep 2011 16:39:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Dmitry Eremin-Solenikov" <dbaryshkov@gmail.com>
Date: Tue, 6 Sep 2011 00:39:01 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1315181107-26857-1-git-send-email-dbaryshkov@gmail.com>
	<201109050122.02940.paul.eggleton@linux.intel.com>
	<CALT56yMNhEBc3J_e-KD1kA2ZZtY9w-E+zqFVC30zKooGgxV9TA@mail.gmail.com>
In-Reply-To: <CALT56yMNhEBc3J_e-KD1kA2ZZtY9w-E+zqFVC30zKooGgxV9TA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201109060039.01372.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] nandlogical: corect oobblock/writesize patch
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
X-List-Received-Date: Mon, 05 Sep 2011 23:44:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 05 September 2011 21:49:47 Dmitry Eremin-Solenikov wrote:
> On 9/5/11, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > On Monday 05 September 2011 01:05:07 Dmitry Eremin-Solenikov wrote:
> >> Somehow the oobblock-to-writesize.patch patch got damaged. Correct it.
> > 
> > I guess this is for meta-handheld?
> 
> Yes.

Merged to meta-handheld, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


