Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QtFZQ-0002cS-BZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 11:04:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Aug 2011 01:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,379,1309762800"; d="scan'208";a="41864093"
Received: from unknown (HELO helios.localnet) ([10.255.18.69])
	by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2011 01:59:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Aug 2011 09:59:36 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <20110816074907.GE22184@chargestorm.se>
In-Reply-To: <20110816074907.GE22184@chargestorm.se>
MIME-Version: 1.0
Message-Id: <201108160959.36103.paul.eggleton@linux.intel.com>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-oe][RFC] Need for qmake_base.bbclass?
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
X-List-Received-Date: Tue, 16 Aug 2011 09:04:24 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 16 August 2011 08:49:08 Anders Darander wrote:
> I'd like to get rid of qmake_base.bbclass in oe-core.

Presumably you mean "in meta-oe" here...

> If we merge the second hunk of the diff to oe-core, do we risk getting
> any failures/problems?

Looks pretty reasonable to me, at a glance I can't see it causing any issues.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


