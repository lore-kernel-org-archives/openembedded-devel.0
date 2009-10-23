Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N1QKC-0002ir-B7
	for openembedded-devel@openembedded.org; Fri, 23 Oct 2009 22:01:27 +0200
Received: (qmail 18000 invoked by uid 1003); 23 Oct 2009 20:00:21 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Oct 2009 20:00:21 -0000
Message-ID: <4AE20B53.1040102@balister.org>
Date: Fri, 23 Oct 2009 16:00:19 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <381446.79903.qm@web53903.mail.re2.yahoo.com>
	<20091023195408.GC28604@denix.org>
In-Reply-To: <20091023195408.GC28604@denix.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: omap3-console-image broken?
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
X-List-Received-Date: Fri, 23 Oct 2009 20:01:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2009 03:54 PM, Denys Dmytriyenko wrote:
> On Fri, Oct 23, 2009 at 12:30:23PM -0700, Charlie Woloszynski wrote:
>> I am trying to build an omap3-console-image, but i get the following error.
>>
>> I have done a 'git pull' for org.openembedded.dev this morning
>>
>>
>> NOTE: Running task 1038 of 4072 (ID: 1010, /home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb, do_fetch)
>> fatal: Not a git repository
>> NOTE: Task failed: Fetch failed: Fetch command export HOME=/home/charlie; export PATH=/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/bin/overo-angstrom-linux-gnueabi:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/sbin:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/bin:/home/charlie/pixhawk.oe/tmp/cross/armv7a/bin:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/sbin:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/bin:/home/charlie/pixhawk.oe/bitbake/bin:/home/charlie/pixhawk.oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git fetch git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git master failed with signal 128, output:
>> fatal: Not a git repository
>>
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb do_fetch failed
>> ERROR: Task 1010 (/home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb, do_fetch) failed
>> NOTE: Tasks Summary: Attempted 1037 tasks of which 1032 didn't need to be rerun and 1 failed.
>> ERROR: '/home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb' failed
>>
>> Any ideas on how to address this?
>
> Wrong list?
>
> There seems to be no omap3-console-image nor linux-omap3 recipes in OE...

Try the gumstix list :)

Philip


