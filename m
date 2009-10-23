Received: from [209.85.221.178] (helo=mail-qy0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N1PxZ-0006G7-IG
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 21:38:04 +0200
Received: by qyk8 with SMTP id 8so7501762qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 12:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=egBa1oH6b1fhGxlLvm0kHfBnE/ea7i2pss0m5aJlHxI=;
	b=pjwkyEeqEfV2G8T/k92YuFtleA4U9AUPJjA4mxnUgG1T3FSXeiKGh34EsR99ykJMNc
	MGUgLDtK3f/SWjzDdE4NdSh2AGtr2lagibSJbzFbKmiHsUgiF7BHaHNPkz0awZxOA19w
	iJFR3Rcjf1A4p5OduEaBMnU7y4nZLyX1Cr2lA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bmPqqQY4A7QA28VG8i5r06bekt3sfXNR8VwlJef+kZLP0tvlp0zSxV/7LHBaJ30E3+
	Cih8qzYruQqHweocvanRcS2ufLcg7vTUkm2q8f6uQ10UkZcsQ+DA0GpQtdQ5DBZQqqnb
	E+0mxX3SGu6k344oTtY5xpFeZgYQf4hQmCY9g=
MIME-Version: 1.0
Received: by 10.229.42.208 with SMTP id t16mr32034qce.14.1256326617920; Fri, 
	23 Oct 2009 12:36:57 -0700 (PDT)
In-Reply-To: <200910231258.40381.marcin@juszkiewicz.com.pl>
References: <1254931819-14007-1-git-send-email-marcin@juszkiewicz.com.pl>
	<200910231258.40381.marcin@juszkiewicz.com.pl>
Date: Fri, 23 Oct 2009 12:36:57 -0700
Message-ID: <19c1b8a90910231236g4dff398ak266b7020338c3ad8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH 1/2] glibc/eglibc: remove calls to obsolete base_set_filespath()
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
X-List-Received-Date: Fri, 23 Oct 2009 19:38:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/10/23 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia =C5=9Broda, 7 pa=C5=BAdziernika 2009 o 18:10:18 Marcin Juszkiewicz n=
apisa=C5=82(a):
>> From: Michael Smith <msmith@cbnco.com>
>>
>> Some recipes can use the default FILESPATHPKG, others need to override.
>
> ping?
>
> This was Acked by Koen Kooi but as this is glibc I would prefer to get se=
cond
> Ack.

Acked-by:  Khem Raj <raj.khem@gmail.com>

>
> Regards,
> --
> JID: =C2=A0 =C2=A0 =C2=A0hrw@jabber.org
> Website: =C2=A0http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


