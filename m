Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N8hiw-0005La-DU
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 23:01:05 +0100
Received: (qmail 18624 invoked by uid 1003); 12 Nov 2009 21:59:42 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 12 Nov 2009 21:59:42 -0000
Message-ID: <4AFC854D.8040302@balister.org>
Date: Thu, 12 Nov 2009 16:59:41 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911120045170.1265@localhost>	<200911120656.41249.holger+oe@freyther.de>	<200911120722.09166.holger+oe@freyther.de>	<alpine.LFD.2.00.0911120125380.1977@localhost>	<ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>	<alpine.LFD.2.00.0911120727540.7268@localhost>	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>	<4AFC58B0.3080000@mwester.net>
	<1258062144.13299.1.camel@gnutoo-desktop>
In-Reply-To: <1258062144.13299.1.camel@gnutoo-desktop>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 22:01:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2009 04:42 PM, GNUtoo wrote:
>> Is it practical?  I think the answer is no.  In my experience, tools
>> like selinux have a tendency to require inordinate amounts of
>> administrative burden that just isn't practical in a development
>> environment.  I think requiring that selinux be disabled on build
>> hosts
>> is a reasonable requirement, and will avoid wasting a lot of cycles
>> that
>> should be spent on OE, and not on administration (or sending lots of
>> emails).
> What about supporting only the unconfined user selinux
> type(unconfined_u),in targeted mode?

I'm running default Selinux on F11, I don't think we can just say OE 
must have SELinux turned off.

Philip


> Denis.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


