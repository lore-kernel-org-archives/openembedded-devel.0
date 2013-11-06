Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8BB6CA17
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 11:50:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Nov 2013 03:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,646,1378882800"; d="scan'208";a="428722307"
Received: from unknown (HELO helios.localnet) ([10.252.121.74])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2013 03:50:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org, Tom King <ka6sox@gmail.com>
Date: Wed, 06 Nov 2013 11:50:23 +0000
Message-ID: <2826720.tTDD0GUmWP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20131104214636.GF3684@jama>
References: <CAFZh4h9pmB59YS7wRKD1ubui2_yf1Hjg5NgtW-nDr9eC8im1dA@mail.gmail.com>
	<20131104214636.GF3684@jama>
MIME-Version: 1.0
Subject: Re: Still getting gd-2.0.36RC1.tar.gz errors in meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
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
X-List-Received-Date: Wed, 06 Nov 2013 11:50:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 04 November 2013 22:46:36 Martin Jansa wrote:
> On Mon, Nov 04, 2013 at 04:09:22PM -0500, Brian Hutchinson wrote:
> > This has been going on for the last month or two.  Apparently this
> > upstream project name changed and it no longer available at the URL.  I
> > looked into it several weeks ago but it didn't look like a simple URL path
> > fix as it looked like other stuff depends on it.  I've been coping the file
> > from an earlier build to my downloads directory to get my builds to
> > complete.
> 
> grab copy from
> http://ring.u-toyama.ac.jp/archives/graphics/gd/
> and put it on your PREMIRROR.

Tom, would you be able to grab 
http://ring.u-toyama.ac.jp/archives/graphics/gd/gd-2.0.36RC1.tar.gz 
and put it on the OE source mirror? md5sum should be 
39ac48e6d5e0012a3bd2248a0102f209.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

