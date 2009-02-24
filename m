Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Lc5gi-0000jm-E2
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 23:23:40 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 64B904BE85; Tue, 24 Feb 2009 23:20:36 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRWVFwAXS0=
Message-ID: <52702.AFRWVFwAXS0=.1235514035.squirrel@webmail.no-log.org>
In-Reply-To: <20090224185059.GL2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<8763izyarp.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>
	<20090224185059.GL2172@smtp.west.cox.net>
Date: Tue, 24 Feb 2009 23:20:35 +0100 (CET)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 22:23:40 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> On Tue, Feb 24, 2009 at 08:36:35PM +0200, Ihar Hrachyshka wrote:
>> On Tue, Feb 24, 2009 at 8:01 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>> > Michael 'Mickey' Lauer <mlauer@vanille-media.de> writes:
>> >
>> >> Am Montag, den 23.02.2009, 23:46 -0700 schrieb Tom Rini:
>> >>> I'm going to make a different suggestion. =A0Lets just drop it.
>> >>
>> >> I'm in favour of this. I don't think they give us the safety we wan=
t
>> and
>> >> they introduce more inconvenience.
>> >
>> > After reading the thread I'm also in favour of this.
>>
>> If you guys don't need it then just disable this checksum feature. No
>> problem.
>
> This misses the point.  We're trying to get things to the point (and
> keep them there) where the default case is things working well.  I and
> others are arguing that the checksum feature is at best a lazy way to
> check only for files changing and not their correctness.  I'm not sayin=
g
> we don't need a feature to check for correctness, I'm saying what we
> have now doesn't.
Maybe that should go into the manual:
user have to edit their local.conf so why not adding one more line in it
if they wish not to be bothered by checksums.
(you could also tell the same thing for the check of the checksums not
beeing the default...)
Denis.



