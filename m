Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tnaxn-00032c-Kv
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Dec 2012 21:19:01 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Dec 2012 12:04:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,354,1355126400"; d="scan'208";a="236599330"
Received: from unknown (HELO helios.localnet) ([10.252.123.17])
	by azsmga001.ch.intel.com with ESMTP; 25 Dec 2012 12:04:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Dec 2012 20:04:01 +0000
Message-ID: <2471810.EZLSW9fpny@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <20121225085616.GV8988@jama.palm1.palmone.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20121224091242.GS8988@jama.palm1.palmone.com>
	<20121225085616.GV8988@jama.palm1.palmone.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Tue, 25 Dec 2012 20:19:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 25 December 2012 09:56:16 Martin Jansa wrote:
> And few more issues when building without usable MIRRORs/PREMIRRORs:
> meta-openembedded/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb

Are you sure this one wasn't transient? I just tried fetching it directly and 
it worked...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


