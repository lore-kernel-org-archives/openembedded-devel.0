Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1M3t8O-0004i8-Fb
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 16:39:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4CEWTHK023418
	for <openembedded-devel@openembedded.org>;
	Tue, 12 May 2009 15:32:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23263-03 for <openembedded-devel@openembedded.org>;
	Tue, 12 May 2009 15:32:24 +0100 (BST)
Received: from [192.168.1.30] (dynamic0.rpnet.com [192.168.1.30])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n4CEWL4l023412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 12 May 2009 15:32:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <be7a9f3d0905111711r77d0230eif76b4551d3f05c2c@mail.gmail.com>
References: <4A07EE70.2010408@gmx.net>
	<200905111619.42187.marcin@juszkiewicz.com.pl>
	<1242081458.5824.37.camel@ted>
	<be7a9f3d0905111711r77d0230eif76b4551d3f05c2c@mail.gmail.com>
Date: Tue, 12 May 2009 15:32:20 +0100
Message-Id: <1242138740.5824.41.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: python 2.6 warning
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
X-List-Received-Date: Tue, 12 May 2009 14:39:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-11 at 21:11 -0300, Otavio Salvador wrote:
> On Mon, May 11, 2009 at 7:37 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > I've backported it to bitbake 1.8 and it seems to work along with
> > merging a number of fixes lurking in Poky.
> 
> Please push the attached fix too.

Committed, thanks.

(after discussion on irc about why it was needed).

Can people please at least cc the bitbake list on bitbake patches as it
will increase the chances of me seeing them.

Cheers,

Richard



