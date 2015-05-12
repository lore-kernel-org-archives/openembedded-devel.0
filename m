Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9E36973FE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 14:50:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 12 May 2015 07:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,415,1427785200"; d="scan'208";a="693705683"
Received: from dpassaue-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.14.139])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2015 07:50:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	Tom King <ka6sox@gmail.com>
Date: Tue, 12 May 2015 15:50:23 +0100
Message-ID: <2318833.dUhIBv86bq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <20150512144510.GC2714@jama>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
	<10765250.9tBgYfV1HJ@peggleto-mobl.ger.corp.intel.com>
	<20150512144510.GC2714@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 01/20] smstools: fix PN -> BPN for multilib
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
X-List-Received-Date: Tue, 12 May 2015 14:50:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 May 2015 16:45:11 Martin Jansa wrote:
> On Tue, May 12, 2015 at 01:43:19PM +0100, Paul Eggleton wrote:
> > On Monday 11 May 2015 11:27:04 Martin Jansa wrote:
> > > On Fri, May 08, 2015 at 03:42:16PM +0800, Yi Zhao wrote:
> > > > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > > 
> > > Changes 03, 18, 20 didn't make it to patchwork, because they were marked
> > > as Spam by gmail
> > 
> > Hang on, I'm confused. Why should the patches being marked as spam in
> > gmail have any bearing on whether they should show up in patchwork? Surely
> > gmail shouldn't be involved in the sending part, only subsequently when
> > the mail is sent from the mailing list to you (since you use gmail)?
> 
> Isn't patchwork reading some gmail account over imap?
> 
> The list of patches not appearing in patchwork is exactly matching with
> patches marked as spam in my inbox, so I believe that the same is
> happening in patchwork's gmail account.

Ouch - if so that's news to me, and seems very much sub-optimal. It may 
explain why patches keep on going missing from time to time. Khem/Tom, can we 
switch to a local solution?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

