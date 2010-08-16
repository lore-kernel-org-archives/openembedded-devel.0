Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OkqYO-0000ey-R3
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 05:40:06 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id A002E16607EC; Sun, 15 Aug 2010 21:39:30 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4B59B16607C0;
	Sun, 15 Aug 2010 21:39:10 -0600 (MDT)
Message-ID: <4C68B2DE.6020803@mlbassoc.com>
Date: Sun, 15 Aug 2010 21:39:10 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<i49lq7$jft$1@dough.gmane.org>
In-Reply-To: <i49lq7$jft$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>, gumstix-users@lists.sourceforge.net
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Mon, 16 Aug 2010 03:40:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2010 03:22 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 14-08-10 17:46, AJ ONeal wrote:
>> This is about the 4th time that I've `rm -rf`-d everything and started from
>> scratch and never yet got a working `bitbake omap3-console-image`
>
> That recipe isn't in OE, so it seems you're building from what we call
> "some random tree", which is unsupported. Complain to the people in
> charge of that tree and tell them to fix things.
>
> If people don't care enough to get there stuff upstream, upstream won't
> care about problems in that tree.

I suggest that _you_ practice what you preach.  There have been tons
of messages on this list complaining about recipes that you are responsible
for (or at least have the last checkin on) and nothing ever seems to get
done about it.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


