Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MATcn-000888-RY
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 20:49:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id AFE964C95DA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 14:41:12 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19429-09 for <openembedded-devel@lists.openembedded.org>; 
	Sat, 30 May 2009 14:41:12 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 8BC4C4C86D3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 14:41:12 -0400 (EDT)
Date: Sat, 30 May 2009 14:41:12 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090530164513.GH23842@smtp.west.cox.net>
Message-ID: <Pine.LNX.4.64.0905301437110.27204@juice.ott.cti.com>
References: <1243535051-10168-1-git-send-email-msmith@cbnco.com>
	<1243535051-10168-2-git-send-email-msmith@cbnco.com>
	<20090530164513.GH23842@smtp.west.cox.net>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] vim: be an alternative to /bin/vi; switch to	INC_PR
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
X-List-Received-Date: Sat, 30 May 2009 18:49:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 30 May 2009, Tom Rini wrote:

> On Thu, May 28, 2009 at 02:24:11PM -0400, Michael Smith wrote:
> >  DEPENDS += "gtk+ xt"
> > -PR = "r1"
> > +PR = "${INC_PR}.1"
> >  FILESPATHPKG =. "vim-${PV}:vim:"
> 
> The FILESPATHPKG change here hasn't been submitted yet :)

Oops, that was sloppy on my part -- would you mind trying to am again now 
that the FILESPATHPKG series is applied? This is the URL:

http://patchwork.openembedded.org/patch/655/mbox/

(thanks for applying that series, btw)

Mike


