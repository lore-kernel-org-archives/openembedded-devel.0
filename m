Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id D696675A60
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 07:54:16 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AE436D4025E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:54:12 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DB559D40044
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:54:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:54:11 +0200 (CEST)
Date: Fri, 7 Aug 2015 09:54:09 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150807075409.GD6096@mail.itconsulting-heinold.de>
References: <556EA59A.8010007@skidata.com>
	<CAP9ODKpB0A9JZbWdS80Dq2bNX1VG5e3PKTpSpCvdvCrwD4965g@mail.gmail.com>
	<55ACECA1.10102@skidata.com> <55C30BCC.2090309@skidata.com>
	<CAP9ODKrm-OgC5=_HTrPSpfNsGrab2cus7s8v1eRGa68_GLW5ZQ@mail.gmail.com>
	<CAMKF1sozWdo2yarqU2tOZ_JXg8yRVVfjSsE712EzbNW=v5QJHQ@mail.gmail.com>
	<55C4421A.3070706@skidata.com>
	<20150807071912.GC6096@mail.itconsulting-heinold.de>
	<55C46040.6080900@skidata.com>
MIME-Version: 1.0
In-Reply-To: <55C46040.6080900@skidata.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java][PATCH] openjdk-7: 75b13-2.5.4: fix xawt build
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
X-List-Received-Date: Fri, 07 Aug 2015 07:54:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2015 at 09:37:36AM +0200, Richard Leitner wrote:
> On 08/07/2015 09:19 AM, Henning Heinold wrote:
> > On Fri, Aug 07, 2015 at 07:28:58AM +0200, Richard Leitner wrote:
> >>
> >> Ok, thanks for the input. I'll rebase and test during the weekend.
> >> Hopefully I have v2 patch at the beginning of next week.
> >>
> > 
> > If you have the time, it would be nice if you could update it to the latest 2.5.6 release.
> > 
> According "Andrew's Blog" 2.5.6 was the last 2.5.x release [1]:
> 	There will be one further release of the 2.5.x series, 2.5.6,
> 	for the July 2015 security updates, in tandem with 2.6.1, both
> 	coming in the next few days. In October, the 2.5.x branch will
> 	be rendered obsolete, with only the 2.6.x series being updated
> 	for that security update. Please use the intervening period to
> 	transition to the 2.6.x series.
> 
> Due to this fact I planned to update it to IcedTea 2.6.1 (2015-07-21).
> Are there any facts against the 2.6.x release?
> 
> regards,
> Richard L
> 
> [1]
> http://blog.fuseyism.com/index.php/2015/07/19/icedtea-2-6-0-for-openjdk-7-released/

Not from me.

Bye Henning

