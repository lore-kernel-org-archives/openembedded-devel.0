Received: from [193.170.110.60] (helo=beta.fh-salzburg.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1MutWg-0004Hi-TN
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Oct 2009 21:47:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by beta.fh-salzburg.ac.at (Postfix) with ESMTP id 5864195066F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 21:46:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at fh-salzburg.ac.at
Received: from beta.fh-salzburg.ac.at ([127.0.0.1])
	by localhost (beta.fh-salzburg.ac.at [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id yGX7L4s37Vzg
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 21:46:32 +0200 (CEST)
Received: from mail-relay.core.fh-salzburg.ac.at (pinky.fh-salzburg.ac.at
	[193.170.110.5])
	by beta.fh-salzburg.ac.at (Postfix) with ESMTP id 2F25895022D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 21:46:32 +0200 (CEST)
Received: from vanessa.fh-salzburg.ac.at (vanessa.fh-salzburg.ac.at
	[193.170.110.166])
	by mail-relay.core.fh-salzburg.ac.at (Postfix) with ESMTP id
	EB8175EE8C9 for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 21:44:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by vanessa.fh-salzburg.ac.at (Postfix) with ESMTP id 3E3727A84A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 21:46:32 +0200 (CEST)
Received: from vanessa.fh-salzburg.ac.at ([127.0.0.1])
	by localhost (vanessa.fh-salzburg.ac.at [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 11305-05 for <openembedded-devel@lists.openembedded.org>; 
	Mon,  5 Oct 2009 21:46:32 +0200 (CEST)
Received: from [192.168.1.2] (d86-32-77-106.cust.tele2.at [86.32.77.106])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by vanessa.fh-salzburg.ac.at (Postfix) with ESMTP id 020387A80DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2009 21:46:31 +0200 (CEST)
Message-ID: <4ACA4D1C.8070803@gmail.com>
Date: Mon, 05 Oct 2009 21:46:36 +0200
From: Michael Lippautz <michael.lippautz@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1254768733.10712.3.camel@leeloo.somedomain>
	<200910052132.00776.marcin@juszkiewicz.com.pl>
In-Reply-To: <200910052132.00776.marcin@juszkiewicz.com.pl>
X-Virus-Scanned: amavisd-new at fh-salzburg.ac.at
X-SA-Exim-Connect-IP: 193.170.110.60
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: lighttpd 1.4.18 runtime issue
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
X-List-Received-Date: Mon, 05 Oct 2009 19:47:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sorry, was refering to http://wiki.openembedded.net/index.php/Styleguide
stating that either tabs or spaces should be used. This recipe was
mixing both.

Will use spaces and the tool (didn't see the wiki headline) in future
recipes.

Regards,
Michael

Marcin Juszkiewicz schrieb:
> Dnia poniedzia=C5=82ek, 5 pa=C5=BAdziernika 2009 o 20:52:13 Michael Lip=
pautz napisa=C5=82(a):
>  =20
>> lighttpd_1.4.18 is installed with a config that should actually load i=
ts
>> module mod-indexfile.so.
>>    =20
> =20
>  =20
>> Since the config is pretty default, I added the module to the runtime
>> depends.=20
>>    =20
>
> OK
>
>  =20
>> (also re-formated recipe, uses tabs now).
>>    =20
> =20
> There is a tool in contrib/ which handle reformation of recipes.
>
> # _Format guideline #2_:
> #   Tabs should not be used (use spaces instead).
>
> You have tab=3D8, I use tab=3D4 for most of formats so we get different=
 view of=20
> recipe code...
>
> Regards,=20
>  =20



