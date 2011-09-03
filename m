Received: from 6.mo4.mail-out.ovh.net ([188.165.36.253]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Qzlw3-0007Rt-3L
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Sep 2011 10:50:43 +0200
Received: from mail92.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id EA669FFA51A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Sep 2011 09:30:30 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 3 Sep 2011 09:30:28 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.9?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 3 Sep 2011 09:30:28 +0200
Message-ID: <4E61D794.9050602@eukrea.com>
Date: Sat, 03 Sep 2011 09:30:28 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
References: <1314962732.3526.32.camel@mattotaupa>
	<1314976910.3526.36.camel@mattotaupa>
	<1314989318.17121.11.camel@lenovo.internal.reciva.com>
	<201109022129.26555.schnitzeltony@gmx.de>
	<j3ri5g$dal$1@dough.gmane.org>
	<1315000152.6109.14.camel@mattotaupa>
In-Reply-To: <1315000152.6109.14.camel@mattotaupa>
X-Ovh-Tracer-Id: 15534041015159467337
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.500011/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrudeiucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenuc
Subject: Re: Please merge lists openembedded-devel and openembedded-core again.
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
X-List-Received-Date: Sat, 03 Sep 2011 08:50:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 02/09/2011 23:49, Paul Menzel a =E9crit :
> Am Freitag, den 02.09.2011, 23:34 +0200 schrieb Koen Kooi:
>> Op 02-09-11 21:29, Andreas M=FCller schreef:
>>> I would even prefer having additional meta-oe list separated from
>>> oe-dev.
>>
>> If there's enough need for it, that can get arranged.
>
> Why should that be needed? Maybe proposals could be explained and backe=
d up
> with arguments for a discussion.
>
having a list for legacy oe and a list for new oe seems reasonnable : tha=
t's
not the same thing and legacy oe development is no more active (and activ=
ity=20
on the mailing list doesn't really show that oe legacy is dead).

And when a user has understood were to find layers, how to work with all =
these
layers, where are the recipes he needs in all the layers' directory tree,=
 what=20
is the logic (or its absence) to classify recipes, how to customize them =
to=20
its need, and how to find in all that mess what broke something which was=
=20
working before the last pull, I'm sure he has the knowledge to subscribe =
to=20
the list of the layers he is using in order to follow their development ;=
-)

Eric


