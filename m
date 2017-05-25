Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel2.indieserve.net (cpanel2.indieserve.net [199.212.143.6])
	by mail.openembedded.org (Postfix) with ESMTP id C82EE77FD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 20:38:46 +0000 (UTC)
Received: from cpec03f0ed08c7f-cm68b6fcf980b0.cpe.net.cable.rogers.com
	([174.118.92.171]:43270 helo=localhost.localdomain)
	by cpanel2.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1dDzWx-0003Il-Vz; Thu, 25 May 2017 16:38:48 -0400
Date: Thu, 25 May 2017 16:38:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Belisko Marek <marek.belisko@gmail.com>
In-Reply-To: <CAAfyv3517VgOHsPWRRHs2vdTr3hBt-dp+u=UGmwHZ+jdNh3sMw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1705251637150.5533@localhost.localdomain>
References: <alpine.LFD.2.20.1705250847490.19265@localhost.localdomain>
	<CAAfyv3517VgOHsPWRRHs2vdTr3hBt-dp+u=UGmwHZ+jdNh3sMw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel2.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel2.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel2.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: is there a reason meta-openembedded/meta contains a lonely libgpiod.bb recipe?
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
X-List-Received-Date: Thu, 25 May 2017 20:38:48 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 May 2017, Belisko Marek wrote:

> On Thu, May 25, 2017 at 9:10 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   is there some rationale for libgpiod.bb to be the lone recipe
> > under meta-openembedded/meta? would that recipe not fit into some
> > other layer?

> I posted few days ago recipe for libgpiod. Please look at:
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-May/112810.html

  but that doesn't really answer the question as to why that recipe
went into meta-openembedded/meta and not meta-openembedded/meta-oe.
even the subject refers to "meta-oe", so why was that recipe placed in
a directory named "meta"? was that perhaps a typo?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

