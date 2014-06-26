Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 42974601A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 23:55:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7S000I1VS1G930@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	26 Jun 2014 18:55:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E66B72018D; Thu,
	26 Jun 2014 19:55:12 -0400 (EDT)
Date: Thu, 26 Jun 2014 19:55:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140626235512.GJ1580@denix.org>
References: <20140625185504.GD1580@denix.org>
	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
	<53AB5ADB.3080403@balister.org>
	<CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>
	<20140626180954.GG1580@denix.org>
	<CAK8F28kHj_JJh84XWcVt7wy2p70BvpV+WCF4n2r1=FWrRQT8cQ@mail.gmail.com>
	<53AC7457.3030103@balister.org>
	<CAK8F28neQBPbxdfcMGoZ-tyxb1CNoAVO_KC3GDO6tzTjaTpLJg@mail.gmail.com>
	<20140626234324.GH1580@denix.org> <53ACB0C9.9040806@balister.org>
MIME-version: 1.0
In-reply-to: <53ACB0C9.9040806@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Thu, 26 Jun 2014 23:55:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jun 26, 2014 at 04:46:17PM -0700, Philip Balister wrote:
> On 06/26/2014 04:43 PM, Denys Dmytriyenko wrote:
> > On Thu, Jun 26, 2014 at 01:12:41PM -0700, Ash Charles wrote:
> >> On Thu, Jun 26, 2014 at 12:28 PM, Philip Balister <philip@balister.org> wrote:
> >>> Ones with a really ancient MLO, I think. Hopefully, all of those
> >>> binaries are gone from the Internet now.
> >>>
> >>> Philip
> >>
> >> Excellent---thanks.  I had assumed this was boot ROM dependent, not
> >> MLO dependent!
> > 
> > It is BootROM, not MLO...
> > 
> 
> How old are these parts? I'm assuming they are not easily found in the
> wild anymore.

OMAP35xx (3503/3530) was released in 2008, which was a respin of mobile 
OMAP34xx, and was used in Classic BeagleBoard...

http://en.wikipedia.org/wiki/BeagleBoard

-- 
Denys

