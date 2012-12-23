Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TmreP-000186-4d
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 20:55:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Dec 2012 11:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,343,1355126400"; d="scan'208";a="235916384"
Received: from unknown (HELO helios.localnet) ([10.252.123.19])
	by azsmga001.ch.intel.com with ESMTP; 23 Dec 2012 11:41:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 23 Dec 2012 19:40:51 +0000
Message-ID: <3053324.FGHdgGAGGN@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <kb31gs$u4d$1@ger.gmane.org>
References: <kb31gs$u4d$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Ruby and meta-oe?
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
X-List-Received-Date: Sun, 23 Dec 2012 19:55:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 22 December 2012 02:14:07 Koen Kooi wrote:
> What's the status on getting ruby recipes into a meta-ruby or meta-oe? I
> just had to import it into my working branch to build mkvtoolnix which needs
> ruby-native for its buildsystem (don't ask).

The original author never replied to my suggestion about creating a separate 
layer. Unless there are objections I'd suggest just creating a meta-ruby and 
using the patches from patchwork to add ruby into it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


