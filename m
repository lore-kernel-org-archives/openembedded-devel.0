Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 099A276EB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:37:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 27 Oct 2015 04:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,204,1444719600"; d="scan'208";a="836485885"
Received: from fcheverx-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.10.27])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2015 04:37:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Oct 2015 11:37:36 +0000
Message-ID: <11758297.Qg5HCuaF4n@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAP71WjyyrqEGtdfN1mzrwaH=YGAC4zdz5QwFH-aSxNzgXr=4JA@mail.gmail.com>
References: <562EB36A.1010109@webthatworks.it>
	<CAP71WjyyrqEGtdfN1mzrwaH=YGAC4zdz5QwFH-aSxNzgXr=4JA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: checking if a patch was approved
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
X-List-Received-Date: Tue, 27 Oct 2015 11:37:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 27 October 2015 08:12:48 Nicolas Dechesne wrote:
> On Tue, Oct 27, 2015 at 12:12 AM, Ivan Sergio Borgonovo
> <mail@webthatworks.it> wrote:
> > I saw many patch passing by and I submitted a couple about
> > meta-toolchain-qt5.
> > I didn't see any message from Otavio or Martin "approving" a patches.
> > 
> > How can I check if it was approved other than pulling from the
> > repo/checking github?
> > 
> > Or if there is no place to check... consider this a ping ;)
> 
> all commits are published on
> openembedded-commits@lists.openembedded.org mailing list, and in
> general you see when it's pushed in master-next, then in master.. i
> have a mail filter that checks my name there.. it's the poor man
> solution.. but it works. Note that the email trigger has been broken
> for 2 weeks.. but i suspect this is a temporary issue that should be
> fixed..

FWIW there are a small number of us working on improving patchwork so that 
we're able to rely upon the results it shows as being the outstanding patches 
in the queue and potentially even send email notifications to submitters (opt-
in). I'd also like to go a step further and trigger some automatic validation 
on patches. At the moment we're trying to figure out if we're able to spend the 
time working on this in the next development cycle.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

