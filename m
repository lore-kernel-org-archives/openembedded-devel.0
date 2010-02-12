Received: from mail-yx0-f178.google.com ([209.85.210.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NfqqL-0002ho-Ge
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 09:25:44 +0100
Received: by yxe8 with SMTP id 8so2158043yxe.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 00:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=gj7eoOH4pj4sKXwEWxLWfggxmeWwREVdMsOkjxkePLs=;
	b=d4qjFJZ+9vVh6/S7Yf2R6kotQb/WNiJ/l/RrwDQFc7HNL6DNgjHWKtAh1NF3d0jQtd
	vpFVCYifv4f2ZPP4hhPyA54luxIjaP5sZBmvQB8T8bTQdtr5ZTWN4ZHaerAUf8ZSOzmC
	3CL6ws0k4kIcYS4O7iWaQMwySHmJFw+POPBJY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WZEB0bqU0z+Ba6difgM0oYF2vniiiVrGDcRbMOaS2ZXE2/Gv+HuTk3h043Hks5feC/
	D6xMZ0GW0t+tqunxkyLWOb4TVYTjg+xVzj8p8Hgm7KsvCfz2wfhFDdqO57RxqSxuCdeM
	LXWA7ldXSUCdRue/zVWWPjUpDS4G65c37M1jY=
MIME-Version: 1.0
Received: by 10.100.224.19 with SMTP id w19mr1372448ang.208.1265962985853; 
	Fri, 12 Feb 2010 00:23:05 -0800 (PST)
In-Reply-To: <b8e1ecc81002111744u4e9c2d84xc5cc1e3d2d1b3a0d@mail.gmail.com>
References: <b8e1ecc81002111744u4e9c2d84xc5cc1e3d2d1b3a0d@mail.gmail.com>
Date: Fri, 12 Feb 2010 09:23:05 +0100
Message-ID: <ac9c93b11002120023mcdab5e1w2694d06e7f48368e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: busybox* Fix URI
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
X-List-Received-Date: Fri, 12 Feb 2010 08:25:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/12 Marcos Amorim <marcosmamorim@gmail.com>:
> Hi All,
>
> I suggest move SRC_URI from all busybox_${PV}.bb for busybox.inc, but i dont
> really if is possible.

Then I suggest you apply your own patch and test

>
>
> Thanks,
>
>
> Marcos Amorim
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


