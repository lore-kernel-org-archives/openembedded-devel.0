Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8B75C731DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 02:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5606620A37;
	Wed, 14 Dec 2016 02:25:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id U13AwHIbNe9o; Wed, 14 Dec 2016 02:25:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3665F204AF;
	Wed, 14 Dec 2016 02:25:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A95651621D8; Tue, 13 Dec 2016 21:25:00 -0500 (EST)
Date: Tue, 13 Dec 2016 21:25:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20161214022500.GE30576@denix.org>
References: <1477587755-24666-1-git-send-email-denis@denix.org>
	<271f87f6-ac90-2389-3499-9c3bb8d80fa6@gmail.com>
	<20161114190940.GB22657@denix.org>
	<20161117035859.GB26131@denix.org>
	<af58f301-6a21-6f9b-3c87-26fa8d44935b@gmail.com>
	<20161207174015.GC30576@denix.org>
	<8248cf6d-4dd5-debc-78fc-47987411b660@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8248cf6d-4dd5-debc-78fc-47987411b660@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][krogoth][PATCH] syslog-ng: expand service file @variables@ earlier
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Dec 2016 02:25:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 12, 2016 at 07:55:40PM -0800, akuster808 wrote:
> Denys,
> 
> 
> 
> On 12/07/2016 09:40 AM, Denys Dmytriyenko wrote:
> >On Fri, Nov 18, 2016 at 07:25:48AM -0800, akuster808 wrote:
> >>
> >>On 11/16/2016 07:58 PM, Denys Dmytriyenko wrote:
> >>>On Mon, Nov 14, 2016 at 02:09:40PM -0500, Denys Dmytriyenko wrote:
> >>>>On Thu, Nov 03, 2016 at 08:20:53AM -0700, akuster808 wrote:
> >>>>>On 10/27/2016 10:02 AM, Denys Dmytriyenko wrote:
> >>>>>>From: Ian Ray <ian.ray@ge.com>
> >>>>>>
> >>>>>>Move variable expansion of @SBINDIR@, @LOCALSTATEDIR@, and @BASEBINDIR@
> >>>>>>earlier during install, to before the systemd service file is installed
> >>>>>>by an automake rule.
> >>>>>>
> >>>>>>Signed-off-by: Ian Ray <ian.ray@ge.com>
> >>>>>>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>>>>merged to staging.
> >>>>Armin,
> >>>>
> >>>>Any updates on this? Also, I don't see it in krogoth-next - what staging you
> >>>>are referring to?
> >>>Ping again, this time copy Armin directly.
> >>oops, Had it sitting on my system forgot to push to contrib. Pull
> >>request sent.
> >Armin,
> >
> >Thanks, this hasn't been merged yet, it appears... Any ETA?
> 
> is this the commit you are looking for?
> http://cgit.openembedded.org/meta-openembedded/commit/?h=krogoth&id=5882ba7f378acc75385e8a3ab00a6bdbc7a0ef93

Yeah, I saw it merged few days ago, thanks!

-- 
Denys

