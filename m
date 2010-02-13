Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1NgF0h-0007Vz-6T
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 11:14:02 +0100
Received: by fxm26 with SMTP id 26so3286560fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 02:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SIvsc+VjHFBXeesWV7khghtQUnv1E3B8Tzq0Ooyt1dY=;
	b=xUa1oRLNvZd2+oI5GWGkOhJrQtGVLFDsaadyxg9xeU1nrFy5ioyxXdULN/hU5h/SgP
	eqVOmJS0KtLWnKVJ6IHCHA3/V9HeYPzKLwbGppFkvi0AUFSWh8j6eOvMoNHOrLhMpXOX
	lQTy+qJrFJIiE5l2HS0tFjY4Te7wjCSXVqqC8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BwLHgxf1Sg23wJwlMHkrb758JtgZD3D9q65Dys64DMNiG3hVQTvp2KlIKLYGIzLhTf
	IpOrmFeGYyTsd3HzQzmFNHS0F0APu7g4pQjyzOFuga0eCOWc0qrvvP2pGJI5iZQRBhUT
	Imxp8Oi8hmB3W4zkAQgwtoed9jr8bgQG89AF4=
MIME-Version: 1.0
Received: by 10.223.6.27 with SMTP id 27mr2978161fax.31.1266055883188; Sat, 13 
	Feb 2010 02:11:23 -0800 (PST)
In-Reply-To: <1266053054.4218.3.camel@mattotaupa>
References: <ade1bdc1002130107q6e83bca2sd57391ca539ef6a4@mail.gmail.com>
	<1266053054.4218.3.camel@mattotaupa>
Date: Sat, 13 Feb 2010 11:11:23 +0100
Message-ID: <ade1bdc1002130211o51733308vc79df05ee449cb0d@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: git and ssh and kernel development
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
X-List-Received-Date: Sat, 13 Feb 2010 10:14:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear Paul,

2010/2/13 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear Raffaele,
>
>
> Am Samstag, den 13.02.2010, 10:07 +0100 schrieb Raffaele Recalcati:
>> I have a git mirror of the kernel.
>> How to fetch from it in ssh .
>> ssh://user@ipaddress/pathtogit;protocol=3Dgit;branch=3Dmaster
>> but ssh has password =A0..
>>
>> Second question: if pathtogit is a dir on my pc where I'm developing
>> what is the syntax?
>
> I think this is the wrong list you are asking this question. Please ask
> on the Git list, but before you should read the documentation which is
> quite elaborate for Git as far as I know and should cover your
> questions.
>
> If you do ask the question on the Git list or solve the problem please
> answer to this thread with the appropriate links.

I'm sorry.
It was a stupid question.
I'll be very careful in the future!
:)

Thanks,

Paul

>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


