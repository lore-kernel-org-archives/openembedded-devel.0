Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iis4I-0003Ad-DR
	for openembedded-devel@openembedded.org; Fri, 19 Oct 2007 15:39:14 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9JDWDUo003353 for <openembedded-devel@openembedded.org>;
	Fri, 19 Oct 2007 15:32:13 +0200
Message-ID: <4718B1E3.8050602@student.utwente.nl>
Date: Fri, 19 Oct 2007 15:32:19 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1Iinn8-0004il-BP@linuxtogo.org>	<74d0deb30710190309s4c794a0gbb960a983ce41c9e@mail.gmail.com>
	<4718A147.4000306@student.utwente.nl>
In-Reply-To: <4718A147.4000306@student.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev	conf/distro/include/angstrom-2007-preferred-versions.inc: add	file for locking down almost every package
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
X-List-Received-Date: Fri, 19 Oct 2007 13:39:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> pHilipp Zabel schreef:
>> On 10/19/07, koen commit <openembedded-commits@lists.openembedded.org> wrote:
>>> conf/distro/include/angstrom-2007-preferred-versions.inc: add file for locking down almost every package
>>>
>>> ** THIS WILL BE INCLUDED SOON -- REVIEW IT!!! **
>> [...]
>>> +PREFERRED_VERSION_bochs ?="2.1"
>>> +PREFERRED_VERSION_bogofilter ?="0.96.0"
>>> +PREFERRED_VERSION_bonnie ?=""
>> bonnie++ ?
> 
>> [...]
>>> +PREFERRED_VERSION_dbus ?="1.0.2"
>>> +PREFERRED_VERSION_dbus-c ?=""
>>> +PREFERRED_VERSION_dbus-c ?=""
>> dbus-c++ ?
> 
> yeah, it breaks on any PV with a '+' in it :(

PN that is

/me gets some more coffee
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHGLHjMkyGM64RGpERAkWgAKCc+y3nDH6mN9Fggir421CBFEwWNACgh30G
tGSGKxsXsAviiY0HSeT/f0w=
=xiw9
-----END PGP SIGNATURE-----


