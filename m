Received: from [212.27.42.27] (helo=smtp1-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <alain2210@free.fr>) id 1GIW3z-0001AK-7p
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Aug 2006 21:49:27 +0200
Received: from imp5-g19.free.fr (imp5-g19.free.fr [212.27.42.5])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 354AB9AD75;
	Wed, 30 Aug 2006 21:47:16 +0200 (CEST)
Received: by imp5-g19.free.fr (Postfix, from userid 33)
	id 283DB10358; Wed, 30 Aug 2006 21:47:16 +0200 (CEST)
Received: from AMontsouris-153-1-19-224.w86-212.abo.wanadoo.fr
	(AMontsouris-153-1-19-224.w86-212.abo.wanadoo.fr [86.212.18.224]) 
	by imp5-g19.free.fr (IMP) with HTTP 
	for <alain2210@127.0.0.1>; Wed, 30 Aug 2006 21:47:16 +0200
Message-ID: <1156967236.44f5eb4411b36@imp5-g19.free.fr>
Date: Wed, 30 Aug 2006 21:47:16 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.5
X-Originating-IP: 86.212.18.224
Subject: gd package and cross compile badness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Aug 2006 19:49:27 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to compile tetex with org.openembedded.dev but it needs to com=
pile gd
(gd_2.0.33) but it does not work. It seems to be a problem in configure. =
In the
config.log
I can see
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
cc1: internal compiler error: Aborted

I have not well understood the message on http://www.openembedded.org/
about this. So I'm writing to this list.

Thanks,

Alain


