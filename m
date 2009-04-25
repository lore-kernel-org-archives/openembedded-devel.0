Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Lxmwr-0004Ys-3x
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 20:50:01 +0200
Received: by ewy20 with SMTP id 20so1440425ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 11:45:07 -0700 (PDT)
Received: by 10.210.82.2 with SMTP id f2mr691772ebb.75.1240685107447;
	Sat, 25 Apr 2009 11:45:07 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 7sm3622426eyb.55.2009.04.25.11.45.05
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Apr 2009 11:45:06 -0700 (PDT)
Message-ID: <49F35A2B.7070907@xora.org.uk>
Date: Sat, 25 Apr 2009 19:44:59 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090425075933.E6E18188456@amethyst.openembedded.net>	<200904251540.40566.mickey@vanille-media.de>	<be7a9f3d0904251117p5b0df982wb20f861bb90d9270@mail.gmail.com>
	<200904252034.35801.mickey@vanille-media.de>
In-Reply-To: <200904252034.35801.mickey@vanille-media.de>
X-Enigmail-Version: 0.95.0
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sat, 25 Apr 2009 18:50:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> On Saturday 25 April 2009 20:17:22 Otavio Salvador wrote:
>   
>> This all is not a justification to break the whole World at dev. dev will
>> be the basis of next stable, and even more, it is the source of changes
>> for stable. So if we mess it up we'll end up with an very difficult to
>> maintain stable branch and an unusable dev.
>>     
>
> Yes, and I agree with all that, however there is the need to balance between 
> breaking everything and letting everything through. If -- like it is happening 
> right now -- people are paranoid about upgrade paths, then .dev moves to 
> something where no actual development happens.
>
> If you want to move forward, you will have to allow breakage now and then. 
> This is the way with all projects. If you don't allow that, people will move 
> elsewhere with their contributions and .dev will get stale rather than stable.
>
>   
In this case was it actually necessary to change the names?

I'm afraid I try and ignore E stuff as much as possible so I am totally
unclear about its state of development.

Graeme



