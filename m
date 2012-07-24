Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Std5H-0005oS-CI
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 13:15:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jul 2012 04:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="197307555"
Received: from unknown (HELO helios.localnet) ([10.252.121.60])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2012 04:03:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 12:03:52 +0100
Message-ID: <19469944.X3PjN8MZT4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <500E6F68.7090506@windriver.com>
References: <1342506029-32113-1-git-send-email-Song.Li@windriver.com>
	<500E6F68.7090506@windriver.com>
MIME-Version: 1.0
Cc: "Yang, Liezhi" <Liezhi.Yang@windriver.com>, "Zhao,
	Zhenfeng" <Zhenfeng.Zhao@windriver.com>
Subject: Re: [PATCH] sysstat:use a new way to remove -s option of LFLAGS
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
X-List-Received-Date: Tue, 24 Jul 2012 11:15:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 July 2012 17:48:24 Song.Li wrote:
> I sent this patch last week, didn't get any reply, just resent it to
> confirm.

Sorry we didn't get back to you sooner. However I notice the inner patch is 
missing an "Upstream-Status" field - could you please add this?

https://wiki.yoctoproject.org/wiki/Best_Known_Methods_%28BKMs%29_for_Package_Updating#Patch_Upstreaming

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


