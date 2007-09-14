Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IW7ln-0002F5-Uw
	for openembedded-devel@openembedded.org; Fri, 14 Sep 2007 11:47:28 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8E9i0xW015739 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2007 11:44:01 +0200
Message-ID: <46EA57E9.4020202@dominion.kabel.utwente.nl>
Date: Fri, 14 Sep 2007 11:44:09 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200709111318.52432.openembedded@haerwu.biz>	<46E78180.1050907@student.utwente.nl>	<46EA3685.2040809@student.utwente.nl>
	<200709141122.31734.openembedded@haerwu.biz>
In-Reply-To: <200709141122.31734.openembedded@haerwu.biz>
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l8E9i0xW015739
X-Mailman-Approved-At: Fri, 14 Sep 2007 11:54:12 +0200
Subject: Re: Splitting up bluez in a sane way, was Re: Task-base is big :(
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2007 09:47:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz schreef:
> Dnia pi=C4=85tek, 14 wrze=C5=9Bnia 2007, Koen Kooi napisa=C5=82:
>=20
>> What can be done is to make the default bluez-utils build only build
>> bluez-utils* and have seperate recipes for all the 3rdparty stuff it
>> builds:
>=20
>> That would solve both buildtime and runtime issues.
>>
>> What do you think?
>=20
> bluez-utils-cups, bluez-utils-gstreamer, bluez-utils-alsa? Sounds good =
for=20
> me - especially first both.


bluez-utils-cups and bluez-utils-alsa can be done for sure, but I haven't=
 looked at where
gstreamer comes in and if it can be a seperate package.

regards,

Koen


