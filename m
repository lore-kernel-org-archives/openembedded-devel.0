Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1ORMw8-00058u-5J
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 12:12:16 +0200
Received: (qmail 26161 invoked by uid 1003); 23 Jun 2010 10:07:25 -0000
Received: from localhost (HELO ?172.30.0.245?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Jun 2010 10:07:24 -0000
Message-ID: <4C21DCD6.4090509@balister.org>
Date: Wed, 23 Jun 2010 12:07:18 +0200
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>	<hvl1uc$bol$1@dough.gmane.org>	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>	<hvsjso$8bh$1@dough.gmane.org>	<20100623103600.77c5a6d9@xora-desktop.xora.org.uk>	<AANLkTimwSjUiEgwAU-l66u9Da5ckM4p2yD4naQq3g_ZZ@mail.gmail.com>
	<20100623110315.16293a95@xora-desktop.xora.org.uk>
In-Reply-To: <20100623110315.16293a95@xora-desktop.xora.org.uk>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a question)
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
X-List-Received-Date: Wed, 23 Jun 2010 10:12:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2010 12:03 PM, Graeme Gregory wrote:
> On Wed, 23 Jun 2010 11:54:21 +0200
> Frans Meulenbroeks<fransmeulenbroeks@gmail.com>  wrote:
>
>> 2010/6/23 Graeme Gregory<dp@xora.org.uk>:
>>>>>> Also I don't feel empowered to make changes in distribution
>>>>>> specific files.
>>>
>>> Why not, chances are Angstrom maintainers would be quite happy for
>>> you to patch angstrom*.conf if you ask us.
>>>
>>> Graeme
>>
>> distribution != angstrom
>> There are more distributions out there.

Right now, toolchain selection is done in distro files not machine 
files. I agree this is not the clearest approach, however adding the 
toolchain selection to the machine files may have unexpected side effects.

I would ask DISTRO maintainers to add the needed overrides, and explore 
alternative methods as a separate effort.

Philip


>>
> I think the other distros are almost as friendly as us :-)
>
> Anyway the sane-* files are free for all with Acks.
>
> Graeme
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


