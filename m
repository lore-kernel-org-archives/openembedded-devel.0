Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 5974560CFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 23:50:13 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7S00JC8VJNIRQ0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	26 Jun 2014 18:50:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1D5032018D; Thu,
	26 Jun 2014 19:50:11 -0400 (EDT)
Date: Thu, 26 Jun 2014 19:50:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140626235010.GI1580@denix.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org> <20140625185504.GD1580@denix.org>
	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
	<53AB5ADB.3080403@balister.org>
	<CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>
	<20140626180954.GG1580@denix.org>
	<CAK8F28kHj_JJh84XWcVt7wy2p70BvpV+WCF4n2r1=FWrRQT8cQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAK8F28kHj_JJh84XWcVt7wy2p70BvpV+WCF4n2r1=FWrRQT8cQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Jun 2014 23:50:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jun 26, 2014 at 12:23:35PM -0700, Ash Charles wrote:
> On Thu, Jun 26, 2014 at 11:09 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > "CHS business", as Philip called it, was only partially required in the early
> > days of OMAP3 SoCs few years ago, due to some "specific" FAT implementation of
> > the BootROM. These days it's not required on modern Sitara SoCs.
> Which OMAP3 SOCs need the CHS business?

Definitely OMAP34xx/35xx family. I'm not very sure if OMAP36xx/37xx had a 
fixed BootROM already, but probably it had, as Beagleboard xM was much more 
forgiving to SD card format, IIRC...

-- 
Denys

