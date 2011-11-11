Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ROtqn-00058v-7u
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 17:21:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Nov 2011 08:14:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,495,1315206000"; d="scan'208";a="73623877"
Received: from unknown (HELO helios.localnet) ([10.252.121.143])
	by azsmga001.ch.intel.com with ESMTP; 11 Nov 2011 08:14:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David Thomas <david.thomas@microbee-systems.com>
Date: Fri, 11 Nov 2011 16:14:48 +0000
Message-ID: <3922254.LEV2HJuVaL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <CALJpqJwC460+sy7PBVt+q6uVqYKs+XpgqfNombbSZaH8U9SCfw@mail.gmail.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<45554938.bbIM0h9DI3@helios>
	<CALJpqJwC460+sy7PBVt+q6uVqYKs+XpgqfNombbSZaH8U9SCfw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Fri, 11 Nov 2011 16:21:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 11 November 2011 10:04:11 you wrote:
>  bitbake -e matchbox-native | grep ^PREMIRRORS
> 
> Returned nothing...

Are you using DISTRO = "angstrom-2008.1" with the master branch of OE by any 
chance?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


