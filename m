Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C59EE6AF96
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 19:04:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2013 12:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,961,1367996400"; d="scan'208";a="386704577"
Received: from unknown (HELO helios.localnet) ([10.252.123.18])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2013 12:04:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: b40290@freescale.com, mulhern <mulhern@gmail.com>
Date: Mon, 26 Aug 2013 20:04:23 +0100
Message-ID: <19428695.8q4QRytnTK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1377486939-31135-1-git-send-email-b40290@freescale.com>
References: <1377486939-31135-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/4] snort: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Aug 2013 19:04:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chunrong,

On Monday 26 August 2013 11:15:39 b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
> 
>    *snort - a free lightweight network intrusion detection
>          system for UNIX and Windows

I have to admit I thought this was something that mulhern was working on - is 
that correct mulhern?

In any case I think this would probably be something best put into meta-
security [1].

Cheers,
Paul

[1] http://layers.openembedded.org/layerindex/layer/meta-security/

-- 

Paul Eggleton
Intel Open Source Technology Centre

