Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7p7z-0001ty-Cv
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 15:24:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2012 07:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117619882"
Received: from unknown (HELO helios.localnet) ([10.252.123.190])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2012 07:15:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Wed, 14 Mar 2012 14:15:46 +0000
Message-ID: <22576063.QXOBWGH1Gr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F60A66D.2040504@opendreambox.org>
References: <20120313114820.9572210335@opal> <1451828.nMSFA2UD84@helios>
	<4F60A66D.2040504@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Andreas Oberritter : qt4: fix deps in libQtWebkit.la and QtWebKit.pc
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
X-List-Received-Date: Wed, 14 Mar 2012 14:24:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 March 2012 15:08:45 Andreas Oberritter wrote:
> On 14.03.2012 15:02, Paul Eggleton wrote:
> > On Wednesday 14 March 2012 14:48:22 Andreas Oberritter wrote:
> >> I thought that Qt 4.8 didn't use WebKit2 by default. Did you enable it
> >> manually?
> > 
> > FYI our Qt 4.8 recipes enable QtWebkit by default.
> 
> Yes, but QtWebKit 2.2, which is included in Qt 4.8, uses WebKit, not
> WebKit2, right?

Ah, sorry I missed what you were asking. I'm not sure I'm afraid.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


