Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TQaQn-0000v1-Sl
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 11:05:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Oct 2012 01:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,634,1344236400"; d="scan'208";a="209383204"
Received: from unknown (HELO helios.localnet) ([10.252.122.83])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2012 01:52:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2012 09:52:20 +0100
Message-ID: <1381128.NYBsVdkGyR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1350981614-5048-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1350981614-5048-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] apache2: avoid injecting host include path
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
X-List-Received-Date: Tue, 23 Oct 2012 09:05:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 23 October 2012 09:40:14 Paul Eggleton wrote:
> includedir (by way of EXTRA_INCLUDES) gets into the CFLAGS of modphp
> via apxs; thus it should not point to a location on the host.

Ignore this, I resent it with the correct subject prefix.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


