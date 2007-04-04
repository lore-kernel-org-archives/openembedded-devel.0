Received: from [64.233.162.227] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HZ4ke-00089F-J5
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2007 14:38:12 +0200
Received: by nz-out-0506.google.com with SMTP id m22so75116nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2007 05:38:11 -0700 (PDT)
Received: by 10.64.249.18 with SMTP id w18mr1244432qbh.1175690291536;
	Wed, 04 Apr 2007 05:38:11 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id j4sm868142nzd.2007.04.04.05.38.10;
	Wed, 04 Apr 2007 05:38:11 -0700 (PDT)
Date: Wed, 4 Apr 2007 15:38:15 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <612419699.20070404153815@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <474904993.20070330162851@gmail.com>
References: <18310385162.20070330115222@gmail.com>
	<1175248200.5822.3.camel@localhost.localdomain>
	<474904993.20070330162851@gmail.com>
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
X-List-Received-Date: Wed, 04 Apr 2007 12:38:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

Friday, March 30, 2007, 4:28:51 PM, you wrote:

> Hello Richard,

> Friday, March 30, 2007, 12:50:00 PM, you wrote:

>> Hi Paul,

>> Thanks for looking at this, its something that does need fixing.

> []
>>>
>>> 1. Broken version comparison logic in ipkg-utils (note that this is
>>> exactly ipkg-utils issues, nether bitbake nor ipkg is affected).
>>> 
> []
>>>
>>>   Patch for p.1 is here: http://bugs.openembedded.org/show_bug.cgi?id=2061

>> I agree with fixing all the above. I've only had a quick glance at the
>> actual patch but I'm fine with committing it and getting testing that
>> way. There is python version comparison code in bitbake which may or may
>> not be of use.

>   Ok, thanks. I'll commit (cleaned up version of) it on weekend then,
> after more people get chance to read this thread and be in loop.

  Ok, committed finally.

  Please reopen http://bugs.openembedded.org/show_bug.cgi?id=2061 if
you face any issues.

>   
> []

>> Cheers,

>> Richard






-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



