Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Odasb-0001sY-0u
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 05:30:59 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id EFB4A16600C5; Mon, 26 Jul 2010 21:30:25 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 81B4B166055F;
	Mon, 26 Jul 2010 21:30:05 -0600 (MDT)
Message-ID: <4C4E52BD.1080108@mlbassoc.com>
Date: Mon, 26 Jul 2010 21:30:05 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C4E4DB2.9090606@mlbassoc.com>
	<AANLkTikRqVrJ6uS9njZm9CWW8FkVJZyZ6MbbOQ=BQuCQ@mail.gmail.com>
In-Reply-To: <AANLkTikRqVrJ6uS9njZm9CWW8FkVJZyZ6MbbOQ=BQuCQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Checkin policy??
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
X-List-Received-Date: Tue, 27 Jul 2010 03:30:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2010 09:17 PM, Chris Larson wrote:
> On Mon, Jul 26, 2010 at 8:08 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
>
>> Surely, there must not be any or else simple compile errors wouldn't get
>> through :-(
>>
>
> It's a trunk/master branch, shit happens, and it's not reasonable to test
> every recipe for every target for each commit.  In addition, in this
> particular case, it's highly unlikely a review would have caught this error
> anyway.  Fix incoming.

Fair enough, but it shows the need for something in between the
"stable" angstrom/2009 tree which is incredibly stale and the
absolute bleeding edge which changes hourly and is often too
unstable to use.

Thanks for the quick fix (testing now)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


