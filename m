Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 722706E616
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:19:43 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B41E02E63D9B;
	Fri, 29 Jun 2018 15:19:43 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 12E1B2E63D9A;
	Fri, 29 Jun 2018 15:19:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.itconsulting-heinold.de (unknown [178.19.210.209])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Fri, 29 Jun 2018 15:19:43 +0200 (CEST)
Date: Fri, 29 Jun 2018 15:19:40 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: Belisko Marek <marek.belisko@gmail.com>
Message-ID: <20180629131940.GB3898@mail.itconsulting-heinold.de>
References: <CAAfyv37AbvjKMnu=N38KxfJtRLFzAU=0CVFSpi64LpZgG6KTag@mail.gmail.com>
	<20180629130543.GA3898@mail.itconsulting-heinold.de>
	<CAAfyv36RrHUbuVeUFTgHptMF6gosv4KD1=UUJuaLiTX40XCLRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfyv36RrHUbuVeUFTgHptMF6gosv4KD1=UUJuaLiTX40XCLRQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-java openjdk-8 fails to compile for beaglebone
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
X-List-Received-Date: Fri, 29 Jun 2018 13:19:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 29, 2018 at 03:08:53PM +0200, Belisko Marek wrote:
> Hi Henning,
> On Fri, Jun 29, 2018 at 3:06 PM Henning Heinold
> <henning@itconsulting-heinold.de> wrote:
> >
> > On Fri, Jun 29, 2018 at 02:33:02PM +0200, Belisko Marek wrote:
> > > Hello,
> > >
> > > I'm trying to compile openjdk-8 from actual meta-java master (I'm
> > > using rocko poky though).
> >
> > Please try the rocko branch from meta-java and build again.
> On rocko branch it works but I would need latest version of openjdk.
In that case I think you need to backport the version upgrade to the rocko branch or
wait until someone will do it. There some changes in master regarding the xorg-proto headers.

Bye Henning

