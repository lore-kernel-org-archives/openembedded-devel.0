Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 51DD360650
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 16:14:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 May 2014 09:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,998,1389772800"; d="scan'208";a="535628858"
Received: from kcathuko-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.115])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2014 09:12:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Tue, 06 May 2014 17:12:45 +0100
Message-ID: <1950582.OeVgyhOmPz@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <CALmOhg=xAZehYF48AMcwX4Ugcpm4YE1yEdWH1+w9W0Y=TfDuew@mail.gmail.com>
References: <5364B398.5000802@embed.me.uk>
	<CALmOhg=xAZehYF48AMcwX4Ugcpm4YE1yEdWH1+w9W0Y=TfDuew@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Website Text
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
X-List-Received-Date: Tue, 06 May 2014 16:14:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 May 2014 11:47:00 Trevor Woerner wrote:
> On 3 May 2014 05:15, Jack Mitchell wrote:
> > The current website address is http://frontpage.openembedded.org/
> 
> My feeling is that there is a chance people will be coming to the OE
> website with a board already in front of them, looking to find out if
> OE supports it and how they might go about creating an image for
> what's on their desk.
> 
> As such I think a set of links to various OE project website might be
> useful, organized by board:
> 
> freescale: http://freescale.github.io/
> gumstix:
> https://github.com/gumstix/Gumstix-YoctoProject-Repo/blob/master/README.md
> beaglebone: http://www.angstrom-distribution.org/ (?)
> various intel boards: ??

So I'd hope that the machine listing in the layer index could be made to help 
with that. It is fairly primitive at the moment (mainly because there's not 
much in the way of meta-information to record against each machine, at least 
not that we can extract from the metadata itself) but we can look at ways to 
extend it if it would help.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

