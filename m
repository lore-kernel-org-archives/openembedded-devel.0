Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D259D6EC7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 11:06:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Mar 2014 04:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,669,1389772800"; d="scan'208";a="474049254"
Received: from mcorkery-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.96])
	by orsmga001.jf.intel.com with ESMTP; 17 Mar 2014 04:06:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Mon, 17 Mar 2014 11:06:06 +0000
Message-ID: <2630836.aG3BnBskVV@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <4129044.axao0DyIby@peggleto-mobl5.ger.corp.intel.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
	<7534099.nuqRK6Rzn4@peggleto-mobl5.ger.corp.intel.com>
	<4129044.axao0DyIby@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH v2 00/10]
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
X-List-Received-Date: Mon, 17 Mar 2014 11:06:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 09 March 2014 11:49:49 Paul Eggleton wrote:
> On Wednesday 26 February 2014 10:03:46 Paul Eggleton wrote:
> > On Sunday 02 February 2014 22:51:05 Tim Orling wrote:
> > > This series of recipes is the first step towards the ultimate
> > > goal of getting Slic3r to build in OE.
> > > 
> > > Original submission was missing Algorithm::Diff which Text::Diff depends
> > > on.
> > > 
> > > Resubmitted to follow Debian Perl Policy.
> > > See 4.2 Module Package Names
> > > [http://www.debian.org/doc/packaging-manuals/perl-policy/ch-module_packa
> > > ge
> > > s
> > > .html]
> > > 
> > > Tim Orling (10):
> > >   libmodule-metadata-perl: add 1.000019
> > >   libtext-diff-perl: add 1.41
> > >   libcapture-tiny-perl: add 0.23
> > >   libmodule-runtime-perl: add 0.013
> > >   libextutils-config-perl: add 0.007
> > >   libextutils-helpers-perl: add 0.021
> > >   libextutils-installpaths-perl: add 0.010
> > >   libmodule-build-tiny-perl: add 0.030
> > >   libextutils-cppguess-perl: add 0.07
> > >   libalgorithm-diff-perl: add 1.15
> > 
> > Hongxu, do these look OK? If so do you need me to apply them, or do you
> > have access to do that now?
> 
> Hongxu - ping

ping...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

