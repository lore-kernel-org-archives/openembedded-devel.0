Received: from [84.16.208.26] (helo=banan.dataparty-mn.biz)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <nail@nslu2-linux.org>) id 1GKEOm-0003qE-WF
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 15:22:01 +0200
Received: from [10.0.0.6] (104.84-48-48.nextgentel.com [84.48.48.104])
	by banan.dataparty-mn.biz (Postfix) with ESMTP id E313413C1C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 15:19:21 +0200 (CEST)
Message-ID: <44FC280C.9070908@nslu2-linux.org>
Date: Mon, 04 Sep 2006 15:20:12 +0200
From: =?ISO-8859-1?Q?=D8yvind_Repvik?= <nail@nslu2-linux.org>
User-Agent: Thunderbird 1.5.0.5 (X11/20060728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [Fwd: Re: bitbake freeze]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2006 13:22:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable


Michael 'Mickey' Lauer wrote:
> Am Montag, den 04.09.2006, 00:28 -0700 schrieb Justin Patrin:
>> I just remembered the old "freeze" command that John Bowler wrote a
>> while ago and tried to use it. Unfortunately it doesn't seem to work
>> with the current OE.
>=20
> [...]
>=20
>> I realize the shell isn't really the right place for this and that
>> this might be nicer in a bb file somewhere but this is how I could get
>> it working.
>=20
> The shell is _exactly_ the right place for it -- since the command line
> parsing
> went so fast, we need to come up with new use cases ;)
>=20
>> Let me know what you think and any suggestions for making the code bet=
ter.
>=20
> I'm not familiar with the old freeze command (or I forgot it...), can
> you summarize
> what you want to achieve?
>=20
The old freeze command looked at what had been built, and made a config
file with a BBFILES variable that specified each specific .bb-file used
(eg. samba_3.0.20.bb, glibc_2.3.3+cvs20050420.bb, etc.). The effect was
more or less "freezing" the the build, making a release easier.

Regards,
=D8yvind Repvik




