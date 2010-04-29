Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.oe@pilsoft.com>) id 1O7Q8v-0007w1-6P
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 11:34:50 +0200
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 23B837AF9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 11:31:07 +0200 (CEST)
Received: from smtp3-g21.free.fr (localhost [127.0.0.1])
	by smtp3-g21.free.fr (Postfix) with ESMTP id E11DE81819B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 11:31:04 +0200 (CEST)
Received: from mail.pilsoft.com (mna75-2-82-67-197-228.fbx.proxad.net
	[82.67.197.228])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 05AE781806A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 11:31:01 +0200 (CEST)
Received: from [192.168.33.16] ([192.168.33.1]) BY mail.pilsoft.com
	([192.168.33.30])
	WITH ESMTP (4D WebSTAR V Mail (5.4.1)); Thu, 29 Apr 2010 11:30:59 +0200
Mime-Version: 1.0 (Apple Message framework v1078)
From: David Hemmo <david.oe@pilsoft.com>
In-Reply-To: <h2ub7a795c81004290008z458edaf3wd76e38ed4784cd64@mail.gmail.com>
Date: Thu, 29 Apr 2010 11:31:01 +0200
Message-Id: <B4E2B620-1CC1-4540-B76E-EC69AB2FC2EC@pilsoft.com>
References: <h2ub7a795c81004290008z458edaf3wd76e38ed4784cd64@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 212.27.42.9
X-SA-Exim-Mail-From: david.oe@pilsoft.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Apache2 on angstrom
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
X-List-Received-Date: Thu, 29 Apr 2010 09:34:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello Fabio,

I guess it is related to the kernel you are using or the kernel header =
you included
I don't know in what version of Linux CRYPTD has been added, but it must =
be posterior to the one you are using

David Hemmo

On Apr 29, 2010, at 9:08 AM, Fabio Mauri wrote:

> Hi all,
>=20
>   I am trying to build an image with Apache2 and modphp installed.
> During the compilation I get this error message:
>=20
> http://pastebin.com/uBCr1sYE
>=20
> following the error message there is the related config.log
> Does someone know what is missing in my setup?
>=20
>=20
> --=20
> Fabio Mauri
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



