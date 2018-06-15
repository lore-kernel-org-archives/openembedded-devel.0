Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDD174FA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:22:05 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 106392E63D9B;
	Fri, 15 Jun 2018 11:22:06 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6E6D72E63D9A;
	Fri, 15 Jun 2018 11:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.itconsulting-heinold.de (unknown [178.19.210.209])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Fri, 15 Jun 2018 11:22:03 +0200 (CEST)
Date: Fri, 15 Jun 2018 11:21:57 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20180615092149.GA21861@mail.itconsulting-heinold.de>
References: <3463e929-53ce-df98-355c-11de357fc5ae@skidata.com>
	<69df7e62-bd10-ba0e-7441-1bb4f76940f3@skidata.com>
	<20180615085854.GA35551@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <20180615085854.GA35551@mbabyjoh-desk.ger.corp.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [yocto] [meta-java][PATCH 3/3] openjdk-8: use ca-certificates-java
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
X-List-Received-Date: Fri, 15 Jun 2018 09:22:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 15, 2018 at 11:58:55AM +0300, Maxin B. John wrote:
> Hi Richard,
> 
> On Fri, Jun 15, 2018 at 10:19:06AM +0200, prvs=6977bbb5e=Richard.Leitner@skidata.com wrote:
> > fyi, as this was posted on yocto@yoctoproject.org
> > 
> > @Otavio/Maxin/Henning: is it OK to just force-push to
> > master-next without this commit? Or should I push a
> > "revert" commit?
> 
> I think it is ok to force-push to the master-next branch 
> (obviously not ok to force push to other branches).
> 
> > regards;Richard.L
> 
> Best Regards,
> Maxin

Hi,

I am fine with push-force in this case too.

Bye Henning

