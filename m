Received: from [64.62.194.115] (helo=netgate.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jim@netgate.com>)
	id 1HH1ZK-0007n9-U6; Tue, 13 Feb 2007 18:35:55 +0100
Received: from [192.168.10.30] (nv-65-40-157-21.sta.embarqhsd.net
	[65.40.157.21]) by netgate.com (Postfix) with ESMTP id D9258280065;
	Tue, 13 Feb 2007 09:35:53 -0800 (PST)
In-Reply-To: <20070213162241.0D5934000BC@tinman.treke.net>
References: <20070213162241.0D5934000BC@tinman.treke.net>
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <BB29C5DE-1AC7-4361-85AD-D80044C2F467@netgate.com>
From: Jim Thompson <jim@netgate.com>
Date: Tue, 13 Feb 2007 07:35:38 -1000
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Cc: openembedded-issues@lists.openembedded.org
Subject: Re: [oe-issues] [Bug 1848] hostap-utils build fails
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
X-List-Received-Date: Tue, 13 Feb 2007 17:35:55 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit

There was a problem, but I had Jouni fix it.

Jim

Begin forwarded message:
> From: Jouni Malinen <jkmaline@cc.hut.fi>
> Date: February 10, 2007 8:08:16 AM HST
> To: Jim Thompson <jim@netgate.com>
> Subject: Re: hostap-utils packages missing?
>
> On Sat, Feb 10, 2007 at 06:55:16AM -1000, Jim Thompson wrote:
>
>> 35:~ jim$ curl http://hostap.epitest.fi/releases/hostap-
>> utils-0.4.7.tar.gz
>> <HTML><HEAD><TITLE>404 Not Found</TITLE></HEAD>
>
> Fixed. hostap.epitest.fi is running on a temporary "server" with very
> limited file set at the moment and I had forgotten to copy this file.
>
> --  
> Jouni Malinen                                            PGP id  
> EFC895FA


On Feb 13, 2007, at 6:22 AM, bugzilla-daemon@tinman.treke.net wrote:

> http://bugs.openembedded.org/show_bug.cgi?id=1848
>
>
> openembedded@hrw.one.pl changed:
>
>            What    |Removed                     |Added
> ---------------------------------------------------------------------- 
> ------
>              Status|NEW                         |RESOLVED
>          Resolution|                            |INVALID
>
>
>
>
> ------- Comment #4 from openembedded@hrw.one.pl  2007-02-13 08:22  
> -------
> NOTE: package hostap-utils-0.4.0-r3: task do_fetch: started
> NOTE: fetch http://hostap.epitest.fi/releases/hostap- 
> utils-0.4.0.tar.gz
> --17:16:44--  http://hostap.epitest.fi/releases/hostap- 
> utils-0.4.0.tar.gz
>            => `/home/hrw/devel/sources/dl_dir/hostap- 
> utils-0.4.0.tar.gz'
> Resolving hostap.epitest.fi... 204.152.186.63
> Connecting to hostap.epitest.fi|204.152.186.63|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 60,495 (59K) [application/x-tar]
>
> 100% 
> [===================================================================== 
> ==>]
> 60,495        43.37K/s
>
> 17:16:46 (43.25 KB/s) -
> `/home/hrw/devel/sources/dl_dir/hostap-utils-0.4.0.tar.gz' saved  
> [60495/60495]
>
> NOTE: package hostap-utils-0.4.0-r3: task do_fetch: completed
> NOTE: package hostap-utils-0.4.7-r4: task do_fetch: started
> NOTE: fetch http://hostap.epitest.fi/releases/hostap- 
> utils-0.4.7.tar.gz
> --17:17:01--  http://hostap.epitest.fi/releases/hostap- 
> utils-0.4.7.tar.gz
>            => `/home/hrw/devel/sources/dl_dir/hostap- 
> utils-0.4.7.tar.gz'
> Resolving hostap.epitest.fi... 204.152.186.63
> Connecting to hostap.epitest.fi|204.152.186.63|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 60,782 (59K) [application/x-tar]
>
> 100% 
> [===================================================================== 
> ==>]
> 60,782        22.06K/s
>
> 17:17:05 (22.00 KB/s) -
> `/home/hrw/devel/sources/dl_dir/hostap-utils-0.4.7.tar.gz' saved  
> [60782/60782]
>
> NOTE: package hostap-utils-0.4.7-r4: task do_fetch: completed
> NOTE: package hostap-utils-0.3.7-r4: task do_fetch: started
> NOTE: fetch http://hostap.epitest.fi/releases/hostap- 
> utils-0.3.7.tar.gz
> --17:17:10--  http://hostap.epitest.fi/releases/hostap- 
> utils-0.3.7.tar.gz
>            => `/home/hrw/devel/sources/dl_dir/hostap- 
> utils-0.3.7.tar.gz'
> Resolving hostap.epitest.fi... 204.152.186.63
> Connecting to hostap.epitest.fi|204.152.186.63|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 59,659 (58K) [application/x-tar]
>
> 100% 
> [===================================================================== 
> ==>]
> 59,659        40.76K/s
>
> 17:17:12 (40.65 KB/s) -
> `/home/hrw/devel/sources/dl_dir/hostap-utils-0.3.7.tar.gz' saved  
> [59659/59659]
>
> NOTE: package hostap-utils-0.3.7-r4: task do_fetch: completed
>
> Closing as INVALID - all releases are fetchable. Problem must be on  
> reported
> side.
>
>
> -- 
> Configure bugmail: http://bugs.openembedded.org/userprefs.cgi? 
> tab=email
> ------- You are receiving this mail because: -------
> You are the assignee for the bug, or are watching the assignee.
>
> _______________________________________________
> Openembedded-issues mailing list
> Openembedded-issues@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded- 
> issues



