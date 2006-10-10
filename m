Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <dp@xora.org.uk>) id 1GXJnp-0007MM-6f
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Oct 2006 17:45:57 +0200
Received: from xora.org.uk ([::ffff:85.210.161.143])
	(AUTH: LOGIN dp, TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 10 Oct 2006 16:39:36 +0100
	id 000041DE.452BBEB8.0000552A
Date: Tue, 10 Oct 2006 16:39:18 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20061010153918.GD2541@stygia.hyboria>
References: <45296EB8.7070704@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <45296EB8.7070704@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.11
Subject: Re: [RFC] Removing MAINTAINER field from recipes
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
X-List-Received-Date: Tue, 10 Oct 2006 15:45:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

A suggestion as to a possible format for MAINTAINERS file.

I tried to be machine parsable and human parsable.

DEVELOPER {
NAME="Koen Kooi"
NICK="koen"
EMAIL="Koen Kooi <koen@openembedded.org>
MACHINE="h2200 ipaq-pxa270"
DISTRO="angstrom.*"
RECPIPES="gnome/.* gnumeric/.*"
}

DEVELOPER {
NAME="Graeme Gregory"
NICK="XorA"
EMAIL="Graeme Gregory <dp@xora.org.uk>"
RECIPES="kismet/.* sylpheed/.*"
INTERESTS="Multimedia playback on console and x11"
}


Cheers

G



