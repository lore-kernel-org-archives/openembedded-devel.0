Received: from [72.14.204.225] (helo=qb-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JS1Gy-0005Ls-70
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2008 03:35:02 +0100
Received: by qb-out-0506.google.com with SMTP id p30so3561937qba.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2008 18:34:54 -0800 (PST)
Received: by 10.141.34.12 with SMTP id m12mr6312836rvj.26.1203561294212;
	Wed, 20 Feb 2008 18:34:54 -0800 (PST)
Received: from ?192.168.1.129? ( [71.16.230.132])
	by mx.google.com with ESMTPS id h17sm1343037wxd.24.2008.02.20.18.34.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Feb 2008 18:34:52 -0800 (PST)
Message-ID: <47BCE343.7060600@gmail.com>
Date: Wed, 20 Feb 2008 21:34:43 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1JRbhB-0000nu-DN@linuxtogo.org>	<20080220015817.1e33f547@widy.localdomain>	<20080220020418.1e4dda5a@widy.localdomain>	<1203502545.6860.13.camel@hammer.suse.cz>
	<20080220155339.67aed5d4@widy.localdomain>
In-Reply-To: <20080220155339.67aed5d4@widy.localdomain>
X-SA-Exim-Connect-IP: 72.14.204.225
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] org.oe.dev - Ignore false toggle signals (work-around for OE#3390).
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2008 02:35:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2008 08:53 AM, Paul Sokolovsky wrote:
> It practice that means that developers should annotate the bug with
> "pushed to .dev", "RFCed for merging to stable", "pushed to stable",
> and ultimately, "package in feed, closing".

I prefer this approach to opening a separate dup ticket. If we can 
streamline the process of "RFCed for merging to stable" and "package in 
feed", we only need the "pushed to .dev" and/or "pushed to stable" as 
sufficient landmarks for closing a bug.

IMHO, whatever definition for closing a bug is not that much a big deal. 
Instead we should focus on how to streamline the process of getting 
fixes from .dev --->  feed.

Regards
Gordon



