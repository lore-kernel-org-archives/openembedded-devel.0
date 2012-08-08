Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sz37n-0003OP-Ny
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 12:04:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2012 02:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,732,1336374000"; d="scan'208";a="194536126"
Received: from unknown (HELO helios.localnet) ([10.252.121.56])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2012 02:52:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 08 Aug 2012 10:52:34 +0100
Message-ID: <2015178.FG14ZVzVFW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-27-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1344399869-3759-1-git-send-email-raj.khem@gmail.com>
References: <1344399869-3759-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH V2] meta-systemd: Create a hard link to gitpkgv.bbclass
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
X-List-Received-Date: Wed, 08 Aug 2012 10:04:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 07 August 2012 21:24:29 Khem Raj wrote:
> git is not handling soft links

I think you'll find that it won't handle hard links either. As far as git is 
concerned you've just added a new file.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


