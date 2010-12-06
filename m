Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PPhjw-0005m8-NF
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 21:32:53 +0100
Received: from gandalf.denix.org ([unknown] [71.255.236.20])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LD000B5FWZD1GS1@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	06 Dec 2010 14:31:02 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DB23514AF64; Mon,
	06 Dec 2010 15:30:48 -0500 (EST)
Date: Mon, 06 Dec 2010 15:30:48 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101206203048.GA29253@denix.org>
References: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: poky@yoctoproject.org
Subject: Re: libcdaudio license issue
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
X-List-Received-Date: Mon, 06 Dec 2010 20:32:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Dec 06, 2010 at 08:48:28PM +0100, Frans Meulenbroeks wrote:
> I was checking libcdaudio for LICENSE info.
> recipe says GPL
> COPYING file is the GPLv2 one
> README file says:
> 
> libcdaudio is distributed under the GNU Library General Public
> License, included in this package under the top level source directory
> in the file COPYING
> 
> C files also mention LGPL. but say v2 or later
> 
> What to do with this in the LICENSE field? LGPLv2+ ?

Frans,

I'd agree that LGPLv2+ is a safe bet, especially since that's what is 
specified in the sources.

-- 
Denys


