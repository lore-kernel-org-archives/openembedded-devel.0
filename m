Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Q0iSG-0000V7-At
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 23:47:36 +0100
Received: (qmail 26982 invoked by uid 1003); 18 Mar 2011 22:45:48 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.162.57)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	18 Mar 2011 22:45:47 -0000
Message-ID: <4D83E09C.5010503@balister.org>
Date: Fri, 18 Mar 2011 18:45:48 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <6F3B187F-5497-4504-9EEB-99204CCC815B@vanille-media.de>
	<im0m9u$71e$1@dough.gmane.org>
In-Reply-To: <im0m9u$71e$1@dough.gmane.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: blacklist.bbclass
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
X-List-Received-Date: Fri, 18 Mar 2011 22:47:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2011 06:28 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-03-11 20:24, Dr. Michael Lauer wrote:
>> Salut,
>>
>> the blacklisting of packages as found in angstrom.bbclass
>> is pretty helpful and would be beneficial to all kinds
>> of distribution configurations in OE.
>
> So include it in your $DISTRO.
>
>> Would there be
>> a strong objection of renaming this to blacklist.bbclass?
>
> Why is a rename needed? SHR is already using it as is.

What is oe-core doing? I would think they would want to make this more 
generic. The solution may be to adopt what happens there.

Philip


