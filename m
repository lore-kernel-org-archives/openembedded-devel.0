Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SszMG-0002BQ-H6
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 18:50:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jul 2012 09:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125455757"
Received: from unknown (HELO helios.localnet) ([10.252.121.14])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jul 2012 09:38:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 22 Jul 2012 17:38:47 +0100
Message-ID: <1395791.kLPUUXTScb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <jug959$3gr$1@dough.gmane.org>
References: <1342899684-4450-1-git-send-email-raj.khem@gmail.com>
	<jug959$3gr$1@dough.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH] systemd_git.bb: Dont inherit vala and gitpkgv
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
X-List-Received-Date: Sun, 22 Jul 2012 16:50:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 22 July 2012 09:12:41 Koen Kooi wrote:
> Op 21-07-12 21:41, Khem Raj schreef:
> > In an effort to use meta-systemd without meta-oe layer (purely on
> > OE-Core) I ran into these classes not being there in OE-Core
> 
> The vala one isn't needed anymore, the GUI bits are a seperate project now,
> but the gitpkgv needs to stay. 

Why? I can't see how gitpkgv has anything to do with systemd...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


