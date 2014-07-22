Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id B511465E08
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 13:22:19 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140722132218777
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 13:22:18 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [64.102.254.33] (port=10488 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X9a1F-0006vs-Cq; Tue, 22 Jul 2014 09:22:13 -0400
Date: Tue, 22 Jul 2014 09:22:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <53CE64C9.2010402@linaro.org>
Message-ID: <alpine.LFD.2.11.1407220921230.4203@localhost>
References: <alpine.LFD.2.11.1407130915280.31826@localhost>
	<3072899.OS8yJTfGtp@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1407140804360.29952@localhost>
	<28111309.Fiim3rPSbe@peggleto-mobl5.ger.corp.intel.com>
	<53CE64C9.2010402@linaro.org>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: overriding tasks with EXPORT_FUNCTIONS
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
X-List-Received-Date: Tue, 22 Jul 2014 13:22:21 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 22 Jul 2014, Trevor Woerner wrote:

> On 07/14/14 08:26, Paul Eggleton wrote:
> > Unfortunately as far as the BitBake manual is concerned, it pretty
> > much has to be abstract. Remember that there are no base
> > implementations of any task functions in BitBake itself; the ones
> > you refer to are in OE's base.bbclass.
>
> In reality there are only about 2 people on the whole planet for
> whom that distinction is important :-)

  i should point out that fetching is defined in bitbake, while
everything else is in oe-core. just being difficult. :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


