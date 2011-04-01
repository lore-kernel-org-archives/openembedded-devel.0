Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q5f2z-0005oP-IH
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 16:10:13 +0200
Received: by wye20 with SMTP id 20so3252481wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 07:07:56 -0700 (PDT)
Received: by 10.216.65.8 with SMTP id e8mr898102wed.35.1301666876271;
	Fri, 01 Apr 2011 07:07:56 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	e13sm1292652wbi.23.2011.04.01.07.07.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 07:07:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>
Date: Fri, 1 Apr 2011 16:07:53 +0200
Message-Id: <CC5D751E-FF84-40C2-B184-4C813C49F5E4@dominion.thruhere.net>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
	<1301660208-31105-3-git-send-email-otavio@ossystems.com.br>
	<in4lhs$326$1@dough.gmane.org>
	<AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Fri, 01 Apr 2011 14:10:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 apr 2011, om 16:06 heeft Otavio Salvador het volgende geschreven:

> On Fri, Apr 1, 2011 at 10:56, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> On 01-04-11 14:16, Otavio Salvador wrote:
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>=20
>>> +     find ${D}/${libdir} -name '*.la' -exec rm '{}' ';'
>>=20
>> Why is that needed?
>=20
> To avoid .la files on the package.

I guessed that much, but why don't you want .la files in the -dev =
package? Your commit message doesn't give any clue about it or anything =
else.



