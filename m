Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LaNHN-0007JM-36
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 05:46:25 +0100
Received: by rv-out-0708.google.com with SMTP id b17so832014rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 20:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=uJQd3+yzR+ieJzBZAPw1+diC/HL0a/TCL06owEqGtc4=;
	b=WGpTRx5buPYhiGSh8bXRRwC5W5Cns80jy1Zp4988wlc1/IhmVd8AUcSMbHrz7owfS+
	CfAzfxlcpAJPH2BOlsQNiEUW16Vv5ASpGI1pv3J+p1g+A2b17DAgQcRYlNVv4VUsV65r
	hggG65bs+bEr5KvjHXCK1JdNglfM1sdcS8dQ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TGYtlpAp43xbI1KYmS02jbrjg3kvGWYwgfqQpFLj541OVDdd+SwLD6Ax0WBGtl/5ab
	a9Xev7YvBKksaEJhUap6TUVvkLtL4F5JX2RJ3WaVvrBSAOXj1YShwwDSXkJwZvBqrpEL
	0AAHFIW279/x8tpwB7QijPrkg2euKJdRmmGTk=
Received: by 10.142.174.18 with SMTP id w18mr186466wfe.239.1235105041490;
	Thu, 19 Feb 2009 20:44:01 -0800 (PST)
Received: from gmail.com (adsl-71-146-30-62.dsl.pltn13.sbcglobal.net
	[71.146.30.62])
	by mx.google.com with ESMTPS id 30sm4292548wfg.34.2009.02.19.20.44.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Feb 2009 20:44:01 -0800 (PST)
Date: Thu, 19 Feb 2009 20:43:56 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090220044356.GA31015@gmail.com>
References: <20090215023549.92DE8E802F@amethyst.openembedded.net>
	<200902151921.39445.openembedded@haerwu.biz>
	<c384c5ea0902161127y3a2d7312j5cd9c6ceae304677@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0902161127y3a2d7312j5cd9c6ceae304677@mail.gmail.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: [oe-commits] Lynn Lin : Signed-off-by: Khem Raj	<raj.khem@gmail.com>
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Feb 2009 04:46:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/09 20:27), Leon Woestenberg wrote:
> Hello,
> 
> On Sun, Feb 15, 2009 at 7:21 PM, Marcin Juszkiewicz
> <openembedded@haerwu.biz> wrote:
> > On Sunday 15 of February 2009 03:35:49 GIT User account wrote:
> >> Author: Lynn Lin <lynn.lin@avocent.com>
> >> Date:   Sat Feb 14 18:35:07 2009 -0800
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>
> >> mini-httpd: New recipe.
> >
> > WTF? Please conform to CommitPolicy (first line is summary of commit).

Dont fret :).
Well in theory summary of commit could be adding new recipe. What were
you expecting in first line for a new recipe.

However I think I could have provided more lines with a bit more details.

> >
> Please watch your language. I know the choice of abbreviation isn't
> meant to be rude, but that doesn't rectify it.
> 
> This might be Khem re-using his existing work flow and tools for
> handling patches.
> 
> Khem, could you pls adapt your workflow a bit; we like our commit msg
> in a certain manner; see wiki CommitPolicy.\

yes. I will.

> 

> Thanks,
> -- 
> Leon
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


