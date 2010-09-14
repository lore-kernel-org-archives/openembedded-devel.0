Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OvV8m-0002nx-TB
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 15:01:43 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id AA6D31660342; Tue, 14 Sep 2010 07:00:53 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2C8FC1660283;
	Tue, 14 Sep 2010 07:00:53 -0600 (MDT)
Message-ID: <4C8F7205.20304@mlbassoc.com>
Date: Tue, 14 Sep 2010 07:00:53 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>	<4C8F5E55.9010906@balister.org>
	<4C8F6A6F.4090403@balister.org>	<AANLkTikNARJgBSC4m1u0tgjXfHh4VEga2=X9OZPBB1Et@mail.gmail.com>
	<AANLkTinEdzVgBru=Ui9-MNpaXFD=zGhN6Aek-BM6vAkM@mail.gmail.com>
In-Reply-To: <AANLkTinEdzVgBru=Ui9-MNpaXFD=zGhN6Aek-BM6vAkM@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-09-13
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
X-List-Received-Date: Tue, 14 Sep 2010 13:01:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2010 06:56 AM, Frans Meulenbroeks wrote:
> both slugos/slugos-image and minimal/console-image fail on cairo
>
> checking whether cairo's image surface backend feature could be
> enabled... no (requires pixman-1>= 0.18.4
> http://cairographics.org/releases/)
>
> Guess this fix resolves it.
> I consider this testing version a fail.

Precisely why this kind of testing is a win :-)  Last week, things
built fine and this week they don't.  Imagine the poor NOOB who
just wants something that works and tried it from today...  At
least now there's a snapshot that is easy to get to with known
[working] results.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


