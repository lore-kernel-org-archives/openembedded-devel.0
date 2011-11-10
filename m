Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ROXRk-0006b4-2k
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 17:25:48 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Nov 2011 08:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,489,1315206000"; d="scan'208";a="83552615"
Received: from unknown (HELO helios.localnet) ([10.252.121.140])
	by fmsmga001.fm.intel.com with ESMTP; 10 Nov 2011 08:19:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Nov 2011 16:19:28 +0000
Message-ID: <1852016.fcnO3seCPZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <4EBBF7C1.4030809@balister.org>
References: <4EBBF280.30301@freyther.de> <4EBBF7C1.4030809@balister.org>
MIME-Version: 1.0
Subject: Re: RFC Creation of a meta-telephony repository
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
X-List-Received-Date: Thu, 10 Nov 2011 16:25:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 10 November 2011 11:11:45 Philip Balister wrote:
> Another thouht, rather than add another layer, wouldn't it make sense to
> add a recipes-telephony directory to the existing
> meta-openembedded/meta-oe directory?

To my mind, that's explicitly not what meta-oe is for. If you can find a more 
purpose-focused place for recipes to go, that's where they should be. For 
these recipes there is a clear theme (telephony).

(I'm not necessarily suggesting they have to be in a new *repository*, i.e. 
they could easily be a new meta-telephony dir within the meta-openembedded 
repo.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


