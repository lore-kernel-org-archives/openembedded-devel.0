Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P52VB-0001vb-D5
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 22:28:14 +0200
Received: by gyd8 with SMTP id 8so847604gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 13:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=tu0AOD4lgijk6KkA/qvfa1uBHa+/2/nsTzDrXNYLh80=;
	b=HaL4ZwlDsK9BZ/QuI3mUjhC8f1orz4riA9LKfo9PvBhU9RIxGCIOyMUcv3IVnvOlwE
	MFE/5sC8Q19iw/49Kfz0KDBFQWyBg4GhiyJYlus6ycZfrIXhSfEk0cXlTOYQ47qpqc7j
	N4fNHa7qTsS/9+yixrarKFcYZvbmn1kLNEVfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=axQgddHjrjWyVhjgrQyTOjHq8Qx52QB9xgZA6WD+IzHbE7D0AP4QqcYWISktBIonTB
	wyM4aBj6Gq+zPhhfd2EsEQYkPij3Ef1TS6rdXkXjYkFDTZ8N+2ArrUWW/G1REEI5AApj
	ovu7NQYkrz8uXJxpumoJh4dtUYmYvhSzi+7PA=
Received: by 10.90.29.12 with SMTP id c12mr2737383agc.5.1286742452407; Sun, 10
	Oct 2010 13:27:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Sun, 10 Oct 2010 13:27:12 -0700 (PDT)
In-Reply-To: <1286739426.3808.117.camel@mattotaupa>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
	<AANLkTinQ4uW=o43O5Bv6FijfoicU2CL5j3Zn8zWf5Snm@mail.gmail.com>
	<1286664909.15886.13.camel@saphir> <1286698831.3808.2.camel@mattotaupa>
	<AANLkTimXU=NzmwqCpnho5ukCVoXnF5qR_4D6XWN4RaWr@mail.gmail.com>
	<1286703485.3808.10.camel@mattotaupa>
	<AANLkTimhsRw9ooC=zQqrfSgtRhCV0C=_O_gqsd=7N2kF@mail.gmail.com>
	<1286739426.3808.117.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Oct 2010 13:27:12 -0700
Message-ID: <AANLkTinSFToQrULqOW+ZvC0RDSdshPJodZYQ_dB6qBe6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Sun, 10 Oct 2010 20:28:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2010 at 12:37 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Sonntag, den 10.10.2010, 12:29 -0700 schrieb Khem Raj:
>> On Sun, Oct 10, 2010 at 2:38 AM, Paul Menzel wrote:
>
> [=E2=80=A6]
>
>> > And still, the other thread [1] should find a conclusion, since for me
>> > it looks like the current behavior is wrong.
>>
>> what behavior is wrong ?
>
> As the thread subject says: DEPENDS not honored: `do_configure` runs
> before `do_populate_sysroot` of dependencies.

hmmm I doubt it. We should see such problems more often if this was
happening. It might be a special case in what you are seeing. You
should
look through task dependency tree and try to see if some task is not
defined correctly.

>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


