Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NVQeD-0008CX-Kl
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 15:26:08 +0100
Received: (qmail 15658 invoked by uid 1003); 14 Jan 2010 14:23:53 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 14 Jan 2010 14:23:53 -0000
Message-ID: <4B4F28F8.5030304@balister.org>
Date: Thu, 14 Jan 2010 09:23:52 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <hill5g$ll0$1@ger.gmane.org>	<1263426466.457.286.camel@lenovo.internal.reciva.com>	<1263427123.15954.6.camel@dax.rpnet.com>	<hilp2s$ag$1@ger.gmane.org>	<himn94$8ui$1@ger.gmane.org>	<1263477134.22868.65.camel@andromeda>
	<hin8o7$2ml$2@ger.gmane.org>
In-Reply-To: <hin8o7$2ml$2@ger.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Sane default for SPLASH
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
X-List-Received-Date: Thu, 14 Jan 2010 14:26:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2010 09:12 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 14-01-10 14:52, Michael 'Mickey' Lauer wrote:
>> Am Donnerstag, den 14.01.2010, 10:14 +0100 schrieb Koen Kooi:
>>> NAK, the needless SPLASH ->  BOOTSPLASH will create too much work for
>>> people to catch up to, and it messes up the docs on the subject.
>>
>> Could you expand on that reason? I find the patch quite a useful
>> refactoring. If we don't allow patches like this going in, we're
>> doomed into living with misnomers forever -- and we all know that
>> there are quite a few in OE metadata.
>
> If you want to fix such misnomers it needs to be done with more thought
> and publicity to allow external repos to catch up. No need to stab
> people in the eye to make 2 people feel better.
> And FWIW, psplash runs at shutdown as well, so it isn't really a
> bootsplash ;)

Trying to get this back on the issue at hand ....

It appears to me (who isn't really folloing the thread), there are two 
issues, an immediate problem that Rolf's second patch addresses, and the 
actual variable name issue, which appears worthy of further discussion 
and thought.

It is always good to keep individual changes as simple as possible and 
avoid mixing too many thoughts in one commit.

Philip


