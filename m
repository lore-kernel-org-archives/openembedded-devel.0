Received: from [64.233.162.233] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HXH9u-0004BN-Fz
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Mar 2007 15:28:50 +0200
Received: by nz-out-0506.google.com with SMTP id m22so378691nzf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2007 06:28:49 -0700 (PDT)
Received: by 10.65.254.5 with SMTP id g5mr3969960qbs.1175261329269;
	Fri, 30 Mar 2007 06:28:49 -0700 (PDT)
Received: from cube ( [77.123.185.1])
	by mx.google.com with ESMTP id c1sm3031263nzd.2007.03.30.06.28.48;
	Fri, 30 Mar 2007 06:28:49 -0700 (PDT)
Date: Fri, 30 Mar 2007 16:28:51 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <474904993.20070330162851@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1175248200.5822.3.camel@localhost.localdomain>
References: <18310385162.20070330115222@gmail.com>
	<1175248200.5822.3.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: [RFC] Solving ipkg-utils issues
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
X-List-Received-Date: Fri, 30 Mar 2007 13:28:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Friday, March 30, 2007, 12:50:00 PM, you wrote:

> Hi Paul,

> Thanks for looking at this, its something that does need fixing.

[]
>>
>> 1. Broken version comparison logic in ipkg-utils (note that this is
>> exactly ipkg-utils issues, nether bitbake nor ipkg is affected).
>> 
[]
>>
>>   Patch for p.1 is here: http://bugs.openembedded.org/show_bug.cgi?id=2061

> I agree with fixing all the above. I've only had a quick glance at the
> actual patch but I'm fine with committing it and getting testing that
> way. There is python version comparison code in bitbake which may or may
> not be of use.

  Ok, thanks. I'll commit (cleaned up version of) it on weekend then,
after more people get chance to read this thread and be in loop.
  
[]

> Cheers,

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



