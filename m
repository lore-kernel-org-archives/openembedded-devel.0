Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A6E7A6AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 13:58:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2015 06:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,631,1422950400"; d="scan'208";a="560667292"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by orsmga003.jf.intel.com with ESMTP; 23 Apr 2015 06:58:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Etienne Cordonnier <etienne.cordonnier@streamunlimited.com>
Date: Thu, 23 Apr 2015 14:58:53 +0100
Message-ID: <2655333.6xPT1UCNG5@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <5538EEE6.8050507@streamunlimited.com>
References: <1429602522-22676-1-git-send-email-etienne.cordonnier@streamunlimited.com>
	<5538EEE6.8050507@streamunlimited.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] cdparanoia: add new recipe
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
X-List-Received-Date: Thu, 23 Apr 2015 13:58:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Etienne,

On Thursday 23 April 2015 15:08:54 Etienne Cordonnier wrote:
> I've just seen that a recipe for cdparanoia already exists at this location:
> https://github.com/openembedded/openembedded/tree/master/recipes/cdparanoia
> 
> Is there a reason why this recipe is not in the meta-openembedded
> repository?

That is the OE-Classic repository, an older version of OE which is no longer 
maintained; the metadata in there is not usable with OE-Core without 
modification [1].

Cheers,
Paul

http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core

-- 

Paul Eggleton
Intel Open Source Technology Centre

