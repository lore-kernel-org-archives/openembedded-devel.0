Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 73A9F729F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 12:06:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 07 Jan 2015 04:03:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="437498434"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jan 2015 03:54:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 07 Jan 2015 12:06:40 +0000
Message-ID: <2532264.7nvVTpZL4O@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5078133.mLJqslvvBi@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
	<20150107101423.GH29986@jama>
	<5078133.mLJqslvvBi@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [meta-oe/meta-webserver][PATCH v2 00/11] Merge modphp into php and upgrade
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
X-List-Received-Date: Wed, 07 Jan 2015 12:06:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 07 January 2015 11:55:08 Paul Eggleton wrote:
> On Wednesday 07 January 2015 11:14:23 Martin Jansa wrote:
> > On Mon, Jan 05, 2015 at 12:59:22PM +0100, Martin Jansa wrote:
> > > Thanks for v2
> > > 
> > > Please remember to update your old series as superseded when pushing
> > > newer version, it would help me a lot when sorting the pending patches.
> > 
> > Something is wrong:
> > 
> > php-5.5.20: php requires
> > /tmp/work/core2-64-oe-linux/php/5.5.20-r0/image/usr/bin/php, but no
> > providers in its RDEPENDS [file-rdeps]
> 
> OK, I've sent a v3 of just the offending patch, and pushed a new rebased
> paule/php branch.

Actually, after rebuilding again, that hasn't fixed the warning despite the 
fact that the shebang is now correct. Sigh...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

