Received: from [145.253.133.146] (helo=miraculix.pixel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <poessinger@mixed-mode.de>) id 1L1zp2-0005Xw-P0
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 09:51:04 +0100
Received: from encryptix.pixel.de ([145.253.132.115])
	by miraculix.pixel.de with smtp (Exim 4.50) id 1L1zml-0005Lq-Uz
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 09:48:43 +0100
Received: from encryptix.pixel.de (localhost [127.0.0.1])
	by encryptix.pixel.de (Postfix) with ESMTP id D5DD38782A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2008 09:48:13 +0100 (CET)
Received: from verleihnix.pixel.de (verleihnix.pixel.de [145.253.132.195])
	by encryptix.pixel.de (Postfix) with ESMTP id AEE6687829
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2008 09:48:13 +0100 (CET)
Received: from verleihnix (verleihnix.pixel.de [145.253.132.195])
	by verleihnix.pixel.de (Postfix) with ESMTP id 68CF480146
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2008 09:48:13 +0100 (CET)
Received: from automatix.pixel.de (145.253.132.220)
	by verleihnix (F-Secure/fsigk_smtp/549/verleihnix);
	Mon, 17 Nov 2008 09:48:13 +0100 (CET)
X-Virus-Status: clean(F-Secure/fsigk_smtp/549/verleihnix)
Received: from 80.246.32.33 (SquirrelMail authenticated user cpo)
	by intern.netexpress.de with HTTP;
	Mon, 17 Nov 2008 09:48:13 +0100 (CET)
Message-ID: <30675.80.246.32.33.1226911693.squirrel@intern.netexpress.de>
In-Reply-To: <87od0jxto9.fsf@neumann.lab.ossystems.com.br>
References: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>
	<491C1379.2090404@gmx.de> <87hc6b4njt.fsf@neumann.lab.ossystems.com.br>
	<491C7E1A.2020308@gmx.de>
	<87od0jxto9.fsf@neumann.lab.ossystems.com.br>
Date: Mon, 17 Nov 2008 09:48:13 +0100 (CET)
From: Christian =?iso-8859-1?Q?P=F6ssinger?= <poessinger@mixed-mode.de>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.4
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-TBoneOriginalFrom: Christian =?iso-8859-1?Q?P=F6ssinger?=
	<poessinger@mixed-mode.de>
X-TBoneOriginalTo: openembedded-devel@lists.openembedded.org
X-TBoneDomainSigned: false
X-SA-Do-Not-Run: Yes
X-SA-Exim-Scanned: No (on miraculix.pixel.de); SAEximRunCond expanded to false
Subject: Re: Issues with the system startup when the IMAGE_TYPE is	squashfs
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
X-List-Received-Date: Mon, 17 Nov 2008 08:51:04 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Do, 13.11.2008, 21:22, Otavio Salvador wrote:
> This is a behaviour change and before making it a requirement it needs
> to be tested.
>
> Personally I also see no reason for it to break images but it is
> always better be safe then sorry.

I tested the patch and it worked quiet well for me on the stable tree.
Seeing this build into OpenEmbedded would be great.


Best regards,
Christian




