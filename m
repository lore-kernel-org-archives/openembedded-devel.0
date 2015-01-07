Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 94677706D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:34:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jan 2015 02:34:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,713,1413270000"; d="scan'208";a="633685151"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by orsmga001.jf.intel.com with ESMTP; 07 Jan 2015 02:34:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 07 Jan 2015 10:34:43 +0000
Message-ID: <2715569.PMW4haZ672@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <20150107101423.GH29986@jama>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
	<20150105115922.GF2484@jama> <20150107101423.GH29986@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-webserver][PATCH v2 00/11] Merge modphp into php and upgrade
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
X-List-Received-Date: Wed, 07 Jan 2015 10:34:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 07 January 2015 11:14:23 Martin Jansa wrote:
> On Mon, Jan 05, 2015 at 12:59:22PM +0100, Martin Jansa wrote:
> > Thanks for v2
> > 
> > Please remember to update your old series as superseded when pushing
> > newer version, it would help me a lot when sorting the pending patches.
> 
> Something is wrong:
> 
> php-5.5.20: php requires
> /tmp/work/core2-64-oe-linux/php/5.5.20-r0/image/usr/bin/php, but no
> providers in its RDEPENDS [file-rdeps]

That is very strange. Do you perhaps have any information on how you might 
reproduce that? I did not receive any QA warnings when building this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

