Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GhCS0-0006J0-5R
	for openembedded-devel@openembedded.org; Mon, 06 Nov 2006 22:56:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kA6Lsqe2006985
	for <openembedded-devel@openembedded.org>; Mon, 6 Nov 2006 21:54:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25678-07 for <openembedded-devel@openembedded.org>;
	Mon,  6 Nov 2006 21:54:49 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kA6Lskjc006926
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 6 Nov 2006 21:54:46 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <454EEA21.7050108@dominion.kabel.utwente.nl>
References: <454EEA21.7050108@dominion.kabel.utwente.nl>
Date: Mon, 06 Nov 2006 21:54:48 +0000
Message-Id: <1162850089.5544.18.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	kA6Lsqe2006985
Subject: Re: [RFC] New MACHINE_FEATURE: 'screen'
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
X-List-Received-Date: Mon, 06 Nov 2006 21:56:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-11-06 at 08:54 +0100, Koen Kooi wrote:
> I was building an =C5ngstr=F6m bootstrap image for my loft[1] and notic=
ed it was building
> psplash. Since the loft lacks support for graphical output (except usb-=
vga adaptors), it
> would be nice to leave out stuff like bootsplashes. What do you think a=
bout adding
> 'screen' to MACHINE_FEATURES?

I think you've illustrated the need :)

Cheers,

Richard



