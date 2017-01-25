Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 63C5071C9E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 22:23:21 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2017 14:23:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,286,1477983600"; d="scan'208";a="57256480"
Received: from wlim11-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.191.49])
	by orsmga005.jf.intel.com with ESMTP; 25 Jan 2017 14:23:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jan 2017 11:23:05 +1300
Message-ID: <1777092.5nJB4Vqk5u@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/5.3.3 (Linux/4.9.5-200.fc25.x86_64; KDE/5.29.0; x86_64; ; )
In-Reply-To: <CAJTo0LYG+T4yc1uzDrMW4GirKpdmyU887K4RJWd9pxwULg+qEg@mail.gmail.com>
References: <1484923430-3222-1-git-send-email-ross.burton@intel.com>
	<20170125161855.GG3260@jama>
	<CAJTo0LYG+T4yc1uzDrMW4GirKpdmyU887K4RJWd9pxwULg+qEg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] libxcalibrate: add, from oe-core
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
X-List-Received-Date: Wed, 25 Jan 2017 22:23:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 25 January 2017 4:38:11 PM NZDT Burton, Ross wrote:
> On 25 January 2017 at 16:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Why do we need this in meta-oe? Just because xtscal was dumped here as
> > well?
> 
> Yes.  xtscal etc are the only users, so they're in oe-core with nothing
> using them.  They should have moved to meta-oe along with xtscal, but were
> missed.
> 
> The alternative is to delete xtscal from meta-oe and then we can just drop
> these from oe-core as they're not used at all, but that's not my call.

Can you mention this in the commit message?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

