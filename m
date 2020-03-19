Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id D154960FEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 19:12:36 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:33196 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jF0ar-00CzPO-DS; Thu, 19 Mar 2020 15:12:37 -0400
Date: Thu, 19 Mar 2020 15:12:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Ross Burton <ross@burtonini.com>
In-Reply-To: <ba526e90-ccd7-04e2-5907-026b754a2da0@burtonini.com>
Message-ID: <alpine.LFD.2.21.2003191511320.3869@localhost.localdomain>
References: <alpine.LFD.2.21.2003190907590.10468@localhost.localdomain>
	<20200319134213.GA29515@localhost>
	<alpine.LFD.2.21.2003191302490.458222@localhost.localdomain>
	<20200319173223.GC29515@localhost>
	<ba526e90-ccd7-04e2-5907-026b754a2da0@burtonini.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: proper way to report(?) conflicting files being installed?
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
X-List-Received-Date: Thu, 19 Mar 2020 19:12:38 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Mar 2020, Ross Burton wrote:

> On 19/03/2020 17:32, Adrian Bunk wrote:
> >>    this does seem backwards ... if both gnome-common and
> >> autoconf-archive currently try to install those two m4-related files,
> >> doing the above pretty much *assures* an installation conflict,
> >> ...
> >
> > No, --with-autoconf-archive makes gnome-common not install the
> > conflicting files.
>
> I should point out that gnome-common is dead upstream and mostly
> unused now, so if you find a recipe using it do check that it is
> actually needed.

  in fact, just earlier this aft, i sent the short note, "um ...
what are you doing that needs that gnome-common thing?"

  i await the reply.

rday

