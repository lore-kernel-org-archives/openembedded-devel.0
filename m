Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tr66g-00006g-9i
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 13:10:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jan 2013 03:55:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,409,1355126400"; d="scan'208";a="269912050"
Received: from unknown (HELO helios.localnet) ([10.252.123.68])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2013 03:55:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 04 Jan 2013 11:55:27 +0000
Message-ID: <2775414.uih48Qsd1z@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1357271974-3317-11-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
	<1357271974-3317-11-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 12/13] ebtables: Forward port recipes from OE-Classic
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
X-List-Received-Date: Fri, 04 Jan 2013 12:10:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 03 January 2013 19:59:33 Khem Raj wrote:
> Update to latest version
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../ebtables-2.0.10-4/01debian_defaultconfig.patch |   50 ++++++
>  .../ebtables/ebtables-2.0.10-4/ebtables.init       |  186

Er, I'm confused - ebtables is already in meta-networking (meta-
networking/recipes-filter/ebtables) ... ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


