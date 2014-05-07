Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D1EF460167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 08:49:06 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 May 2014 01:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1001,1389772800"; d="scan'208";a="428757693"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.213])
	by azsmga001.ch.intel.com with ESMTP; 07 May 2014 01:49:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Wed, 07 May 2014 09:49:04 +0100
Message-ID: <3120944.8W8OHk0NM6@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <5369A9ED.4060506@linaro.org>
References: <5364B398.5000802@embed.me.uk>
	<1950582.OeVgyhOmPz@peggleto-mobl5.ger.corp.intel.com>
	<5369A9ED.4060506@linaro.org>
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
X-List-Received-Date: Wed, 07 May 2014 08:49:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 May 2014 23:35:09 Trevor Woerner wrote:
> On 05/06/14 12:12, Paul Eggleton wrote:
> > So I'd hope that the machine listing in the layer index could be made
> > to help with that.
> 
> Absolutely, for raw recipe information or information on which MACHINEs
> are supported the layer index would be a good choice.
> 
> But there's a fair amount of difference between "MACHINE, layer, and
> recipe definitions" versus "here's the FSL community information, they
> use repo, here's where they keep their manifests, here are the manifests
> they have available, these are the boards they support, and here is how
> you run their setup script".

Excuse my ignorance, but what do you mean by "manifests"?

> Unless you're suggesting the layer index could also inform users of
> manifests and setup script conventions?

On a per layer basis that is the intention of providing the "Setup 
information" URL field - it's a link to further information about how to use 
the layer. For example, OE-Core has one:

http://layers.openembedded.org/layerindex/layer/openembedded-core/

This can be either an external URL or a pointer to a file within the repository 
(if it doesn't have the http:// prefix).

That might not be fine-grained enough to handle what we're talking about but it 
is something along the right lines I think.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

