Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NYLA8-0002gv-QN
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 16:11:07 +0100
Received: by ywh8 with SMTP id 8so1155706ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 07:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=0l/8yUcRTj2RJeCDt/YK9QgJ/8HNfk0EJW/8IjBCo/Q=;
	b=Ri1Bk4FUf/FtIT8KK9ttZuPpKJfJjhiEZ37wQZ6AfNGWk6Z3QFWUQt7WLMQLxRSMgm
	r3yshxwU9g7pI3ADOph8lH9wSY5+P8Tb8EL8NisdNZ55DUAU/9gNstVW6y/O6ImYor22
	Vbksya+RfYvUV+FUViRpggeyIsmUbnBP05w0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FvzgtAUPokWmf4Smiyd4yJm8j1/+eL9WovwgtZzmBROBtKE5k+eqt81rWN77HHAb0K
	gjUhA6xlSoLwS0h57K4LYfgxMtPoK4G3pEBL7p6HRb3NJQJlT9npjWRitYWbGlGjVNoC
	4WWlzLt0Fuc4aUeRD93A1sQWlz8/DkBg7J3tA=
MIME-Version: 1.0
Received: by 10.101.105.30 with SMTP id h30mr3936141anm.225.1264172926408; 
	Fri, 22 Jan 2010 07:08:46 -0800 (PST)
In-Reply-To: <201001221539.21722.christopher.lang@acurana.de>
References: <201001221539.21722.christopher.lang@acurana.de>
Date: Fri, 22 Jan 2010 16:08:46 +0100
Message-ID: <ac9c93b11001220708tc984a38v8f9312c0bab5decf@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New Recipe: xmlto-native
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
X-List-Received-Date: Fri, 22 Jan 2010 15:11:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/22 Christopher Lang <christopher.lang@acurana.de>:
>
> Hi,
>
> please find enclosed a new recipe: xmlto.
> Checksums attached too.
>
> Tested with OE from Jan 11 on Opensuse 11 building for machine "x86",
> distro "minimal".
>
> Checked with oe-stylize.py.
>
> Chris
>
> http://www.acurana.de/

Please provide the recipe as an inline patch, much easier to review.
And why are you giving recipes for two versions???

Frans (who does not even know what xmlto is supposed to do)
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


