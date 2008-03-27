Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1Jegiu-000547-Bs
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 02:16:08 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 45FD7E0CC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2008 21:16:07 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 26 Mar 2008 21:16:07 -0400
X-Sasl-enc: TRpOw9naFBgDgm/ngTTkW6caPuRM/C4vNHfzPAjQ7C2+ 1206580566
Received: from [192.168.124.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 09CD3A674
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2008 21:16:05 -0400 (EDT)
Message-ID: <47EAF551.4030602@whitby.id.au>
Date: Thu, 27 Mar 2008 11:46:01 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47EAEB1D.9060004@xora.org.uk>
	<200803270150.46085.mickey@vanille-media.de>
In-Reply-To: <200803270150.46085.mickey@vanille-media.de>
Subject: Re: SCM scorecards
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
X-List-Received-Date: Thu, 27 Mar 2008 01:16:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
>> Ease of Serving Git 1 Monotone 5
> 
> That bad?

We should split that into ease of read-only serving, where git gets a 5 
(a http directory is all you need), and ease of read-write serving, 
where 1 is probably a bit harsh (I would say 3, since you need to add 
user accounts with a restricted shell to the Xen instance that you've 
specially set up to run the git server):

http://www.kernel.org/pub/software/scm/git/docs/everyday.html#Repository%20Administration
http://www.itp.tuwien.ac.at/~mattems/blog/2006/07/17#git_server_setup

-- Rod


