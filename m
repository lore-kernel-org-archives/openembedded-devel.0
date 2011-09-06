Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R0tiX-0001Zd-VE
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 13:21:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Sep 2011 04:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="45435354"
Received: from unknown (HELO helios.localnet) ([10.252.120.54])
	by orsmga002.jf.intel.com with ESMTP; 06 Sep 2011 04:16:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 6 Sep 2011 12:16:22 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201109061216.22531.paul.eggleton@linux.intel.com>
Subject: New meta layers: meta-handheld and meta-opie
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
X-List-Received-Date: Tue, 06 Sep 2011 11:21:26 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I'd like to announce the availability of two new metadata layers to be used on 
top of OpenEmbedded-Core [1]. Note that both layers also need meta-oe, a layer 
that is part of the meta-openembedded repository [2]. 

I'm working on these layers in my spare time and have already had some help 
from the community (thanks!), further help would be appreciated :)


meta-handheld
-----------------

Machine support layer for older handheld devices such as the Sharp Zaurus and 
HP iPAQ series. Many machines need testing and probably fixes here; there is 
active work on some machines (e.g. most Zaurus devices, hx4700).

Repository: http://cgit.openembedded.org/cgit.cgi/meta-handheld/
Issues: http://www.linuxtogo.org/gowiki/meta-handheld


meta-opie
------------

Recipes and associated metadata for building the Opie GUI environment[3] as 
well as associated Qtopia applications. Some recipes still need some cleanup 
but most are ready to be built with OE-core.

Repository: http://cgit.openembedded.org/cgit.cgi/meta-opie/
Issues: http://www.linuxtogo.org/gowiki/meta-opie


For more information either check out the "issues" pages above or the README 
document in each layer.

Cheers,
Paul

[1] http://www.openembedded.org/wiki/OpenEmbedded-Core
[2] http://cgit.openembedded.org/cgit.cgi/meta-openembedded
[3] http://opie.sourceforge.net

-- 

Paul Eggleton
Intel Open Source Technology Centre


