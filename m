Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1IzLOL-0004Mj-G1
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2007 01:12:01 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 10FF55C0C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2007 19:08:33 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 03 Dec 2007 19:08:33 -0500
X-Sasl-enc: hpymqA54BWOM14j3UpoCrMjT98Qifx1bKT1rOBtsMBMA 1196726912
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 439A410D90
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2007 19:08:31 -0500 (EST)
Message-ID: <47549A57.3070308@whitby.id.au>
Date: Tue, 04 Dec 2007 10:37:51 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <475207FB.8020405@whitby.id.au>	<704452397.20071202201743@gmail.com>
	<47531B1B.9000700@whitby.id.au>
	<c384c5ea0712030721wac64724ra20c08c4305af8c9@mail.gmail.com>
In-Reply-To: <c384c5ea0712030721wac64724ra20c08c4305af8c9@mail.gmail.com>
Subject: Re: [Angstrom-devel] RFC: Add ipkg to minimal image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2007 00:12:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> There is also helloworld-image, which I created to show a minimal
> Linux "system" consisting of kernel + "helloworld" application running
> as init./
> 
> For minimal, it depends on the MACHINE I would say, but the naming
> "minimal" is wrong. Minimal in what way?
> A machine which has a console should not need an SSH server in minimal image.
> 
> It would be wiser to indicate purpose ("console") instead of size ("minimal").
> 
> Maybe "headless" is a better name, for an image that has no input
> method, whereas "console" means "console-shell-access".

+1 from me.

-- Rod




