Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QBAoE-0001xs-BR
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 21:05:30 +0200
Received: by fxm19 with SMTP id 19so2813854fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=pYxMGH2Vw3ObNhDd4V9s9YgAxQcNWHPOSVv1gNipXo8=;
	b=wMSi8ZCMak5umy4HaP5T8851IX+bv6q/fkltnzMvaJ3DPGYmqeBL62x5Sxycpz+Kh7
	N+0DcbwCI/8XY13WNwVCqLCcvDSq7lSaiYmZdNQyp9oI9pu8s+VfVEKY87D7u6ZZdt4w
	78626i3O6KeGb4TGcVNHGSf8cVcKelZveXXtM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ZjaZFKWiQaogGg8YRM6jOGWgIjpTw1Uwg2QIhESQTyiuKkP9ZjbARTAWN6kma+vdCx
	zcsrWMK2mblV9aD1umQe8pdbK/Fdysgx4J/GpxgpA+P2sc7+z6GH6UinSr6tLRkL2u2U
	bkBm8vZyzyQr3rvrvff9YhmrS+Yd1c1QtuuFA=
Received: by 10.223.127.210 with SMTP id h18mr3289383fas.73.1302980587105;
	Sat, 16 Apr 2011 12:03:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.115.82 with HTTP; Sat, 16 Apr 2011 12:02:37 -0700 (PDT)
In-Reply-To: <BANLkTink-co5TWFr1nJF0cqPueXESs51xg@mail.gmail.com>
References: <AANLkTimSjWURf8gMrVZGd==xCH3jnWEG_=G8EMfsdbW1@mail.gmail.com>
	<AANLkTimPz8ji6Lo-Yh2DmRUc0=A-EwePxre6GiTss2=V@mail.gmail.com>
	<AANLkTi=pcOHKF78X_uezE9Yqj9m=TLT5FPsWePp_Vs11@mail.gmail.com>
	<1302942561.8709.7.camel@mattotaupa>
	<BANLkTink-co5TWFr1nJF0cqPueXESs51xg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Apr 2011 12:02:37 -0700
Message-ID: <BANLkTimOyVwaDar+zCM1ihxXkP0FH3ppLA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: work flow with pull requests (was: Pull request from O.S. Systems tree)
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
X-List-Received-Date: Sat, 16 Apr 2011 19:05:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 16, 2011 at 10:42 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sat, Apr 16, 2011 at 05:29, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
>> So I would conclude that using both ways =E2=80=93 as for example Otavio=
 is
>> doing right now =E2=80=93 seems to be an optimal(?) solution.
>
> I am trying but it has not worked so far. Most patches I sent mailing
> list are still not applied or nacked.
>
> If you check at
> https://projetos.ossystems.com.br/git/?p=3Dusers/otavio/org.openembedded.=
dev.git;a=3Dsummary
> you will see patches I sent two or three times here and that are not
> merged/nacked yet.

few of us were busy for last couple of weeks attending
different conferences hence the delays. It should get better now
after everyone is back and well rested after their travel

>
> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


