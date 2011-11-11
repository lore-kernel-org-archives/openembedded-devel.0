Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ROv0N-0001gI-HW
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 18:35:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Nov 2011 09:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="74087386"
Received: from unknown (HELO helios.localnet) ([10.252.121.143])
	by orsmga002.jf.intel.com with ESMTP; 11 Nov 2011 09:28:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David Thomas <david.thomas@microbee-systems.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:46 +0000
Message-ID: <2222512.tIAhHCihnJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <CALJpqJw6MvmkxxDhJ_amJRFep3yYoTjRogPD4GQ1HG2RpQmvQQ@mail.gmail.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<2307753.9BlijQWh4O@helios>
	<CALJpqJw6MvmkxxDhJ_amJRFep3yYoTjRogPD4GQ1HG2RpQmvQQ@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 11 Nov 2011 17:35:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 11 November 2011 11:06:29 you wrote:
> Dumb question. Can you point me to this distro with cm-t35 machines
> such that I can get clone? I looked at the Angstrom site.

Well, the Angstrom-prescribed method is to use the setup scripts - it's 
documented in the "Developers" section of the website. You don't have to use 
this method however - just switch over to the master / 2011.3-maintenance 
branch of OE and you should be able to run your build.
 
> If I have Angstrom build me a kernel does it provide me with the
> local.conf, etc? 

If you use the scripts it does, yes. Otherwise you should be able to keep your 
current configuration.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


