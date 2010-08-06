Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OhJnT-0006q3-7m
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 12:05:04 +0200
Received: from [100.100.100.68] (unknown [83.150.95.26])
	by smtp-68.nebula.fi (Postfix) with ESMTP id 6C1FB43F1DBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Aug 2010 13:04:55 +0300 (EEST)
Message-ID: <4C5BDE5B.3050008@dcombus.com>
Date: Fri, 06 Aug 2010 13:05:15 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>	<1280926084-7605-1-git-send-email-henri.bragge@dcombus.com>	<AANLkTinnz+cB5Au1hMsniwFbCSjo-EaNWoR=9Xae4krA@mail.gmail.com>	<loom.20100805T104704-558@post.gmane.org>	<AANLkTik=13a7k7D1n=VfJnqO5DdPy5PUVdLdnDHtZh1d@mail.gmail.com>	<AANLkTim41rfG5eqwrEu5goiqFZqhZK3XY2Pq=shdANTU@mail.gmail.com>
	<AANLkTincP+hP1RSsA+u5+HQ3xKLFgDkt7x4R-hN3kOsP@mail.gmail.com>
In-Reply-To: <AANLkTincP+hP1RSsA+u5+HQ3xKLFgDkt7x4R-hN3kOsP@mail.gmail.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Fri, 06 Aug 2010 10:05:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/8/5 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>   
>> This one also failed building with a similar QA issue:
>>
>> NOTE: Running task 629 of 630 (ID: 10,
>> /home/frans/oe/openembedded/recipes/gsnmp/gsnmp_0.3.0.bb,
>> do_qa_staging)
>> ERROR: QA Issue with staging: libexslt.pc failed sanity test (tmpdir)
>> in path /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
>> ERROR: QA Issue with staging: libxslt.pc failed sanity test (tmpdir)
>> in path /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
>> ERROR: QA staging was broken by the package built above
>>
>>
>> see http://tinderbox.openembedded.net/builds/81312
>>
>> No idea how exactly to fix this.
>>
>> Frans
>>
>>     
> Please disregard ths comment and the one on the other recipe.
> Apparently some other recipe (libxslt) left a faulty pc file in pkgconfig.
> That is something that needs to be repaired (although I woudl not know
> how), but does not affect your recipe.
>
> Your recipes have been tested, build nicely and have been pushed.
> Thank you for your contribution, and again apologies for any
> inconvenience caused by the above mail)
>   

No harm done, I suspected it was someone else's fault this time. Thanks 
for testing & comments.

- Henri


