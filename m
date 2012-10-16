Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TO78Q-00082w-Do
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Oct 2012 15:24:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2012 06:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,593,1344236400"; d="scan'208";a="227940484"
Received: from unknown (HELO helios.localnet) ([10.252.122.100])
	by orsmga002.jf.intel.com with ESMTP; 16 Oct 2012 06:11:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: jackie.huang@windriver.com
Date: Tue, 16 Oct 2012 14:11:18 +0100
Message-ID: <4659452.tML7JLT3Wi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1350376482-10287-2-git-send-email-jackie.huang@windriver.com>
References: <1350376482-10287-1-git-send-email-jackie.huang@windriver.com>
	<1350376482-10287-2-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] ruby: update to 1.9.3-194
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
X-List-Received-Date: Tue, 16 Oct 2012 13:24:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 October 2012 16:34:42 jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> I sent this to oe-core but was told that it's not the right place and
> was suggested to send here.

I hate to be annoying again, sorry, but I think ruby belongs in its own layer 
rather than meta-oe - reason being, it is not unlikely that we'll want to add 
more recipes for ruby-related items later; also more generally if there is a 
clear category for a recipe to go into it should go into a layer for that 
category - meta-oe is already becoming a dumping ground.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


