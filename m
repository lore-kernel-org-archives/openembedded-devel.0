Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Kz2Ck-0003Lo-Aw
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 05:47:18 +0100
Received: from gandalf.denix.org ([71.255.226.167]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KA100N0IRRT2YB6@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	08 Nov 2008 21:45:30 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8789B6B83B5; Sat,
	08 Nov 2008 22:45:29 -0500 (EST)
Date: Sat, 08 Nov 2008 22:45:29 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <c384c5ea0811081134t2119fb80r1e316c8e2dec883b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081109034529.GA14320@denix.org>
MIME-version: 1.0
References: <20081103202204.GA11663@denix.org>
	<20081106231034.GA32229@denix.org>
	<c384c5ea0811081134t2119fb80r1e316c8e2dec883b@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [RFC] glibc fails with -march=i686 or pentiumpro or	pentium3
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
X-List-Received-Date: Sun, 09 Nov 2008 04:47:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Nov 08, 2008 at 08:34:26PM +0100, Leon Woestenberg wrote:
> Hello,
> 
> On Fri, Nov 7, 2008 at 12:10 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Mon, Nov 03, 2008 at 03:22:04PM -0500, Denys Dmytriyenko wrote:
> >> glibc fails with -march=i686 or pentiumpro or pentium3 - it's a known issue
> > Any comments for the patch? Can somebody please push it in? Thanks.
> >
> 
> In the bug tracker Khem Raj confirms he committed this:
> http://bugs.openembedded.net/show_bug.cgi?id=4798
> 
> Could you verify it works and close the bug?
> 
> Thanks both to Khem and you!

Leon,

It has already been done. Thanks.

-- 
Denys


