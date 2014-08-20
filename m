Return-Path: <jefro.net@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id C2F5F65D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 17:10:48 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id 10so6950416lbg.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=XoQt8GKwufYYhJG0mjaZUzQNKansa/hlXY7HECmkQ2Q=;
	b=N1clwuhHeUjtOeTYAOqpeNcQTCA9maqLxiDGwOiDQ6Q1UcAOFk8p3SVlCiXdR5CVjy
	ECfrk4AT4Lsn9zSDHjEZyMXuK2ABgXIjRH9XT68EYYybS7JEANphgVCSdQRRPRNgC3Gv
	QL+sTv9S2J3LO7MORucH9mBzUlHPdN1OS74H3EbZJaYfLDq+/4q9+hBhTubb7tGhxpn1
	9nYB8S7E9p/+sxV7AzERAzW759Zp5O7GFwGW6XqGu1l7Gc2Pifk1G+dRZ+9c9+axfR/v
	LI5yQlPW3sVHm42zXJYx2jHIERgnDDalr6SdFQC2QyrVhAagZrj3O9EymejUYwQTOp9o
	nUIA==
X-Received: by 10.112.158.199 with SMTP id ww7mr41838352lbb.71.1408554648981; 
	Wed, 20 Aug 2014 10:10:48 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.112.89.229 with HTTP; Wed, 20 Aug 2014 10:10:28 -0700 (PDT)
In-Reply-To: <2672016.IYeOSQvT8c@peggleto-mobl5.ger.corp.intel.com>
References: <CALZ2gZUPQD9irvcfL5EvtMK=cokRj8n9KSW5nzsP_BgiTCfscw@mail.gmail.com>
	<53F479A1.7050903@balister.org> <53F47D26.7000204@topic.nl>
	<2672016.IYeOSQvT8c@peggleto-mobl5.ger.corp.intel.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Wed, 20 Aug 2014 10:10:28 -0700
X-Google-Sender-Auth: UbJ0apm71vNtjSlSYmFQMfGebNM
Message-ID: <CA+YB3ra1y_Q-Rp3RgQ3h-3eo56KYscGuvVRLwk546-rCwdq5Gg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Community Demo Area at ELCE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Aug 2014 17:10:50 -0000
Content-Type: text/plain; charset=UTF-8

At the risk of repeating what Paul and Philip have already said, yes,
it is definitely open to all OE users.

On Wed, Aug 20, 2014 at 4:01 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Mike,
>
> Short answer: Yes, it's open to OE
>
> Long answer: Since "Yocto" (more pedantically, Poky, the reference build
> system) *is* just OE-Core plus docs and some minor customisations - yes ;)
>
> Cheers,
> Paul
>
> On Wednesday 20 August 2014 12:49:10 Mike Looijmans wrote:
>> Is this solely for Yocto or is it good enough to have used "plain"
>> OpenEmbedded?
>>
>> If "plain" is enough, I can probably bring some stuff to interact with :)
>>
>> M.
>>
>> On 08/20/2014 12:34 PM, Philip Balister wrote:
>> > FYI. Bring your toys.
>> >
>> > Philip
>> >
>> >
>> > -------- Original Message --------
>> > Subject: [yocto] Community Demo Area at ELCE
>> > Date: Tue, 19 Aug 2014 17:50:37 -0700
>> > From: Osier-mixon, Jeffrey <jeffrey.osier-mixon@intel.com>
>> > To: yocto@yoctoproject.org <yocto@yoctoproject.org>
>> >
>> > At the Embedded Linux Conference in San Jose, CA USA this past spring, we
>> > had six great demos in the Yocto Project booth. However, only two of those
>> > were demos that we arrived with. Four were from community members who
>> > spontaneously showed up, including a homebuilt audio player (hi nerdboy)
>> > and we thank them very much for their support and willingness to share.
>> >
>> > As a response to that, the Yocto Project would like to invite Embedded
>> > Linux Conference Europe* participants to bring your projects to the Yocto
>> > Project booth if you'd like to show off your work. We will have a screen,
>> > keyboard, mouse, and power available. Small embedded projects are best,
>> > but
>> > if you have a scale robotic dinosaur or a Yocto-powered Lamborghini, we
>> > won't turn you away. (Probably.)
>> >
>> > Please RSVP to me directly and let me know when to expect you.
>> >
>> > If there is enough interest, we can also set up a table at lunchtime at
>> > the
>> > Yocto Project Developer Day** following ELCE.
>> >
>> > *
>> > http://events.linuxfoundation.org/events/embedded-linux-conference-europe
>> > **
>> > https://www.yoctoproject.org/tools-resources/events/yocto-project-develope
>> > r-day-elce-2014
>> Met vriendelijke groet / kind regards,
>>
>> Mike Looijmans
>>
>> TOPIC Embedded Systems
>> Eindhovenseweg 32-C, NL-5683 KH Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: (+31) (0) 499 33 69 79
>> Telefax:  (+31) (0) 499 33 69 70
>> E-mail: mike.looijmans@topic.nl
>> Website: www.topic.nl
>>
>> Please consider the environment before printing this e-mail
>>
>> Bezoek ons op 9 en 10 september tijdens Technology for Health Den Bosch
>> (stand 53) http://www.technologyforhealth.nl
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Jeff Osier-Mixon @Intel
Yocto Project Community Manager http://yoctoproject.org

