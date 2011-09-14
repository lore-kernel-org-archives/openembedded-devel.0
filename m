Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R3zPz-0006gF-1e
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 02:03:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Sep 2011 16:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="48534651"
Received: from unknown (HELO helios.localnet) ([10.252.120.105])
	by orsmga002.jf.intel.com with ESMTP; 14 Sep 2011 16:57:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 15 Sep 2011 00:57:47 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1315519241-2950-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1315519241-2950-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Message-Id: <201109150057.47810.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-kexecboot.inc: hardcode loglevel=3 to keep bootlogo intact
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
X-List-Received-Date: Thu, 15 Sep 2011 00:03:03 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 08 September 2011 23:00:41 Andrea Adami wrote:
> * debug must be enabled explicitely as it is necessary to add
> * more arguments e.g. earlyprintk and even enable PRINTK and debug
> * in Zaurus defconfigs

This message is a little confusing, is the patch about keeping loglevel=3 for 
the bootlogo or the fact that loglevel=3 is insufficient for debugging, or both? 
Would you mind expanding the commit message?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


