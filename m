Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C9D966FF56
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 13:06:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2016 06:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,449,1459839600"; d="scan'208";a="972970983"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2016 06:06:24 -0700
To: openembedded-devel@lists.openembedded.org
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <399902a6-8f05-a3ee-2bd6-fb4b5119182e@linux.intel.com>
Date: Fri, 10 Jun 2016 16:06:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
Subject: Re: [OE-core] the fate of Vala in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 13:06:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2016 05:08 PM, Philip Balister wrote:

> It seems that there are use cases beyond just embedded systems for
> OpenEmbedded, so this logic is not really valid. See:
>
> http://openxt.org/
>
> And yes, I think it is useful for openembedded-core to have as broad an
> audience as possible.

Our resources are limited, so there has to be specific evidence for a 
need for Vala; not the vague 'it could be useful to someone out there' 
kind of thinking.

The reason I was proposing removing Vala is that:
a) you can count the open source software written in Vala on fingers of 
one hand: it's Rygel, Elementary OS apps, and a couple of 
desktop-oriented Gnome apps.
b) until yesterday, we haven't heard of any in-house usage of Vala by OE 
users.

But since people have spoken up, I'll make a different proposal in a moment.

> That said, what other layers use vala? If it leaves core, is there a
> layer that can host it and support other layers using it without to much
> trouble?

As far as oe-core and all of meta-oe layers go, it's Rygel and 
vala-terminal, that's all.

Alex


