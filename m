Received: from n14.bullet.mail.mud.yahoo.com ([68.142.206.41])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <gagan2172@yahoo.com>) id 1NUj6q-00005Q-5t
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 16:56:47 +0100
Received: from [209.191.108.97] by n14.bullet.mail.mud.yahoo.com with NNFMP;
	12 Jan 2010 15:51:57 -0000
Received: from [67.195.9.82] by t4.bullet.mud.yahoo.com with NNFMP;
	12 Jan 2010 15:51:57 -0000
Received: from [98.137.27.219] by t2.bullet.mail.gq1.yahoo.com with NNFMP;
	12 Jan 2010 15:51:57 -0000
Received: from [127.0.0.1] by omp129.mail.gq1.yahoo.com with NNFMP;
	12 Jan 2010 15:51:57 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 541190.52303.bm@omp129.mail.gq1.yahoo.com
Received: (qmail 61304 invoked by uid 60001); 12 Jan 2010 15:51:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1263311517; bh=BNxrCE89DvipQ/wtL0RJ+DkGiVRIoE+j1pyLn7ICiXQ=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=Hf/PPcQwceZ7Jf9dp8LXYGCJp7Dah8GMxcueEzoZ5KbCAuVTrsyYrHhYV2Bt/8qHHqWNf2792gyh4cKEeNG33Po1pFXIT7kiRXpb4pRJfOkzxHJIKY9XphgLrpqkreZmT9ChxIcOilmZjdJ/DSUuVOFQn3OIiEplUcTohdWFj0U=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=p+Zn/LBbvikkv8CUT37UK2FhmfyfH/ILrjKviGzIVyDYk1hMxVlH5CM26oVid3yCGEUnhWUN8ST0oMSnQghJCN2SS6ALdFfcNC7mFMhkcVC+cdMNhOxRUed4HtNPkTSSuKQp0My9RbeAvVGN+/re3cLGntr/903/66e5AZMKmBk=;
Message-ID: <338689.59324.qm@web112510.mail.gq1.yahoo.com>
X-YMail-OSG: vibdlFQVM1nq0dKf3gJ_U3qwjggz76sY4fk6Qn1kOYYimf3XK8y3Tbzpc0UsTjKjyj7chSuq.gX.IOXBo2we6noMmnO2tLh4t8JbkMYagWXFTGeQWFEUqv1mccFZ2V9zjdt2b7qI0UqRz6P4RkACOMOcp8vyImhimM3V7o5N52tseX37Vw49YbiMX7qBsTclNgOij60oGgARqe54WuqD0rK7B1ySRhb.OdIwSA3TcM1eaRLMGElDI8F5v8_W7nI9TRsubfU8m.OJLwVSPhU8tGQfkbzFFUyk7NUEIWuR.R1qov2cMcZRHhsfIEThgN_VVu0PL0mARgksQ3LV1V0bO1ZrqsAt23vdZ3GPMXXDqyCD.4SLuVaCT87euEXo2KXcOxjXpY0bJRae7uLGUwnYUNz9NYBgOEq1HBQw3lmdRUAkLBWqJiDAD3e9cX8FPxSqwXXck9xMgMou6uo09sN4M2JPNu5rrtLC.rdgjW707ZG51tFuSgQ2aToc6F_4Av.uB58mq9uAhkbnS9jySjvGRGpRPiXm5TGYC4cA.d0rAWEZSGylGiNpZWW1JqmdojbhuF41WpJ6JzktZ5Mk9xi11dDQyAnpKI2xLCndkBtDEAVI5D3cC6Um.NrXig--
Received: from [62.254.217.177] by web112510.mail.gq1.yahoo.com via HTTP;
	Tue, 12 Jan 2010 07:51:57 PST
X-Mailer: YahooMailClassic/9.0.20 YahooMailWebService/0.8.100.260964
Date: Tue, 12 Jan 2010 07:51:57 -0800 (PST)
From: gagan singh <gagan2172@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263308775.3675.420.camel@mill.internal.reciva.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 68.142.206.41
X-SA-Exim-Mail-From: gagan2172@yahoo.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: =?UTF-8?B?UmU6IERvZXMgT0XigJlzIEFuZ3N0cm9tIExpbnV4IHN1cHBvcnQgU01QIChTeW1tZXRyaWMgbXVsdGlwcm9jZXNzaW5nKSBvbiBiZWFnbGUgYm9hcmQu?=
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
X-List-Received-Date: Tue, 12 Jan 2010 15:56:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Phil,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=20
I thought general response time of any general application time will be fa=
ster.
Say Just getting a feeling of running General purpose Computer OS/applicat=
ions =C2=A0on a 1 GHz =C2=A0processor while actually it is running on 500MH=
z CPU with SMP support(Keeping overhead time aside)
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DSP seems to =
remain idle most of the time while everything runs on Arm core.=C2=A0 You s=
ays difficult to implement on that sort Of Cores. Do the inter communicatio=
n link/memory interface =C2=A0is bottle neck for implementing shared worklo=
ad.
=C2=A0
regards
=C2=A0
Gagan


--- On Tue, 1/12/10, Phil Blundell <philb@gnu.org> wrote:


From: Phil Blundell <philb@gnu.org>
Subject: Re: [oe] Does OE=E2=80=99s Angstrom Linux support SMP (Symmetric =
multiprocessing) on beagle board.
To: openembedded-devel@lists.openembedded.org
Date: Tuesday, January 12, 2010, 10:06 AM


On Tue, 2010-01-12 at 06:57 -0800, gagan singh wrote:
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 Do the Angstrom version of Linux supports SMP for=C2=A0 Dual core (A8 =
+ TI DSP 320C64x) beagle board. If not, where I should look in tutorial to =
work on adding support for such a feature.
>=C2=A0 I try Google it but no much could be located.

I'm not quite sure what you are trying to do here.=C2=A0 It's hard to imag=
ine
how you could have any meaningful kind of "symmetric" multiprocessing on
that combination of cores.

What exactly are you hoping to achieve?

p.



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




From gagan2172@yahoo.com Tue Jan 12 16:56:53 2010
Received: from n14.bullet.mail.mud.yahoo.com ([68.142.206.41])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <gagan2172@yahoo.com>) id 1NUj6s-00005U-JD
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 16:56:50 +0100
Received: from [68.142.200.224] by n14.bullet.mail.mud.yahoo.com with NNFM=
P;
	12 Jan 2010 15:54:36 -0000
Received: from [76.13.13.26] by t5.bullet.mud.yahoo.com with NNFMP;
	12 Jan 2010 15:54:36 -0000
Received: from [67.195.9.81] by t3.bullet.mail.ac4.yahoo.com with NNFMP;
	12 Jan 2010 15:54:35 -0000
Received: from [98.137.27.213] by t1.bullet.mail.gq1.yahoo.com with NNFMP;
	12 Jan 2010 15:54:35 -0000
Received: from [127.0.0.1] by omp123.mail.gq1.yahoo.com with NNFMP;
	12 Jan 2010 15:54:35 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 569403.65405.bm@omp123.mail.gq1.yahoo.com
Received: (qmail 61443 invoked by uid 60001); 12 Jan 2010 15:54:35 -0000
DKIM-Signature: v
