Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3E50060135
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 08:04:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Sep 2013 01:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,941,1371106800"; d="scan'208";a="404551952"
Received: from unknown (HELO helios.localnet) ([10.252.123.234])
	by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2013 01:04:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Amy Fong <amy.fong@windriver.com>
Date: Fri, 20 Sep 2013 09:04:43 +0100
Message-ID: <2539033.EVdXVeGjTT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130920023529.GA28484@windriver.com>
References: <20130920023529.GA28484@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: distutils: Replacing path to native path only to be done to non-native python packages
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
X-List-Received-Date: Fri, 20 Sep 2013 08:04:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Amy,

On Thursday 19 September 2013 22:35:29 Amy Fong wrote:
> distutils: Replacing path to native path only to be done to non-native
> python packages
> 
> distutils: Replacing path to native python by path to python in the
> image to support python packages with console-script setup resulted in
> a "bad interpreter" error message because coreutils-native is not
> a specified dependency of a number of native python packages.
> 
> We modify the change to apply specifically to non-native packages.
> 
> Signed-off-by: Amy Fong <Amy.Fong@windriver.com>
> ---
>  meta/classes/distutils.bbclass | 8 ++++++--

This is a patch for OE-Core, so it needs to be sent to the openembedded-
core@lists.openembedded.org mailing list.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

