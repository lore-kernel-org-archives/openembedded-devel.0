Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SxmWP-0000cE-IZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 00:08:33 +0200
Received: (qmail 4334 invoked by uid 1003); 4 Aug 2012 21:56:50 -0000
Received: from unknown (HELO ?10.212.226.128?) (philip@opensdr.com@98.191.4.50)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	4 Aug 2012 21:56:49 -0000
Message-ID: <501D9A9B.6040406@balister.org>
Date: Sat, 04 Aug 2012 17:56:43 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jvk13l$nh$2@dough.gmane.org>
	<CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Sat, 04 Aug 2012 22:08:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2012 04:47 PM, Khem Raj wrote:
> On Sat, Aug 4, 2012 at 1:36 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>
>> As said before, this class isn't angstrom specific and it won't move back to
>> angstrom.
>
> koen no one else is using it other than angstrom. but it interferes
> with similar class from OE-Core
> so essentially you want to keep a feature thats just used by angstrom
> in a non angstrom layer?
> doent sound logical to me. Would it be acceptable if angstrom used
> this feature from OE-Core as well ?
> then it will remove the usecase completely.

If Angstrom is the only user and no one else is asking for it, it is 
Angstrom specific for all intents and purposes.

Philip

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


