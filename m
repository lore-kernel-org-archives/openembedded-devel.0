Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lazy.gopher@gmail.com>) id 1QS9Ds-0000x5-Mf
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 16:50:08 +0200
Received: by fxm19 with SMTP id 19so865023fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=TRadLzanNm4Ul0ylX2z1dtfkOQgk9c9C8jU5upAl66A=;
	b=oceEXJyykqSpd1YFBNlVTNpgxYvvQaNpx2twWgzo9jF668E5vc7JMuLi2oGHtm0fA9
	Oa5P98cHhfNiKefGtDQ+G97QiHSOQ/Jlmlq2WGbKeJM6uUj+ggE642n0Zp2v1OzG+8ml
	chP/dSF0eZFFWsANEpw2fcIpPehkBtsrkVXrg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SG7ugKC+q8jBI5IlOLwLnlSGsPAKuyyLTHEoUIBCjj49p3uJI8peyvVr9Z+0vhZlRx
	f0BqZy0aEV1vGPXoAuuD6mVFfbvq1EJObAMyCwf04wLlAWy8kR3F9VLx+4dd2yhSq9pe
	ss8eGZr1kdHuWVW2JgncDZdReATvhvgZ5iHtI=
MIME-Version: 1.0
Received: by 10.223.41.89 with SMTP id n25mr949519fae.7.1307026017091; Thu, 02
	Jun 2011 07:46:57 -0700 (PDT)
Received: by 10.223.2.210 with HTTP; Thu, 2 Jun 2011 07:46:57 -0700 (PDT)
In-Reply-To: <1307024348.4241.20.camel@mattotaupa>
References: <4DE798CF.8010602@balister.org>
	<1307024348.4241.20.camel@mattotaupa>
Date: Thu, 2 Jun 2011 16:46:57 +0200
Message-ID: <BANLkTik6+Xn3Gv_ui-Du1B3FJB66Wtm1eg@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: ICE from zeroc
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
X-List-Received-Date: Thu, 02 Jun 2011 14:50:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Philip,

I did submit the reworked patch, and its got commited with

2704fd5da32a9759976c2cc02bdff5234d732788

recepies/zeroc/... is the path.

Regards,
Maksym Parkachov.

On Thu, Jun 2, 2011 at 4:19 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Donnerstag, den 02.06.2011, 10:06 -0400 schrieb Philip Balister:
>> A "while back" I thought I saw a recipe for ICE (Internet Communications
>> Engine) get posted to the list. I meant to go back and look at it, and
>> now I can't find it.
>>
>> Did this really happen?
>
> Yes. Jayen Ashar send a patch to the list on Thu, 25 Nov 2010 16:46:43
> +1100 (25.11.2010 06:46:43) with subject =C2=BB[oe] [PATCH] IceE: New
> program=C2=AB [1].
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Message-Id: <1290664003-17257-1-git-send-email=
-jayen@cse.unsw.edu.au>
>
>> Is the person that submitted it redaing this?
>
> Adding him to CC he now definitely is.
>
> I am sending you the mbox file of the thread privately.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-November=
/027236.html
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


