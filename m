Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 91A0960043
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 01:30:11 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI001PIMUBMOO0@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2015 20:30:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=A7bb5BSD c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10	a=sozttTNsAAAA:8
	a=zQAzSviqVL2dFWNcUesA:9 a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B219C2016F; Wed,
	8 Apr 2015 21:30:11 -0400 (EDT)
Date: Wed, 08 Apr 2015 21:30:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20150409013011.GP6952@denix.org>
References: <1428518576-11800-1-git-send-email-denis@denix.org>
	<CAP9ODKqy+EVbMrYG44jfQbCSHcca8qB6CKQdZJutm-YQjtUp=Q@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKqy+EVbMrYG44jfQbCSHcca8qB6CKQdZJutm-YQjtUp=Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 1/2] serialcheck: add version 1.0.0
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
X-List-Received-Date: Thu, 09 Apr 2015 01:30:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 08, 2015 at 06:34:45PM -0300, Otavio Salvador wrote:
> Hello Denys,
> 
> On Wed, Apr 8, 2015 at 3:42 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> There are some things I see as possible improvements:
> 
>  - a long commit log which says what is the use case for the tool
>  - fix homepage to the right cgit URL
>  - add Upstream-Status field in the two included patches (btw, it
> would be good to send them for inclusion)
>  - add nativesdk support as it is useful for SDK deployment so it can
> be used for board test

Thanks, please see the updated v2 of the patchset.

-- 
Denys

