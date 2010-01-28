Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Nacsc-0000RF-Pg
	for openembedded-devel@openembedded.org; Thu, 28 Jan 2010 23:30:29 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 950FE1D3607A; Thu, 28 Jan 2010 23:28:00 +0100 (CET)
Date: Thu, 28 Jan 2010 23:28:00 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100128222800.GF24852@ibawizard.net>
References: <1264711964-25127-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
In-Reply-To: <1264711964-25127-1-git-send-email-ynezz@true.cz>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] ecore-svn: fix NULL pointer dereference
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
X-List-Received-Date: Thu, 28 Jan 2010 22:30:29 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Petr =A9tetiar <ynezz@true.cz> [2010-01-28 21:52:44]:

> This patch fixes NULL pointer dereference in exquisite triggered 5 time=
s
> during each boot and causes flood of this annoying messages:

Ok, got in touch with developers, so it's fixed upstream[1]. Sorry for th=
e
noise.

-- ynezz

1. http://trac.enlightenment.org/e/changeset/45673


