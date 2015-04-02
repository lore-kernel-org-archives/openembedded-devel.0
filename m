Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47DC56AC56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 14:30:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t32EUJXY016964
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Apr 2015 07:30:19 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 2 Apr 2015 07:30:18 -0700
Message-ID: <551D5279.5080902@windriver.com>
Date: Thu, 2 Apr 2015 10:30:17 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Tim Orling <ticotimo@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <54F47045.4080503@windriver.com>	<20150302142645.GC2309@jama>	<551CC7F3.9080300@gmail.com>
	<CANx9H-CJXC1OHRqV0G58_xKVhez-VD3A8a4aHXO2MPthvcwD-Q@mail.gmail.com>
In-Reply-To: <CANx9H-CJXC1OHRqV0G58_xKVhez-VD3A8a4aHXO2MPthvcwD-Q@mail.gmail.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: Discuss: ruby-1.9.x EOL -- someone to add ruby-2.2?
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
X-List-Received-Date: Thu, 02 Apr 2015 14:30:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-04-02 12:57 AM, Tim Orling wrote:
>
>
> On Wed, Apr 1, 2015 at 9:39 PM, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Randy,
>
>
>     On 03/02/2015 06:26 AM, Martin Jansa wrote:
>
>         On Mon, Mar 02, 2015 at 09:14:29AM -0500, Randy MacLeod wrote:
>
>
>             As stated in the post below, ruby-1.9.3 is no longer supported
>             and CVEs will not be released.
>
>             I'm not a rubyist but I assume we should upgrade to
>             ruby-2.2.0 which
>             became the stable version as of December 25, 2014. Comments?
>             Martin, you are listed as maintainer of the meta-multimedia,
>             do you have any concerns about such an upgrade?
>
>
>         No concerns from me.. I don't use ruby much (mostly ruby-native for
>         webkit builds) so I would welcome such upgrade.
>
>             If anyone wants to start work on this for meta-oe, that'd be
>             great.
>             If no one gets around to it, then a developer from WindRiver
>             will
>             likely be able to work on it but not a few months.
>
>
>     I started on the upgrade. Hope to have it done soon.
>     - Armin
>
>
> I will help if there is any collateral damage in meta-openembedded.
> -Tim

Thanks for the notice. We're busy with other projects so
we haven't started or even discussed the ruby work yet.

We'll be more active in OE in May or June. We include lots
of OE recipes (meta-networking/webserver/python /...) in WR Linux, FYI.

../Randy
>
>
>
>             ../Randy
>
>             ---
>             As of today, all support for Ruby 1.9.3 has ended. Bug and
>             security
>             fixes from more recent Ruby versions will no longer be
>             backported to 1.9.3.
>
>             This end of life was announced over a year ago.
>
>             We highly recommend that you upgrade to Ruby 2.0.0 or above
>             as soon as
>             possible. Please contact us if you’d like to continue
>             maintaining the
>             1.9.3 branch or if for some reason you can’t upgrade.
>
>             Posted by Olivier Lacan on 23 Feb 2015
>             ---
>             Also see:
>             https://bugs.ruby-lang.org/__projects/ruby/wiki/__ReleaseEngineering
>             <https://bugs.ruby-lang.org/projects/ruby/wiki/ReleaseEngineering>
>
>             --
>             # Randy MacLeod. SMTS, Linux, Wind River
>             Direct: 613.963.1350 <tel:613.963.1350> | 350 Terry Fox
>             Drive, Suite 200 Ottawa, Ontario,
>             Canada K2K 2W5
>
>
>
>
>     --
>     _________________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.__openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/__mailman/listinfo/openembedded-__devel <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200 Ottawa, Ontario, 
Canada K2K 2W5

