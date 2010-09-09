Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1OtelZ-0008DE-OK
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 12:54:16 +0200
Received: by qyk31 with SMTP id 31so6233725qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 03:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=VYtBY5JjYGTMw4CkpAotkajaIRbqRstc1YrXe3lAELU=;
	b=uaU/nnnGpaQZusuC9H2CAFpuYBa6v28GseFpFuVIagn2Ik2Wk1bYHwU0OYJmqW4x5c
	s4MbzJ1ksq21C0xmEMhwAQNVeVgpJHQvsrp0ZyKGQkucwP/QYTtA5U3bvLGRZi65snz9
	BSBbjIG+n/TQAe0Lie0dNEnzMrCPhtTJ0p134=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=I70S3J0wikZuBkq48Efb6IFL0D4xAtQZ9MQHzLqHkaKGkvk3YUvC4kMRLQXRhVZ/3l
	bNGWMiMQSyQKIjG4dUZw4E3cf+FLxJm+uKMLKYREyIvsHcLR1TRaypyIIyZS8x3bH/5i
	iD4noYo8GVJbdKLbT9nZtNXaPiPijS6dETzUg=
Received: by 10.229.190.21 with SMTP id dg21mr2086901qcb.211.1284029602360;
	Thu, 09 Sep 2010 03:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.52.74 with HTTP; Thu, 9 Sep 2010 03:53:02 -0700 (PDT)
In-Reply-To: <AANLkTi=ikw_D=38eMtVAMz08YifDNAf=zkWN39xcbuYa@mail.gmail.com>
References: <AANLkTikCe=1MNhEuYTG2Wusn1Fk43k-_7VTqaf6geFuT@mail.gmail.com>
	<4C7BBA85.8040101@selfish.org>
	<AANLkTi=ikw_D=38eMtVAMz08YifDNAf=zkWN39xcbuYa@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Thu, 9 Sep 2010 12:53:02 +0200
Message-ID: <AANLkTim1FvDwBBJQMqs7y3AxWos_c3sa_8dV=Mj1tL4A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: a recipe for qt4-plugin-phonon-backend-vlc
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
X-List-Received-Date: Thu, 09 Sep 2010 10:54:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

sorry but it is to complicated ofr my skill with oe
so if someone is interessted int this and/or kind enought to take a look at
this..
thanks
personnaly I drop it .
KR
Sylvain

2010/8/31 Sylvain Par=E9 <sylvain.pare@gmail.com>

> I tried to update automoc-native and kde4 but it is not better.
> I know that Q_WS_WIN is only defined when Qt was build for windows. But h=
ow
> to fix this?
> I am not very skilled, at least not enough to fix this..
> I miss some things so more explanation/help will be very well received!
> thx
> Sylvain
>
>
> 2010/8/30 Holger Freyther <zecke@selfish.org>
>
> On 08/27/2010 08:39 PM, Sylvain Par=E9 wrote:
>>
>> > automoc-native itself does not build.
>> > (According to OE's log automoc-native is ~ 2 years old.)
>>
>>
>> Well, pick the latest version then, /usr/include/qt4 as include is looki=
ng
>> bad, Q_WS_WIN is only defined when Qt was build for windows.
>>
>> So in summary...
>>        - automoc-native probably deserves an update
>>        - it should use the "native" version of Qt (like qmake, uic,
>> moc...)
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

