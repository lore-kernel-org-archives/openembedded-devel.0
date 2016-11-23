Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id EB96C71A79
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 22:28:05 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161123222805835_0685
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 14:28:05 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.118.92.171] (port=38888 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c9g1H-0003lq-P3 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2016 17:27:59 -0500
Date: Wed, 23 Nov 2016 17:26:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <04A98AEA-497D-4919-B83E-27C442F24FB9@gmail.com>
Message-ID: <alpine.LFD.2.20.1611231725430.20812@localhost.localdomain>
References: <alpine.LFD.2.20.1611231326510.15876@localhost.localdomain>
	<5E80B6DC-66EC-499B-84D0-41A5D4F1A1BC@gmail.com>
	<alpine.LFD.2.20.1611231624420.18557@localhost.localdomain>
	<04A98AEA-497D-4919-B83E-27C442F24FB9@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: mozjs/unhandled signal 11/64k page patch/__powerpc64__ ???
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
X-List-Received-Date: Wed, 23 Nov 2016 22:28:07 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Nov 2016, Khem Raj wrote:

>
> > On Nov 23, 2016, at 1:26 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > On Wed, 23 Nov 2016, Khem Raj wrote:
> >
> >> can you reproduce it on version 24 as well ?
> >
> >  not sure what you mean ... this is running on a qemuppc image. i
> > haven't tried running this on fedora 24 itself. what exactly do you
> > want me to try?
> >
>
> I meant version of mozjs

  this is version 17.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


