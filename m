Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmiO0-0000G4-Ay
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 07:48:52 +0100
Received: by iwn10 with SMTP id 10so1046681iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Mar 2010 22:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=eLrIDqK2JerXr0ugX2tkkK5i5G9z9qmBNemoXKJzMME=;
	b=QX0o7i6DDZ2gWYPyDhJXr/EaUMV1djToMbtE+y3095kXHS4c+0Nsp6pAoCu4+bLcc9
	9/af1LRTOteNyXa0mu5E0SZ/mYTMPzERphAoYxNqV+cp/HPlhl076TqCDQyQcM5Szr5r
	NQ+sbKDlYhbnt3yFjUVaYV6UipOrruVvhsbIs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LMpDrUNTiBOZyS/b8aZLSUgpR5WPWSqn4eyDfW78HTEBzBnntVz+xGeY1NlJnAN1br
	eigWSYW7cF88etrXSwlGblfLbgHedCYF7nlidLAT41CypYHPnagAVXrbRLYxJHBMN5AN
	ib6QcFlTUnGQqn1qIE03+uX5jwaNoBSwIXH1g=
MIME-Version: 1.0
Received: by 10.231.170.14 with SMTP id b14mr545236ibz.26.1267598756537; Tue, 
	02 Mar 2010 22:45:56 -0800 (PST)
In-Reply-To: <2b288bf1003022053g2dbca134s20b172e94911060e@mail.gmail.com>
References: <2b288bf1003022053g2dbca134s20b172e94911060e@mail.gmail.com>
Date: Tue, 2 Mar 2010 22:45:56 -0800
Message-ID: <19c1b8a91003022245w4efed14cs61d162040ea36149@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: locale support in OE
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
X-List-Received-Date: Wed, 03 Mar 2010 06:48:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 2, 2010 at 8:53 PM, Vandana Vuthoo <vandana.vuthoo@gmail.com> wrote:
> Hi,
> I need to know how to add diff locale supports in OE, I tried
> IMAGE_LINGAUS but it is not working for me.

if you used same as above then there is a typo it should be something like
IMAGE_LINGUAS = "en-us"


> Regards,
> Vandana
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


