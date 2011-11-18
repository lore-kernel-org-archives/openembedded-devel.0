Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RROxA-0000sr-IL
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 14:58:05 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Nov 2011 05:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,533,1315206000"; d="scan'208";a="76625092"
Received: from unknown (HELO helios.localnet) ([10.252.121.185])
	by azsmga001.ch.intel.com with ESMTP; 18 Nov 2011 05:51:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Nov 2011 13:51:35 +0000
Message-ID: <3257489.OMhGnQsRki@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-12-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <CAAQYJAu8UbRXaFpExAioYyxfsy_tM9hm3k=yipO8Fu_zRxO3XQ@mail.gmail.com>
References: <cover.1321575642.git.andrea.adami@gmail.com>
	<20111118131116.GB3549@jama.jama.net>
	<CAAQYJAu8UbRXaFpExAioYyxfsy_tM9hm3k=yipO8Fu_zRxO3XQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 5/5] linux: remove unused git version
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
X-List-Received-Date: Fri, 18 Nov 2011 13:58:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 18 November 2011 14:45:32 Andrea Adami wrote:
> My thoughts are that Pavel is always testing bleeding edge way before
> we commit it in OE while Dmitry told me repeatedly he prefers to base
> his patches on stable, older kernels.

You're right, but I figure if we have the mechanism to allow people to build a 
bleeding edge kernel already, let's keep it for the moment.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


