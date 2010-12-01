Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1PNlUc-0008RH-9R
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 13:09:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id EA6FAA56D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Dec 2010 12:07:41 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id FrfRTzMAcLMr
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Dec 2010 12:07:41 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 5DFCFA56C9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Dec 2010 12:07:41 +0000 (GMT)
Message-ID: <4CF63A8C.1040502@xora.org.uk>
Date: Wed, 01 Dec 2010 12:07:40 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>	<ico56o$f8$2@dough.gmane.org>	<20101127140200.GH10755@ibawizard.net>	<AANLkTi=kAyxY9i+_c-6UoeEp6ZjUf91m3z3UE272ibVu@mail.gmail.com>	<AANLkTinrTnrTXsLVFFxpnUWt1ivwn_V2xS=V8dsej97u@mail.gmail.com>	<4CF6346B.2060407@opensimpad.org>
	<20101201115806.GQ10755@ibawizard.net>
In-Reply-To: <20101201115806.GQ10755@ibawizard.net>
X-Enigmail-Version: 1.1.1
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3	which	unbreaks x264
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
X-List-Received-Date: Wed, 01 Dec 2010 12:09:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/12/2010 11:58, Petr =8Atetiar wrote:
> Bernhard Guillon <Bernhard.Guillon@opensimpad.org> [2010-12-01 12:41:31=
]:
>
>> This is true. We could add some python foo and check for angstrom? In =
my =20
>> opinion the log2f patch is of no real harm. The tls support might be a=
 =20
>> problem.
> Why to not move to some newer version of uClibc directly, without that =
patch
> at all?
>
because Angstrom 2008.1 is an already released distro. We don't like
switching toolchains at last minute.

Graeme



