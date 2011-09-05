Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R0N1l-0003XO-Me
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 02:27:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Sep 2011 17:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="45215842"
Received: from unknown (HELO helios.localnet) ([10.255.18.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2011 17:22:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Dmitry Eremin-Solenikov" <dbaryshkov@gmail.com>
Date: Mon, 5 Sep 2011 01:22:02 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1315181107-26857-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1315181107-26857-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Message-Id: <201109050122.02940.paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Mon, 05 Sep 2011 00:27:05 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 05 September 2011 01:05:07 Dmitry Eremin-Solenikov wrote:
> Somehow the oobblock-to-writesize.patch patch got damaged. Correct it.

I guess this is for meta-handheld?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


