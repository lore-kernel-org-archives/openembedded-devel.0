Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RXwau-0002jW-CV
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 16:06:08 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 76BDF4B0407
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2011 15:59:19 +0100 (CET)
Message-ID: <4EDE2DC6.7010003@eukrea.com>
Date: Tue, 06 Dec 2011 15:59:18 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <jbgcgc$tmh$1@dough.gmane.org>
	<1323030626-564-1-git-send-email-eric@eukrea.com>
	<1323069908.3449.4.camel@mattotaupa> <4EDC89EB.9080601@eukrea.com>
	<1323181873.4571.8.camel@mattotaupa>
In-Reply-To: <1323181873.4571.8.camel@mattotaupa>
Subject: Re: [meta-oe v4] add nostromo webserver
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
X-List-Received-Date: Tue, 06 Dec 2011 15:06:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Le 06/12/2011 15:31, Paul Menzel a =E9crit :
> Am Montag, den 05.12.2011, 10:07 +0100 schrieb Eric B=E9nard:
>> Le 05/12/2011 08:25, Paul Menzel a =E9crit :
>>> could you add the version number to the commit summary? That would be
>>> great. Also the OE-classic commit SHA sum would be useful.
>>
>> useful for what ?
>
> an as precise as possible commit summary is useful especially when
> viewing commit logs with one line.
>
And you manage to see the sha sum in a one line commit ?
Here my screen is not large enough.

>> in case someone wants details on this recipe in OE-classic he can simp=
ly do :
>> cd recipes/nostromo
>> git log
>> and he gets all the details.
>
> You assume everybody has a checkout of OE-classic.
Without a checkout of oe-classic, the sum of the initial commit is even m=
ore=20
useless (unles you have time to spend to search for the commit using a we=
b=20
browser).

> And besides that it is required by the the (OE-core) guidelines [1].
>
here we are talking of meta-openembedded and not oe-core so this rule doe=
sn't=20
seems to apply as you can see in a03a4083df90184fc1083b2f01952a50cfa51bca=
 or=20
in 09105b947abe5142dc21095664e0fca8fa0d4163

Eric


