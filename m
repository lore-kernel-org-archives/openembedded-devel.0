Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 3052360DF7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 15:08:12 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2C1AC2232CC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 17:08:08 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8A9762232CBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 17:08:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 17:08:07 +0200 (CEST)
Date: Fri, 11 Jul 2014 17:08:05 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140711150805.GC6407@mail.itconsulting-heinold.de>
References: <20140627141915.GA23711@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C6A6@SEXCHANGE0100.lpg.priv>
	<20140627151503.GB23711@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C6D6@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612EC9F@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612F212@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0614A7C3@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0614BE8C@SEXCHANGE0100.lpg.priv>
	<20140711141150.GB6407@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0614BF19@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA0614BF19@SEXCHANGE0100.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Building openjdk-7-jre
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
X-List-Received-Date: Fri, 11 Jul 2014 15:08:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 11, 2014 at 02:56:05PM +0000, MONDON Daniel wrote:
> Hi,
> 
> I apt-get install libstdc++-4.8-dev.
> Is it the right version ?
> 
> Thanks
> Daniel.
> 

Sorry I can not look at your computer, but it should match the g++ you are using.

g++ has a nice option which is called --version, which will tell you the version.

Bye Henning

