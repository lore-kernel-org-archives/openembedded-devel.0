Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 62CFD78B46
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 12:09:02 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 67E012E61B36;
	Mon, 11 Jun 2018 14:09:02 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 141FA2E61B35;
	Mon, 11 Jun 2018 14:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.itconsulting-heinold.de (unknown [178.19.210.209])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Mon, 11 Jun 2018 14:08:54 +0200 (CEST)
Date: Mon, 11 Jun 2018 14:08:47 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20180611120847.GB16619@mail.itconsulting-heinold.de>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
	<20180606204244.GA16170@mail.itconsulting-heinold.de>
	<fcaab484-d381-92f7-04d7-2a7edca6f903@skidata.com>
	<20180607132234.GA19704@mail.itconsulting-heinold.de>
	<91e19a88-1a03-b772-b6be-bf6bf27037c8@skidata.com>
	<CAP9ODKrFomJ2Rvp5mku81Op-rYCNt-AXm4TVV2-aSg6QSfEoFQ@mail.gmail.com>
	<d8462836-e655-4bb4-7b03-bce18cb3e24c@skidata.com>
	<20180611113035.GA17777@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <20180611113035.GA17777@mbabyjoh-desk.ger.corp.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java] maintainer status
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
X-List-Received-Date: Mon, 11 Jun 2018 12:09:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 11, 2018 at 02:30:35PM +0300, Maxin B. John wrote:
> Hi Richard,
> 
> Sorry for my long silence here in the list ( was away due to a personal loss).
> 
> 
> On Thu, Jun 07, 2018 at 04:32:36PM +0200, prvs=68935beb6=Richard.Leitner@skidata.com wrote:
> > On 06/07/2018 03:56 PM, Otavio Salvador wrote:
> > > On Thu, Jun 7, 2018 at 10:53 AM, Richard Leitner
> > > <richard.leitner@skidata.com> wrote:
> > > ....
> > >> As I'm using this layer now for quite a few years I'll be glad to help you with
> > >> the maintainership of meta-java. Nonetheless I have to admit that I have no
> > >> experience in maintaining an openembedded layer ;-)
> > >> Therefore if you're still interested I'd have some questions regarding the
> > >> "strategic" targets, workflows and stuff like that...
> > > 
> > > Awesome, new energy!
> 
> Great ! 
> 
> > > Sure, go ahead and ask :-D
> > > 
> > 
> > Thanks :-)
> > 
> > So here are some question that currently came to my mind:
> > 
> >  * do you use some kind of patch management software (like patchwork)?
> 
> meta-java doesn't use patchwork till now.

Yes, but we are using the normal the oe mailinglist, that is why you can find
the patches with the meta-java tag in the current patchwork too.

Bye Henning

