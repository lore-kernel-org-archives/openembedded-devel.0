Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2EA26CC7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 09:20:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Oct 2013 02:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1079,1371106800"; d="scan'208";a="391498950"
Received: from unknown (HELO helios.localnet) ([10.252.120.209])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2013 02:20:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Fri, 11 Oct 2013 10:19:59 +0100
Message-ID: <5641383.zhBarnGleb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAOLEWZVgW5g7pKpogBfwPWMw34e27iqk3DHxbeLjFTWBG8Z7YQ@mail.gmail.com>
References: <1381296824-30294-1-git-send-email-stephen.arnold42@gmail.com>
	<3526425.HOOTbMNAZg@helios>
	<CAOLEWZVgW5g7pKpogBfwPWMw34e27iqk3DHxbeLjFTWBG8Z7YQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded/meta-webserver][PATCH] nginx: new recipe, updated from aging original in rpi layer (has not been scrubbed for any potential policy issues).
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
X-List-Received-Date: Fri, 11 Oct 2013 09:20:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Steve,

On Thursday 10 October 2013 20:02:49 Stephen Arnold wrote:
> Anyway, I was (somewhat blindly) following the submission/patch
> instructions here:
> 
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> 
> I can certainly provide more info (as well as clean up the recipe) but your
> first few points don't seem to be mentioned there, although the page seems
> fairly current date-wise.  Should I be looking in a different place?

To be honest we probably don't have one place where all of this is currently 
documented, sorry about that. We do have:

 http://www.openembedded.org/wiki/Styleguide

However that doesn't actually cover all of the items I mentioned. Some of the 
material from the following page probably should be added to the style guide:

 http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core

We do also have this page; it's linked from the "How to submit a patch" page 
although perhaps not prominently:

 http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

> Otherwise I'll do me best to address everything, it just might take a few
> days (too many work hours lately).

No worries.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

