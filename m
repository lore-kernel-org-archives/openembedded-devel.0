Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TLZNe-0000ls-3e
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 14:57:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Oct 2012 05:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,560,1344236400"; d="scan'208";a="203396720"
Received: from unknown (HELO helios.localnet) ([10.252.122.38])
	by orsmga001.jf.intel.com with ESMTP; 09 Oct 2012 05:44:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Oct 2012 13:44:24 +0100
Message-ID: <2757321.uTH9hJXHO5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <43479E7D-B727-4070-A602-53B79EB5683F@dominion.thruhere.net>
References: <cover.1349608252.git.paul.eggleton@linux.intel.com>
	<2982314.ddUisfMeTu@helios>
	<43479E7D-B727-4070-A602-53B79EB5683F@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 1/3] apache2: fix configuration
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
X-List-Received-Date: Tue, 09 Oct 2012 12:57:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 October 2012 14:35:25 Koen Kooi wrote:
> I am indeed using rm_work.

OK, I'll take a look at it. I am also aware of a bad rpath QA failure in 
modphp which I am looking into as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


