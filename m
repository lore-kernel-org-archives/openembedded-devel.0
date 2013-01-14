Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TutX0-0007KH-Mz
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jan 2013 00:33:31 +0100
Received: by mail-vc0-f180.google.com with SMTP id p16so4049437vcq.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 15:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PkxHSdjcAr6tUms/HjBqkM5XPeevQKhcxwbLofLsmJs=;
	b=qHiYpSufylq75sJZ2nr4wsc4himXYBUCd8MkCoiOElSM2DGaj3+S1393fRyQ4w493m
	czIR20Gddx9j866LgVa6HTdEABM7nhCRwCNsmb1JCds6O5TZRaUfa5Cmm9QTManIvWYr
	LiZapPEB5/2t/4zuTzGf+1mnP4WFSvNHQn1dDFLdTKg4D/DPSYTv3YxM66klfpPf95bI
	myrXmSmA7N+rOo8Jkb/8uNt0OfbUqZw064DHXrmGYAa3FwL1jwDosmhgeqOtIqiNzSEY
	TYVTEaP2e3S5Thk0k5NeWNZCq/A0q0IhWTURmJndTIi/pBeLH0ABbbGQNWEAyt648Jn8
	zkKg==
MIME-Version: 1.0
Received: by 10.52.94.113 with SMTP id db17mr91849146vdb.27.1358205490846;
	Mon, 14 Jan 2013 15:18:10 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 14 Jan 2013 15:18:10 -0800 (PST)
In-Reply-To: <1877450.6sZ4HM91lS@helios>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
	<2159085.vty0yDIBH9@helios>
	<CAF6bG8ewV-MJArsCy799uW55nU7ftwJiYoga95rq5CeqEhY8EA@mail.gmail.com>
	<1877450.6sZ4HM91lS@helios>
Date: Tue, 15 Jan 2013 00:18:10 +0100
Message-ID: <CALbNGRR-UvH9q4jCWC0_VEWtG=OmUYCjuUcJLNmA+TH99GV=1A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-multimedia 0/2] games preparations
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
X-List-Received-Date: Mon, 14 Jan 2013 23:33:31 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 14, 2013 at 5:49 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 14 January 2013 16:36:05 Marko Lindqvist wrote:
>> On 14 January 2013 15:34, Paul Eggleton <paul.eggleton@linux.intel.com
>> wrote:
>> > There is a meta-games FYI, I think this is possibly where these recipes
>> > ought to have gone.
>>
>>  They actually are there at the moment. But as I have considered them
>> not games specific, they have been marked as something that lives
>> there only temporarily until they can be properly introduced to more
>> general layers. I guess Andreas has been working on that basis. My bad
>> for not checking from generic layers if they would be accepted.
>>  So, what's the concensus. Should they be removed from meta-games as
>> they are in general layer, or should they be moved from staging area
>> of meta-games to official game libraries area?
>
> I would have thought we should consider meta-games to be the canonical place
> for gaming-related recipes.
>
Then send a patch to kick them out.

Andreas


