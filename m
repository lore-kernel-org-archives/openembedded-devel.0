Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 8070E65C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 08:00:43 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DF441D40344
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 09:00:41 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 03D47D4025E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 09:00:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 09:00:40 +0100 (CET)
Date: Mon, 12 Jan 2015 09:00:35 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150112080035.GB18240@mail.itconsulting-heinold.de>
References: <CAOg63ZwrYDg+n=631P18+9VFLQVkBPgQdLvWkQnnQxnOJ=sz8w@mail.gmail.com>
	<20150111152245.GC2465@mail.itconsulting-heinold.de>
	<CAOg63ZxM-Q4GBeEOcr6i1YGS+p5y4mbU__XAVcU7SziMgzhDrw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOg63ZxM-Q4GBeEOcr6i1YGS+p5y4mbU__XAVcU7SziMgzhDrw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: openjdk-7 failed with exit code '1' for angstrom linux image V2.3
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
X-List-Received-Date: Mon, 12 Jan 2015 08:00:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 12, 2015 at 09:35:24AM +0530, Nikhil Gend wrote:
> Could you please tell me how to revert the qemu updates as i am new to this
> openembedded-core stuff.
> 
> Thanks and regards
> Nikhil Gend
> 

This has nothing todo with oe, it is git. You can use git log to find the latest update commit and than
git doing git revert on the git commit id.

Bye Henning

