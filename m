Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1UFcOW-0004aB-Ri
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 04:30:30 +0100
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2D3DhpH003051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2013 20:13:44 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1UFc8N-0004po-9d
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Mar 2013 23:13:43 -0400
Date: Tue, 12 Mar 2013 23:13:43 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313031343.GA18570@windriver.com>
References: <20130312211938.GA11498@windriver.com>
	<4C920E00-4E5F-47FF-9DB5-FCE7AE02E08B@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4C920E00-4E5F-47FF-9DB5-FCE7AE02E08B@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: question on App bitsize - need the same as the kernel (multilib situation)
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
X-List-Received-Date: Wed, 13 Mar 2013 03:30:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It may be a combination of kernel ppc64 + userspace ppc (32);
or kernel x86-64 + userspace x86-32.

On Tue, Mar 12, 2013 at 03:41:29PM -0700, Khem Raj wrote:
> 
> On Mar 12, 2013, at 2:19 PM, Amy Fong <amy.fong@windriver.com> wrote:
> 
> > I need to build an application that has the same bitsize as the kernel. But in
> > my multilib configuration, the default usersapce bitsize is not the same as 
> > the kernel's bitsize. How do you do this?
> 
> which arch is this ?
> since generally we have one in multilib combo that matches kernel bit size
> but you might have left it out. 
> 
> > 
> > Thanks!
> > Amy
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


