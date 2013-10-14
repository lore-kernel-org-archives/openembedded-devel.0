Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 827806CC5E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 13:02:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2013 06:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,492,1378882800"; d="scan'208";a="410608796"
Received: from unknown (HELO helios.localnet) ([10.252.120.188])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2013 06:01:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Oct 2013 14:01:50 +0100
Message-ID: <11422146.3qMW8pR9ZR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <525BE8BF.3060705@gmail.com>
References: <1381738170-28131-1-git-send-email-koen@dominion.thruhere.net>
	<525BE8BF.3060705@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2] python-pip: add 1.3.1
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
X-List-Received-Date: Mon, 14 Oct 2013 13:02:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 October 2013 23:51:11 Jonathan Liu wrote:
> On 14/10/2013 7:09 PM, Koen Kooi wrote:
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> > 
> >   meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >   create mode 100644 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> > 
> > diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> > b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb new file mode
> > 100644
> > index 0000000..c812913
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> > @@ -0,0 +1,14 @@
> > +DESCRIPTION = "Python-pip is a tool for installing and managing Python
> > packages."
> It is called pip. python-pip is the recipe name.

Also please use SUMMARY instead of DESCRIPTION for short one-liners like this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

