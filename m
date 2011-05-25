Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QPNPZ-0006yR-4L
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 01:22:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 May 2011 16:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,269,1304319600"; 
   d="scan'208";a="7708118"
Received: from unknown (HELO helios.localnet) ([10.255.12.184])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2011 16:18:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 May 2011 00:18:21 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201105260018.21341.paul.eggleton@linux.intel.com>
Subject: RFC: removal of Opie 1.2.4 recipes
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
X-List-Received-Date: Wed, 25 May 2011 23:22:45 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I have been asked if I would consider removing the Opie 1.2.4 recipes from oe-
dev. I think this is a good idea - Opie 1.2.5 has been out for a while now and 
as far as I am aware upgrading shouldn't present any serious difficulties that 
would require someone to use 1.2.4 instead.

Unless there are objections I will remove the 1.2.4 recipes and update all 
distro version includes early next week.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


