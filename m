Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 185CF601B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 12:40:20 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20160825124019884_0485
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 12:40:19 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=11212 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bctz5-0003Gc-NB for openembedded-devel@lists.openembedded.org;
	Thu, 25 Aug 2016 08:42:15 -0400
Date: Thu, 25 Aug 2016 08:40:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20160825120344.GA9349@mbabyjoh-desk.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.20.1608250839001.2113@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608250754420.31871@ca624034.mitel.com>
	<20160825120344.GA9349@mbabyjoh-desk.ger.corp.intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: WARNING: QA Issue: openjdk-8 rdepends on openjre-8, but it isn't a build dependency? [build-deps]
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
X-List-Received-Date: Thu, 25 Aug 2016 12:40:24 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Aug 2016, Maxin B. John wrote:

> Hi,
>
> On Thu, Aug 25, 2016 at 07:58:30AM -0400, Robert P. J. Day wrote:
> >
> >   while i'm getting the following QA warning with wind river linux 8,
> > i'm assuming the same would be happening with the standard meta-java
> > layer; if not, i apologize for posting to the wrong list.
> >
> >   is this something i should file at YP bugzilla? elsewhere?
>
> Is this still happening with the latest meta-java master branch ?

  i'm getting this with the latest RCPL of wind river linux; if you
give me a while, i can test with a generic configuration of OE -- it's
entirely possible that's not an issue using OE.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


