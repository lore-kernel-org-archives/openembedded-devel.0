Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <foolshperson@gmail.com>) id 1OEHZO-0007YR-R5
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 09:50:31 +0200
Received: by gya1 with SMTP id 1so2429520gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 00:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:reply-to:date
	:message-id:subject:from:to:content-type;
	bh=2krQlD7IGv+EKX3yB/Nm0hkYjfQ6lKMe4b0kUB5hyIc=;
	b=v/NLbSKoBcsGuPsLiZPN/0cT2dB0I6fsdDIsWFtakVdmerRWo0YFy4Iuam2VA/TDhe
	8Sy1N6gIqjU2GRoj0lhczMtOuLo8seRqD+NDanwvxi74hoUHAKBbOnDq+1A3DhzoKFwz
	pGHlrozMFdo0Dq3FIhI4swltiLyr+yS5mmXvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:reply-to:date:message-id:subject:from:to:content-type;
	b=RJfQobM+ucclZQ2ogrHUkVNhMSJeRYyo5AojJqps2pWJrG+nUny3DCo5UXVk7c7TNs
	ORTjsY8F4cLTQrNBjmyVy0pqOC/T9uWelBeu9ohirYH2sH9yJim8JIt+HnGU2wBySqcb
	9hpFFOOP75P8YYFEYylegY+Z7U0FUo2FseHUY=
MIME-Version: 1.0
Received: by 10.91.8.20 with SMTP id l20mr2611821agi.52.1274168789689; Tue, 18 
	May 2010 00:46:29 -0700 (PDT)
Received: by 10.90.27.20 with HTTP; Tue, 18 May 2010 00:46:29 -0700 (PDT)
Date: Tue, 18 May 2010 02:46:29 -0500
Message-ID: <AANLkTilMTQc7waguDtvxQ9oUx0rmXBwtJ0LwtQ5RwHna@mail.gmail.com>
From: benjamin brown <foolshperson@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: foolshperson@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: many devices to test your code
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
X-List-Received-Date: Tue, 18 May 2010 07:50:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Open Embedded,
     I just wanted to introduce myself and tell you what I bring to OE. My
name is Ben, my handle is foolsh, I am 32, a big Linux fan and have had at
least one computer in my bedroom since I was 8 but mostly two or three at a
time. As far as programing goes I haven't really done any thing top to
bottom since I was 17 and wrote a 3d engine in BASIC from scratch. I count
myself lucky to work at an electronics recycling outfit as the "IT" guy
repairing and refurbishing everything under the sun, more or less, for
resale. I  see various different types of hardware only your imagination
could adequately describe to you.  I haven't had time to jump in and learn
as much as I would like too about programing C. I do however dabble and
learn as I go. I was cutting my teeth on Rockbox and loved the simple layout
of the code there,  but after my mp3 player bit the dust, it lost its appeal
to me. I'm not completely new to linux running on hand helds I have
installed some of the various distributions like jlime and familiar on more
than one or two devices.

 So as far as the nitty gritty goes, I have for some time been collecting
hand helds of various models and condition from where I work.  Since I can't
really help code any thing for now,  I want to offer my time building,
testing and reporting. If anyone knows of good place to get some good info
for testers please drop a link or two. That being said I guess I should seek
out some one to gain an account so I can help at the OE wiki.

I love the idea of this centralized method to building linux for hand helds.
A problem I ran into when building is all about choice, the lack of a
defacto standard issue distro for hand helds has kind of thrown me a curve
ball, not knowing where to start to sort of say. On the PC platform I feel
debain has achieved this status or at-least to me it has. I see the need for
a similar thing on the hand held  scene.

I have not put together a OE build box yet and I'm looking for some
suggestions for which operating system to use. I'm leaning toward ubuntu but
want to know what you all think first.

Working devices I can test your code on. At work I get at least one hand
held device a month sent in my direction.
HP 660LX jordania
HP RX3115
Ipaq H3630
Ipaq H3650
Ipaq H3765
Ipaq H3850 times two, along with one cf sleeve and one pcmcia sleeve with
many various 16 bit cards.
Axim X5 times three
Axim X50
Axim X50v times two
Axim x51

Devices I hope to add to the working list but need parts.
T-mobile branded Wallaby PW10B1 - needs power connector.
HP HX4700 - need power connector but might be the same as the Wallaby.
HP H2200 - needs battery comes on briefly for a second without one when plug
in.
CASIO E-125 - I should be able to dig up a 3v power adapter from work its a
standard power connection - post and sleeve type.

Devices with broken screens I just can't throw them to the e-waste scrapers
at work they could be part donors one day.
HP H5550 and a HX2750

It seems when people toss these in the recycling bin they always forget the
cords and adapters ugh.

I would be happy to build and test anyone's code on these devices, I know
there exist some code that runs specific devices like jlime for the jordania
and familiar for the ipaqs. But if your working on a unified xorg based
distro that runs on a wide range of devices I would be happy to work
exclusively with you. If no one is working on such an animal may I suggest
someone rally the troops in that direction, to do so seems only logical to
me. The devices I have more than one of, because the fear of bricking them,
I would be glad to test ways of permanently flashing linux to them if any
one is working on that sort of thing anymore.

For those who would like to contact me off the mailing list my email is
foolsh(dot)person@gmail(dot)
com, cheers

