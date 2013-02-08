Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3rlC-0004pY-HG
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 18:29:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Feb 2013 09:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="254390717"
Received: from unknown (HELO helios.localnet) ([10.252.120.51])
	by azsmga001.ch.intel.com with ESMTP; 08 Feb 2013 09:13:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Fri, 08 Feb 2013 17:13:17 +0000
Message-ID: <1546157.0f1Vqehhn5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1360343179-29346-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360343179-29346-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] cyrus-sasl2: add 2.1.26
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
X-List-Received-Date: Fri, 08 Feb 2013 17:29:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 08 February 2013 18:06:19 Marcin Juszkiewicz wrote:
> I took recipe from OE classic, updated, cleaned and got it build. I use
> it only as build dependency - did not checked binaries from ${PN}-bin.

FYI there is a cyrus-sasl 2.1.19 recipe in meta-kde; not sure how that 
compares with this one (and clearly we would prefer to have it in a more 
appropriate layer than meta-kde).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


