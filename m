Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HaWBD-0006he-2m
	for openembedded-devel@openembedded.org; Sun, 08 Apr 2007 14:07:35 +0200
Received: from [130.89.6.162] (vpn006162.vpn.utwente.nl [130.89.6.162])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l38C7VLr001926 for <openembedded-devel@openembedded.org>;
	Sun, 8 Apr 2007 14:07:32 +0200
Message-ID: <4618DAFF.3080701@dominion.kabel.utwente.nl>
Date: Sun, 08 Apr 2007 14:07:27 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46176E51.2030608@dominion.kabel.utwente.nl>	<CD2A5546-06FC-414A-9C74-FB640EBFC4A5@selfish.org>	<4617753E.409@dominion.kabel.utwente.nl>
	<D93C49B4-4326-49E1-981A-C3EA65F49070@selfish.org>
In-Reply-To: <D93C49B4-4326-49E1-981A-C3EA65F49070@selfish.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Sun, 08 Apr 2007 12:07:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
> Am 07.04.2007 um 12:41 schrieb Koen Kooi:
> 
>>> , is there a documentation
>>> which tasks to add and link to unbreak rm_work (if it breaks).
>> No idea, Marcin?
> 
> 
> NOTE: package sjf2410-linux-native-20060807-r1_0: task do_rm_work:  
> started
> NOTE: package sjf2410-linux-native-20060807-r1_0: task do_rm_work:  
> completed
> NOTE: package sjf2410-linux-native-20060807-r1_0: task do_deploy:  
> started
> ERROR: function do_deploy failed
> ERROR: log data follows (/home/friedrij/src/moko/mokomakefile/trunk/ 
> build/tmp/work/i686-linux/sjf2410-linux-native-20060807-r1_0/temp/ 
> log.do_deploy.27169)
> | install: cannot stat `sjf2410': No such file or directory
> NOTE: Task failed: /home/friedrij/src/moko/mokomakefile/trunk/build/ 
> tmp/work/i686-linux/sjf2410-linux-native-20060807-r1_0/temp/ 
> log.do_deploy.27169
> NOTE: package sjf2410-linux-native-20060807-r1_0: task do_deploy: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package sjf2410-linux-native-20060807: failed
> ERROR: Build of openmoko-devel-image faile

AFAIK, the sjf2410 recipe in OE, not in svn works[*]. I don't want to support buggy
external repos without getting paid.

regards,

Koen

[*] It built fine yesterday
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGGNq/MkyGM64RGpERAnu+AJ9tdnLxfQCgypKuOBQDyPjTFPrNgwCaAzQo
RbdyAhSTRNJ0co2QB26lg3g=
=bQWA
-----END PGP SIGNATURE-----


