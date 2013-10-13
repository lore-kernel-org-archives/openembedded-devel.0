Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6E0DF60FC2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 11:10:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Oct 2013 04:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,485,1378882800"; d="scan'208";a="418435063"
Received: from junemccl-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.196])
	by orsmga002.jf.intel.com with ESMTP; 13 Oct 2013 04:10:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Oct 2013 12:10:02 +0100
Message-ID: <1596233.ZQ7J3xl2Nd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Cliff Brake <cbrake@bec-systems.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/6] libraw1394: add recipe
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
X-List-Received-Date: Sun, 13 Oct 2013 11:10:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 13 October 2013 01:43:50 Khem Raj wrote:
> From: Cliff Brake <cbrake@bec-systems.com>
> 
> Initial recipe created by Khem Raj
> 
> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb | 11 +++++++++++

Could these multimedia recipes go into meta-multimedia instead of meta-oe?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

