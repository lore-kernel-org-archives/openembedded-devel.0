Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 593 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Aug 2015 07:29:16 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id E9B9D764AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 07:29:16 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 623BDD40050
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:19:21 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A0C70D40044
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:19:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:19:20 +0200 (CEST)
Date: Fri, 7 Aug 2015 09:19:12 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150807071912.GC6096@mail.itconsulting-heinold.de>
References: <556EA59A.8010007@skidata.com>
	<CAP9ODKpB0A9JZbWdS80Dq2bNX1VG5e3PKTpSpCvdvCrwD4965g@mail.gmail.com>
	<55ACECA1.10102@skidata.com> <55C30BCC.2090309@skidata.com>
	<CAP9ODKrm-OgC5=_HTrPSpfNsGrab2cus7s8v1eRGa68_GLW5ZQ@mail.gmail.com>
	<CAMKF1sozWdo2yarqU2tOZ_JXg8yRVVfjSsE712EzbNW=v5QJHQ@mail.gmail.com>
	<55C4421A.3070706@skidata.com>
MIME-Version: 1.0
In-Reply-To: <55C4421A.3070706@skidata.com>
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
X-List-Received-Date: Fri, 07 Aug 2015 07:29:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2015 at 07:28:58AM +0200, Richard Leitner wrote:
> On 08/07/2015 04:31 AM, Khem Raj wrote:
> > On Thu, Aug 6, 2015 at 6:02 AM, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> >> On Thu, Aug 6, 2015 at 4:25 AM, Richard Leitner
> >> <richard.leitner@skidata.com> wrote:
> >>> Hello,
> >>> any updates on this patch?
> >>
> >> The patch didn't apply so I asked you to rebase. Can you rebase and send?
> >>
> > 
> > in addition please build for FSL ppc since that was original
> > architecture where it failed when I did this patch
> > 
> 
> Ok, thanks for the input. I'll rebase and test during the weekend.
> Hopefully I have v2 patch at the beginning of next week.
> 
> regards,
> Richard L
> -- 

If you have the time, it would be nice if you could update it to the latest 2.5.6 release.

Bye Henning
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

