Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DCA4173D5A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:49:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2015 08:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,609,1422950400"; d="scan'208";a="483211366"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Apr 2015 08:49:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Date: Mon, 20 Apr 2015 16:49:25 +0100
Message-ID: <2012859.l34ETrnxa2@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F49D799@irsmsx105.ger.corp.intel.com>
References: <1429543129-2598-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F49D799@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V4] bluez collection: add (moved from oe-core)
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
X-List-Received-Date: Mon, 20 Apr 2015 15:49:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 April 2015 15:19:43 Iorga, Cristian wrote:
> In v4, corrected the commit message.
> 
> -----Original Message-----
> From: Iorga, Cristian
> Sent: Monday, April 20, 2015 6:19 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Iorga, Cristian
> Subject: [meta-oe][PATCH V4] bluez collection: add (moved from oe-core)
> 
> BlueZ 4.x Bluetooth stack has been removed from oe-core.
> However, it is still supported, so add it to meta-oe connectivity layer.

Being somewhat pedantic, but I'm afraid this is still not quite right - it 
should say "add it to recipes-connectivity in meta-oe".

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

