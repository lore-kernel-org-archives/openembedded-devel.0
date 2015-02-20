Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id AD55A716CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 12:09:46 +0000 (UTC)
Received: from [99.240.204.5] (port=41581 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YOlNb-00085l-Lm; Fri, 20 Feb 2015 06:04:19 -0500
Date: Fri, 20 Feb 2015 06:04:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BB19F3C7-2950-4E41-BF62-70BFE4FB9C9B@gmail.com>
Message-ID: <alpine.LFD.2.11.1502200603100.28632@localhost>
References: <BB19F3C7-2950-4E41-BF62-70BFE4FB9C9B@gmail.com>
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
Cc: yocto <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openemebedded.org
Subject: Re: [yocto] [RFT] gcc 5.0 recipes available for testing
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
X-List-Received-Date: Fri, 20 Feb 2015 12:09:52 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 20 Feb 2015, Khem Raj wrote:

> Hi All
>
> Encouraged by help received on testing out glibc 2.21, now  I have put together OE recipes for gcc-5
>
> GCC 5.0 is in prerelease stage 4 ( open for regression and doc fixes only)
>
> https://gcc.gnu.org/ml/gcc/2015-01/msg00156.html
>
> The recipes are available here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-5.0
>
> you just need the topmost commit and then set
>
> GCCVERSION = "5.0"
> SDKGCCVERSION = "5.0"
>
> in local.conf

  i assume this new layer should be used *in place* of the current OE
layer for testing purposes?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

