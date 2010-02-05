Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kirtibr@gmail.com>) id 1NdDBm-0005Es-9G
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 02:40:57 +0100
Received: by gxk7 with SMTP id 7so3969745gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2010 17:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=1xUV9LGVPI/7LScUA20CY34XnMYvtpYD7ra1uZElq7g=;
	b=bBpHLPjNLM746CYWMDhV7nyPpDXHyb0bdKZxIf1C6i0N8qhDut2xNNVU1riDxOrC2z
	60+g/Q1FtHsjDwAEoZNw6M6e3Iw5Ij7qKaJSORR8LpgOCodXgScU2q3gWvCvjqbQCnwF
	36gtYe1ROr6/TWqDe6pD/wSSKnuYLUOThhoUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=iRJa/dTKYyInkkFlhqFjdlCaUe1ZY33BivdbpPIxHKETLWwPP3tElNSqn0p1fKFQHf
	kURavohb1m5aeHJzW1quNfHhw7TvC8DynXA4d7QBHvJuZDMQpP1NBCR6FJSOAuG36dIp
	ng8HHPFqJCRdBFSBveznGKzlPXtWlrWuAkk7U=
MIME-Version: 1.0
Received: by 10.150.235.3 with SMTP id i3mr3118608ybh.332.1265333903712; Thu, 
	04 Feb 2010 17:38:23 -0800 (PST)
Date: Fri, 5 Feb 2010 07:08:23 +0530
Message-ID: <64d5b90a1002041738g26ab1892uebf6a46e77ca88ac@mail.gmail.com>
From: Kirtika Ruchandani <kirtibr@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: kirtibr@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OpenEmbedded in GSoC 2010
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
X-List-Received-Date: Fri, 05 Feb 2010 01:40:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,
Sorry for spamming developers not interested/concerned with GSoC[0]
and to those who saw my post on Planet LinuxToGo, sorry for the
repetition, but I need to make a point or two more here.

As a student who worked on OE for a GSoC project last year and someone
who has been working with OE for two years now, I sent out a  mail to
the Google Summer of Code admin advocating for acceptance of  Open
Embedded in GSoC 2010. The response by the program manager, Leslie
Hawthorn seemed pretty good.

For developers who believe this might be a good idea for OE, I would
urge you to spend a couple of minutes checking the links [1] and [2].
The latter is a document specifying the criteria selected mentoring
organizations should ideally meet.

What I am happy to note is that OE fulfills most of the criteria
pretty well. I have listed brief reasons for those later in this mail.
But the only thing that is missing and what forms the purpose of this
mail - is a good ideas list. Since we fulfill all other criteria very
well, if we are able to make use of the next one month in coming up
with a list of good ideas and mentors, we stand a good chance of
getting accepted.

<emphasis>
If developers on this list agree to this, we should probably start off
a call for ideas somewhere on the wiki. (which currently for some
reason does not give me any option to create new pages)
</emphasis>

Below is the  complete list of criteria the link in [2] mentions. Any
additions to the points below are most welcome.


/-----/

Mentoring Organization Criteria :

*  Have you been in GSoC before and done well?
OE was in GSoC in 2006 under handhelds.org. As to the "done well"
part, perhaps the people who were involved then can tell us more ?

* Ideas list - do you a well-organized list with feasible ideas ?
We need to work on this.

* Do we use your software, or do we know someone who raves about it ?
We can quote a lot of stuff here (Montavista, Palm's WebOS) , but a
good example would be Openmoko, since they know the Openmoko people
were involved in earlier GSoC versions.

* Do we have a relationship with your developer community ? Have they
been recommended to us  by folks we trust ?
Here again, we should have a lot to quote. People I can recall off the
top of my head, who have already been associated with other GSoC
mentoring organizations include Florian Boor (Maemo in 2009,
handhelds.org in 2006), Mickey Lauer (Openmoko 2008) , Koen Kooi
(handhelds.org in 2006?) and so on. Quite a few developers here have
strong connections with other well-known FOSS communities.


* Is the project community well-established ?
Would be great if someone can confirm that OE is about 7 years old now.
A ~100 something community with commits at hourly frequencies should speak
for itself otherwise.


/------/

Greetings,
Kirtika Ruchandani


[0]  Google Summer of Code: http://code.google.com/soc/

[1]  Some arugments on why OE in GSoC is a good idea and what needs to
be done: http://rkirti.wordpress.com/2010/01/28/getting-openembedded-accepted-for-gsoc-2010/

[2]  Guidelines/Criteria for projects wanting to apply as mentoring
organizations:
http://socghop.appspot.com/document/show/program/google/gsoc2009/orgcriteria

-- 
Kirtika Ruchandani
Third Year Undergraduate Student
Dept. of Computer Science,
Indian Institute of Technology, Madras


