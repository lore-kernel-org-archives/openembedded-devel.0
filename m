Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B93C97701C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 11:05:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2015 04:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,611,1437462000"; d="scan'208";a="816126306"
Received: from mhanley-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.22.120])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2015 04:05:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Sep 2015 12:05:32 +0100
Message-ID: <3684850.Dr1EhiOegx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAMKF1spL0-FpdJVNrPjDQNfrGzHztqUqCjeHR2YBtRbvBSH=Ag@mail.gmail.com>
References: <1443601616-25650-1-git-send-email-ulf@emagii.com>
	<1443601616-25650-2-git-send-email-ulf@emagii.com>
	<CAMKF1spL0-FpdJVNrPjDQNfrGzHztqUqCjeHR2YBtRbvBSH=Ag@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH] Use GFDL-1.1 instead of GFDLv1.1
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
X-List-Received-Date: Wed, 30 Sep 2015 11:05:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 30 September 2015 03:10:56 Khem Raj wrote:
> On Wed, Sep 30, 2015 at 1:26 AM, Ulf Samuelsson <ulf@emagii.com> wrote:
> > -LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
> > +LICENSE = "GPLv2 & LGPLv2 & GFDL-1.1"
> 
> IIRC both are correct

I don't think we have an SPDXLICENSEMAP entry for this though, so it won't be 
being mapped (unlike GPLv2 -> GPL-2.0).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

