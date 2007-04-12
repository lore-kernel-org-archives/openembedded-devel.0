Received: from [66.249.82.234] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1Hc0qq-0004YP-L2
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2007 17:04:44 +0200
Received: by wx-out-0506.google.com with SMTP id t14so567503wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2007 08:04:43 -0700 (PDT)
Received: by 10.90.120.13 with SMTP id s13mr1810939agc.1176390283717;
	Thu, 12 Apr 2007 08:04:43 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id 38sm1278396nzf.2007.04.12.08.04.41;
	Thu, 12 Apr 2007 08:04:43 -0700 (PDT)
Date: Thu, 12 Apr 2007 18:04:52 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1139321028.20070412180452@gmail.com>
To: "Wenbin Zhang" <zhangwenbin@gmail.com>, 
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <31907941.20070411194246@gmail.com>
References: <78671ac40704100910n4da6d006icd80bf2449ed547b@mail.gmail.com>
	<31907941.20070411194246@gmail.com>
MIME-Version: 1.0
Subject: Re: errors while "bitbake opie-image" build
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
X-List-Received-Date: Thu, 12 Apr 2007 15:04:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Paul,

Wednesday, April 11, 2007, 7:42:46 PM, you wrote:

> Hello Wenbin,

> Tuesday, April 10, 2007, 7:10:32 PM, you wrote:

>> Hello, Guys,

>> I am using "bitbake opie-image" do OE compiling. But got lots of errors like
>> below.

> Make sure you follow http://www.linuxtogo.org/gowiki/OpieWithAngstrom
> .

[]

>   Recently, gcc was upgraded to 4.1.2. There's always chance that it
> broke C++ stuff again. I by now still didn't upgrade (just because I'm in
> the middle of application-level hacking, and don't want land burn
> under my feet). I'll try to check 4.1.2 during this week.

  Ok, so I rebuilt qte-mt, libopie2, and couple of apps using gcc
4.1.2, all works like a charm. So, just following instructions in URL
above should do the trick.


> []




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



