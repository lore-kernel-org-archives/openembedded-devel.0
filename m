Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Gk0gO-0002bU-92
	for openembedded-devel@openembedded.org; Tue, 14 Nov 2006 16:58:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAEFudPF019666
	for <openembedded-devel@openembedded.org>; Tue, 14 Nov 2006 15:56:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19155-08 for <openembedded-devel@openembedded.org>;
	Tue, 14 Nov 2006 15:56:37 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAEFuaDV019656
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 14 Nov 2006 15:56:36 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4559BF79.1010806@dominion.kabel.utwente.nl>
References: <45566FBC.1030206@kernelconcepts.de>
	<45586AF5.8060800@kernelconcepts.de>	<45589A63.9030808@kernelconcepts.de>
	<200611131725.11432.openembedded@hrw.one.pl>
	<4558B5D3.2090609@kernelconcepts.de>
	<4558DA84.5030003@dominion.kabel.utwente.nl>
	<4559BC71.6050506@kernelconcepts.de>
	<4559BF79.1010806@dominion.kabel.utwente.nl>
Date: Tue, 14 Nov 2006 15:56:42 +0000
Message-Id: <1163519802.5549.27.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: ARM EABI SDK build
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
X-List-Received-Date: Tue, 14 Nov 2006 15:58:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-11-14 at 14:07 +0100, Koen Kooi wrote:
> Most likely his local.conf was:
> 
> BBFILES = "/somepath/*/*.bb"
> 
> DISTRO="angstrom-2007.1"
> MACHINE="qemu-arm"

MACHINE = "qemuarm" ;-)

Richard



