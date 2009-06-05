Received: from [209.85.221.173] (helo=mail-qy0-f173.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ramaxlo@gmail.com>) id 1MCVw4-0006zD-JS
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 11:42:04 +0200
Received: by qyk3 with SMTP id 3so1962072qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2009 02:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PIxatbQ9wV+UmFLZz4aQKSFx1DS07KOLjAJMoPD1SXs=;
	b=CUiZSbmpa2PpPkcRSvnlu0gORGrk6E+ZeC2YO0AbbeiSZQJqdzV5bAXg20MMmi4URD
	zhP2awhtfNdi9NIz5Hgd3vl9Kvt/slVGiJyhyN0IJ9hk5yBVRlDrNG7WN86XlFdrROFq
	qpyz9uvMN5PUAD9p9ahVqywlbsaL8dC3CoP00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=if3UH+cR/1eQBk7vK5GAWxbzKjZbqQdQWhtIdWXw7Pn5BKoRvEKEaBsC7c/n/x+Svx
	w11Tq4DJbR/YnIjm6FwFVkYl2I7/ZmBXFE3V/LTOEDKN/FfJUHk1+K2fpfg2JQfYOjr7
	lVTSB2VHJFBGVHJJ2f/MPuerkxiKZmBzd/OB8=
MIME-Version: 1.0
Received: by 10.229.81.66 with SMTP id w2mr879361qck.12.1244194373390; Fri, 05 
	Jun 2009 02:32:53 -0700 (PDT)
In-Reply-To: <200906041323.44441.marcin@juszkiewicz.com.pl>
References: <1241659800-17298-1-git-send-email-ramaxlo@gmail.com>
	<200905121420.22677.marcin@juszkiewicz.com.pl>
	<901c91090905121817n4c9775c2t4591313636c06788@mail.gmail.com>
	<200906041323.44441.marcin@juszkiewicz.com.pl>
Date: Fri, 5 Jun 2009 17:32:53 +0800
Message-ID: <901c91090906050232h5757f433k887271a1d39790a7@mail.gmail.com>
From: Ramax Lo <ramaxlo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] at2440evb.conf: Add AT2440EVB machine config.
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
X-List-Received-Date: Fri, 05 Jun 2009 09:42:04 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2009/6/4 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia =B6roda, 13 maja 2009 o 03:17:58 Ramax Lo napisa=B3(a):
>> 2009/5/12 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
>>
>> > Dnia czwartek, 7 maja 2009 o 03:30:00 Ramax Lo napisa=B3(a):
>> > > ---
>> > > =A0conf/machine/at2440evb.conf | =A0 19 +++++++++++++++++++
>> > > =A01 files changed, 19 insertions(+), 0 deletions(-)
>> > > =A0create mode 100644 conf/machine/at2440evb.conf
>> >
>> > Can you send also kernel config?
>>
>> Ok, please see the attached file. And a patch for this is also
>> attached.
>
> pushed both
>

Thanks.

>
> Regards,
> --
> JID: =A0 =A0 =A0hrw@jabber.org
> Website: =A0http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


