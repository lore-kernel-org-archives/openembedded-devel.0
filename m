Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IO98N-0007RA-Ev
	for openembedded-devel@openembedded.org; Thu, 23 Aug 2007 11:37:47 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7N9aYj1002888 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 11:36:34 +0200
Message-ID: <46CD5539.9060701@dominion.kabel.utwente.nl>
Date: Thu, 23 Aug 2007 11:36:57 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <717ce6e40708230037r2bdd44f3v83180c286fbdd63c@mail.gmail.com>	<46CD5062.5050308@whitby.id.au>
	<948196528.20070823112701@vanille-media.de>
In-Reply-To: <948196528.20070823112701@vanille-media.de>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: 2007.2 compilation failed with package uicmoc4-native-4.0.3
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
X-List-Received-Date: Thu, 23 Aug 2007 09:37:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mickeyl@linuxtogo.org schreef:
> From OpenMoko-community:
> 
> Rod Whitby wrote:
>> Phani Kumar Kancharala wrote:
>>>  Hi all,  
>>>     I followed the steps in wiki-openmoko to get openmoko on my pc
>>> running Ubuntu 7.04 Feisty Fwan. Finally I also ended up with the same
>>> error reported by *Frank Gau, *following are the error and logs given by
>>> the mokomakefile:
>>>
>>> | kernel/qapplication_x11.cpp:89:31: error: X11/extensions/XI.h: No such
>>> file or directory
> 
>> Install the host software package which provides the XI.h file.
> 
>> It'll be some X11 extensions development package.
> 
>> Then update the OEAndYourDistro page on the openembedded wiki to
>> highlight that package as a requirement for your host distro.
> 
> Hmm, since when is uicmoc-native requiring X? If I recall correctly, I
> had always chosen to build the respective -embedded variant of Qt to
> not impose the need of having X on the build machine. It looks like we
> are now building qt-x11 as provider for uicmoc4. Why did we change that?

Because we needed the one from 4.3 which only has an x11 variant.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGzVU5MkyGM64RGpERAtpWAJwJ+KljRSHoJhclWjnxH5ZpBVlrFACfUYZx
dj/bkEUrcpD9725XdQfPioU=
=k3+2
-----END PGP SIGNATURE-----


