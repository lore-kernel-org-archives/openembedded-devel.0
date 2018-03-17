Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id 114B060290
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Mar 2018 14:23:52 +0000 (UTC)
Received: (qmail 11574 invoked by uid 1003); 17 Mar 2018 14:23:56 -0000
Received: from unknown (HELO ?10.0.0.217?) (philip@opensdr.com@98.245.198.122)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	17 Mar 2018 14:23:56 -0000
To: Trevor Woerner <twoerner@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<1fad6cab-f195-1dca-3b10-ebefe0e44fe3@gmail.com>
	<1519163708.24236.337.camel@linuxfoundation.org>
	<CA+chaQd=QE4fc32LDKepRsNn0gtuyQSfFi3aQ2YxmRbZtJjp1Q@mail.gmail.com>
	<1519170075.24236.345.camel@linuxfoundation.org>
	<20180317035021.GA19189@linux-uys3>
From: Philip Balister <philip@balister.org>
Message-ID: <fc8783c5-a576-3caa-d44a-9bf030da42c3@balister.org>
Date: Sat, 17 Mar 2018 07:23:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180317035021.GA19189@linux-uys3>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Sat, 17 Mar 2018 14:23:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

On 03/16/2018 08:50 PM, Trevor Woerner wrote:
> On Tue 2018-02-20 @ 11:41:15 PM, Richard Purdie wrote:
>> The separate layers and maintainership is the way we designed the new
>> layered approach to OE to scale.
> 
> I only became an active user of OE after the OE-classic split; I had used it a
> couple times during the OE-classic era, but not very deeply. Therefore: my
> apologies for not having a fuller understanding of the issue(s).
> 
> Would anyone like to make an honest, unbiased attempt at answering:
> 1. What problem(s) was the post-OE-classic split attempting to solve?

The all in one approach is untestable.

> 2. Did it work? Can it be said that the problem(s) the OE-split was attempting
>    to solve, have actually been solved by the split? (and, if new problems
>    arose as a result of this split, were they small an manageable relative to
>    the pre-split problems?)
> 

OE-core is well tested, and that has taken a lot of resources. There are
not dedicated resources to test much beyond this. The real problem is
how to get resources to test layers beyond oe-core. And maintain testing
of oe-core.

Philip


> The experiment to decide whether we need more splits or consolidation has
> already been done. Have the results been sufficiently understood?
> 

