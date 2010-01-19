Received: from mta3.brinkster.com ([65.182.109.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1NXF3s-00004x-FE
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 15:28:08 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta3.brinkster.com (Postfix) with ESMTP id 7B8085B0856
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 09:25:49 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
Received: from mta3.brinkster.com ([127.0.0.1])
	by localhost (mta3.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reT2fAzORDLJ
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 09:25:44 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta3.brinkster.com (Postfix) with ESMTP id D50735B071A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 09:25:43 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <4B54F654.4000500@atmel.com> <4B55B26C.5040706@gmail.com>
	<023001ca9911$809fa3c0$81deeb40$@Willis@Distant-earth.com>
In-Reply-To: <023001ca9911$809fa3c0$81deeb40$@Willis@Distant-earth.com>
Date: Tue, 19 Jan 2010 14:25:22 -0000
Message-ID: <023d01ca9913$3cddd600$b6998200$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcqZCrKuX8ibetCoQHyusFtrVzVsqgAAHFDAAAH2piA=
X-SA-Exim-Connect-IP: 65.182.109.72
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Angstrom: x11-gpe-image : Calibration of Screen ?
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
X-List-Received-Date: Tue, 19 Jan 2010 14:28:08 -0000
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us

> I started to work on a fresh reimplementation of that code to return
> calibration information that could be fed into either xinput evtouch =
or
> xinput evdev (if you use a recent version of either driver that
> supports calibration for TS devices). I never finished the
> reimplementation work so a lot of the code is still the original un-
> credited code.

Typical,

All the funky work in =
http://www.freedesktop.org/wiki/Software/xinput_calibrator make any 2bit =
hacky code rather irrelevant. Time to get xinput_calibrator into OE :).=20

Thanks for the pointers to this app guys.

John




