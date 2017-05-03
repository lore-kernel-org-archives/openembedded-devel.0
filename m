Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2F04A71C9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 May 2017 21:33:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 03 May 2017 14:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,284,1491289200"; d="scan'208";a="852596933"
Received: from englingh-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.164.252])
	by FMSMGA003.fm.intel.com with ESMTP; 03 May 2017 14:33:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 04 May 2017 09:33:38 +1200
Message-ID: <4199013.DMSEEGMUmM@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
References: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
MIME-Version: 1.0
Cc: Steven Osborn <osborn.steven@gmail.com>
Subject: Re: State of Java on OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 May 2017 21:33:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, 22 April 2017 10:25:55 AM NZST Steven Osborn wrote:
> Is anyone using Java on OE devices right now?
> 
> meta-java - no release branches.  Seems to only be focused on master.
> I've had trouble even finding a revision that will compile on Morty.

So it looks like there is a morty branch now, but it includes a commit that 
only works with master due to inheriting relative_symlinks (as also noted by 
Koen). 

Maxin (or someone else with push access), could you please fix the morty 
branch?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

