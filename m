Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OrQfl-0007rl-FP
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 09:26:55 +0200
Received: by wwb31 with SMTP id 31so1883171wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 00:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wVsMLwRbf0pWw1DZcnLsqRMGwi3cSw3ZKexxDcppt68=;
	b=bNFo6YnB2MzoSEaUStjRJau6Gbd84Ajg/U1yJJ9AkgMeeGkOBpT/sJDBAaYKjEWxO2
	EEXl/giz9XMwBpZlFd1aWjho4TFim39jr6mfNRFKUNb7GuEEXbSB0X2XuQ1tsbbXA5li
	L+0DflJ93Hd2miE6C5aYprlzIHgUQYMvr9gRw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AoOGO0Xc0cLd4DWpZOT8fh3RQCtJMxpUs8zIFW3FU3k5aAfo9EXK8r35Ik+kAi0BV9
	cos9J93WERLecee5MQ1TuBoxTuVolw7sDK2smOvLLkfGdM613oteIGg3yzEW563oxZ2N
	Y7OvjZK6uGiPr1sYHcILf+IvZ7HWFAUFYkuWg=
MIME-Version: 1.0
Received: by 10.216.178.200 with SMTP id f50mr269972wem.62.1283498777058; Fri,
	03 Sep 2010 00:26:17 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Fri, 3 Sep 2010 00:26:17 -0700 (PDT)
In-Reply-To: <AANLkTikV8sS4FiQP2-PJAmy3AZa+Wpx1VE2F6v+G=fpB@mail.gmail.com>
References: <AANLkTimsOCL0xo1Y+KL6FdmXWRcXpNf=DN2PR14tmDz0@mail.gmail.com>
	<AANLkTikBBUuSKeXh=k+G1ejHNSdMdab_ngijDiQu7POJ@mail.gmail.com>
	<4C804878.4060204@taitradio.com>
	<AANLkTimSiMkabHG_VzXJBWfDxXZcgbzfTt46pbJ7ryWK@mail.gmail.com>
	<AANLkTikV8sS4FiQP2-PJAmy3AZa+Wpx1VE2F6v+G=fpB@mail.gmail.com>
Date: Fri, 3 Sep 2010 00:26:17 -0700
Message-ID: <AANLkTi=kw=E0A1QcqNRFyRADBz7KpqooEPe56pW70XzZ@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Does the OS make a difference?
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
X-List-Received-Date: Fri, 03 Sep 2010 07:26:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I figured as much but was worth asking :P I hate reinstalls, thanks as
always though.

Side note though I finally got my first recipe to almost work it
creates an ipk and i can install to an existing image but the program
doesnt run right so I messed up configuring it but I am getting closer
to getting a grasp for once. Now if I can just figure out whats giving
me my last couple errors on the image I want and then go back to
figure out how to get the packages that wont build that i need to
build from the existing recipes.




On Thu, Sep 2, 2010 at 10:05 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> As with any operating system, I would recommend a clean install. IME,
> upgrades always leave cruft.
>
> It's easy enough to get a list of installed packages
> http://www.arsgeek.com/2006/09/19/ubuntu-tricks-how-to-generate-a-list-of=
-installed-packages-and-use-it-to-reinstall-packages/
>
> git rid of any version numbers and diff that against the new clean instal=
l
>
> You'll likely want to backup /home, /opt, /usr/local/.
>
> I'm going to go ahead and give it a try on my development box at home and
> see how it goes.
>
>
> Ironically, my goal is to replace my web dev box at home with the gumstix
> and nodejs.
>
> AJ ONeal
>
>
> On Thu, Sep 2, 2010 at 7:58 PM, J. L. <vwyodapink@gmail.com> wrote:
>
>> Do you know if doing a standard method of upgrading would be ok or
>> should I start from a full clean install? Thanks
>>
>>
>>
>> On Thu, Sep 2, 2010 at 5:59 PM, Douglas Royds
>> <douglas.royds@taitradio.com> wrote:
>> > On 03/09/10 05:19, J. L. wrote:
>> >>
>> >> I would be interested to know as well I am building on 9.10 and seem
>> >> to get more errors than those building on 10.04 or 10.10 with 64 bit
>> >>
>> >>
>> >>
>> >> On Thu, Sep 2, 2010 at 8:46 AM, AJ ONeal<coolaj86@gmail.com> =A0wrote=
:
>> >>
>> >>>
>> >>> It would be worth it to upgrade from Ubuntu 8.10 to 10.04 if it real=
ly
>> >>> makes
>> >>> a difference... but it would take time and disrupt workflow and
>> otherwise
>> >>> provide little advantage.
>> >>>
>> >
>> > As an aside, you should both be aware that neither 9.10 nor 8.10 are
>> "LTS"
>> > (long-term support) Ubuntu releases. As such, Ubuntu are no longer
>> > back-porting security fixes.
>> >
>> > I recommend that you both upgrade to 10.04 LTS. Ubuntu will support 10=
.04
>> > for 3 years (ie. until April 2013).
>> >
>> > Douglas.
>> >
>> >
>> >
>> >
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > This email, including any attachments, is only for the intended
>> > addressee. =A0It is subject to copyright, is confidential and may be
>> > the subject of legal or other privilege, none of which is waived or
>> > lost by reason of this transmission.
>> > If the receiver is not the intended addressee, please accept our
>> > apologies, notify us by return, delete all copies and perform no
>> > other act on the email.
>> > Unfortunately, we cannot warrant that the email has not been
>> > altered or corrupted during transmission.
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


