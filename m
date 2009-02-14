Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1LYB1t-00080A-QK
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Feb 2009 04:17:21 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 922B9294279
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 22:15:51 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 13 Feb 2009 22:15:51 -0500
X-Sasl-enc: Pxn/dq1flTSK7eXZgInq8qpI2VU3A29LTAadtEhdBroE 1234581351
Received: from [192.168.1.11] (CPE-121-209-18-212.sa.bigpond.net.au
	[121.209.18.212])
	by mail.messagingengine.com (Postfix) with ESMTPSA id D73873191D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 22:15:50 -0500 (EST)
Message-ID: <4996375F.6080105@whitby.id.au>
Date: Sat, 14 Feb 2009 13:45:43 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.19 (Windows/20081209)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1234527428.24574.2.camel@EPBYMINW0568>
In-Reply-To: <1234527428.24574.2.camel@EPBYMINW0568>
X-Enigmail-Version: 0.95.7
Subject: Re: [PATCH] Fixed ruby 1.8.5 compilation problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Feb 2009 03:17:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ihar Hrachyshka wrote:
> Backported openssl fix from 1.8.7 for successfull ruby 1.8.5
> compilation.
> 
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>

Applied to org.openembedded.dev and fso/milestone5.

Tested on fso/milestone5.

[Used patchwork to get the mbox to apply with git-am, and git commit
--amend to edit the commit message to match policy.]

-- Rod


