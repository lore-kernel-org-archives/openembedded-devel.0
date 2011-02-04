Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PlLRk-0008Jg-BB
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 14:11:32 +0100
Received: by iwn8 with SMTP id 8so2158336iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 05:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=VO5s//CbmZXRo5eBVD64K6ttTxPasF+50qVxOyK6aQg=;
	b=NVIGnony/3qyRG+BfGQRH8+p2NLDYRcGr7FhfySATN+wKuPPtpF/JaWYkiCmgJWhhM
	B/Lowmn7/bolaoDYOFEh7wm+TnSCXanI4bDu8AunC5scJD2fvFIERXAmESahl0pYlXMW
	CFR7T0y05rqmL1AZ3j4RLMYD51hEHPQf9Y7U0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lxb7fG85YH07aagbzwMwDarZdiOp/iPyMjtYFYGOzKqrYuW2+r2kLabElrVzFCcFNh
	PH9sd8ywRYRy+Fa/l15/L9uRknP4MQ++JMm4ozhsEqqVG+GqFhMR8ehq4KpAuX/xdZih
	o49L5+Lw4sc3V1VF6+oyAHVI/0l4LVcp1mzFo=
MIME-Version: 1.0
Received: by 10.231.207.66 with SMTP id fx2mr13065644ibb.108.1296825033961;
	Fri, 04 Feb 2011 05:10:33 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Fri, 4 Feb 2011 05:10:33 -0800 (PST)
In-Reply-To: <AANLkTi=f0V2=U9rAZd9HTk8VdgqZbRC+2NJ8YE-4SZbw@mail.gmail.com>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
	<20110204090348.GR4580@excalibur.local>
	<AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
	<AANLkTi=f0V2=U9rAZd9HTk8VdgqZbRC+2NJ8YE-4SZbw@mail.gmail.com>
Date: Fri, 4 Feb 2011 14:10:33 +0100
Message-ID: <AANLkTi=7X86Wvps_HETYz7mkCSZbDKLxBHP1uW6NUbMN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Fri, 04 Feb 2011 13:11:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/4 Otavio Salvador <otavio@ossystems.com.br>:
> On Fri, Feb 4, 2011 at 09:57, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Actually I did not react on the libtool forcing upon everyone, but on
>> the QA errors (where this thread was about).
>> That was also the cause of the ostrich remark (which was definitely
>> not aimed at you in person, but more a general comment, triggered by
>> the fact that I have some experience with projects being outsourced to
>> an unnamed country where a bug report also could be "repaired" by
>> removing the message or the the symptom instead of tackling the root
>> cause).
>>
>> What I see is a lack of interest in fixing the existing QA errors.
>> I've sent out a few error reports to the list a while ago, (on recipes
>> that I feel not comfortable with), but unfortunately that did not
>> result in any action :-(
>
> I think we ought to FAIL on QA errors. Distros can ignore the errors
> if they want but OE as a whole cannot do that.

I tend to agree with this.
Actually it would be nice if insane.bbclass would allow a way to
specify which tests you want to do.

And, thinking of it, probably we should rename the class to qa.bbclass
or something like that
(or maybe split the file into a bbclass file per test, that way
distros can just inherit whatever test they feel is important for
them).

Frans.
>
> For me, this looks as a blocker for 2011.3 release.
>
> --
> Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.oss=
ystems.com.br
>


