Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV33S-0006G5-1m
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 19:00:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 09:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,542,1363158000"; d="scan'208";a="323960791"
Received: from unknown (HELO helios.localnet) ([10.255.13.249])
	by orsmga002.jf.intel.com with ESMTP; 24 Apr 2013 09:42:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Wed, 24 Apr 2013 17:42:29 +0100
Message-ID: <1522401.Xi5ZNlSlZv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <83aca51e5e0866d965d4d9f621cacb29c84a6875.1366821077.git.ross.burton@intel.com>
References: <cover.1366821077.git.ross.burton@intel.com>
	<83aca51e5e0866d965d4d9f621cacb29c84a6875.1366821077.git.ross.burton@intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] libgnome-keyring: add (from oe-core)
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
X-List-Received-Date: Wed, 24 Apr 2013 17:00:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 24 April 2013 17:32:42 Ross Burton wrote:
> This was in oe-core previously but it's not actually used by anything:
> webkit-gtk claimed a false dependency and the new libsoup has removed all
> use of gnome-keyring.

libgnome-keyring is already in meta-gnome (under recipes-
gnome/libgnome/libgnome-keyring_2.32.0.bb - perhaps not the best location). 
gnome-keyring isn't though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


