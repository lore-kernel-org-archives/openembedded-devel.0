Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C155A73FDA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 16:15:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2015 09:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,416,1427785200"; d="scan'208";a="709061220"
Received: from dpassaue-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.14.139])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2015 09:15:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 May 2015 17:15:46 +0100
Message-ID: <13256726.2GaiCtjn8S@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <1DD47E4E-8968-44C6-BEEF-0A1704D9225A@gmail.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
	<2318833.dUhIBv86bq@peggleto-mobl.ger.corp.intel.com>
	<1DD47E4E-8968-44C6-BEEF-0A1704D9225A@gmail.com>
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
X-List-Received-Date: Tue, 12 May 2015 16:15:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 May 2015 09:09:13 Khem Raj wrote:
> > On May 12, 2015, at 7:50 AM, Paul Eggleton <paul.eggleton@linux.intel.com>
> > wrote:
> > 
> > Ouch - if so that's news to me, and seems very much sub-optimal. It may
> > explain why patches keep on going missing from time to time. Khem/Tom, can
> > we switch to a local solution?
> 
> we rely on google spam filter. Local solution would require higher
> maintenance and spam you can never defeat on your own

I'm not quite following - spam doesn't tend to be a problem on our mailing 
lists since you have to be subscribed to post. In any case patchwork only 
cares about messages that are patches or pull requests - anything else is 
ignored.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

