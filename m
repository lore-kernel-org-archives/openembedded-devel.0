Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OQTSp-0006de-EU
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 00:58:08 +0200
Received: by iwn5 with SMTP id 5so2883779iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 15:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=j9i+GUKiuQua6gye5i/VUhckJpzmK9KInVJfrICAtZM=;
	b=I/Wweg4JWs8xLD1KCSZGyXuaZrEzZewWOUy/IZp5xoVbWqQS697e5w6CajhCLQr3y7
	YHPZOsp9M4NDULynVt4Vi53lxFiU/1u0nN80cjZ6y6oIEFFe2KR86RbjbL9it8WvsAM8
	5trf37eOt4fOK+EhSEHwZsHq3o0E+M+Y2KbME=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=P3UvVw4YLH4jHuphH/Vle6jO2+757KyycRYNMUkUCqQ9IziDHQrqIeTYbnrTnNfruz
	Bb5+6Isc/UkfbD3UfofzD6PBhIZri5VguYwbPRoxyUmtvg4lBK5gzyUaMccYOKRS09mq
	yT0mjwpwrLQvQFrftuahS6ikvrKeYNzVLr8IA=
Received: by 10.231.174.201 with SMTP id u9mr5080754ibz.17.1277074415091; Sun, 
	20 Jun 2010 15:53:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Sun, 20 Jun 2010 15:53:15 -0700 (PDT)
In-Reply-To: <AANLkTikjJzqog2Cla8H_JazzRw6QuSrSdllTOD7XwgBx@mail.gmail.com>
References: <AANLkTikjJzqog2Cla8H_JazzRw6QuSrSdllTOD7XwgBx@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jun 2010 15:53:15 -0700
Message-ID: <AANLkTimZpJVleLNQCGjiuVgDGl-cvxx1_U7ukwx0f35V@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-libc-headers & kernel-arch.bbclass
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
X-List-Received-Date: Sun, 20 Jun 2010 22:58:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jun 20, 2010 at 2:03 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Hi,
>
> I noticed linux-libc-headers has a function set-arch to set ARCH.
> linux recipes get this from kernel-arch.bbclass.
> Wouldn't it be possible to let the linux-libc-headers recipes also get
> ARCH from kernel-arch.bbclass ?

yes it could.  Care to provide a patch ?

>
> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


