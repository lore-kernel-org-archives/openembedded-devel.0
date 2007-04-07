Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HaHxx-0000za-3u
	for openembedded-devel@openembedded.org; Sat, 07 Apr 2007 22:56:57 +0200
Received: from dominion.dominion.void (dominion.kabel.utwente.nl
	[130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l37KusLr021057 for <openembedded-devel@openembedded.org>;
	Sat, 7 Apr 2007 22:56:54 +0200
Received: from www-data by dominion.dominion.void with local (Exim 4.60)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HaHxx-0007E3-9A
	for openembedded-devel@openembedded.org; Sat, 07 Apr 2007 22:56:57 +0200
Received: from ip5451781a.direct-adsl.nl (ip5451781a.direct-adsl.nl
	[84.81.120.26]) by dominion.kabel.utwente.nl (IMP) with HTTP 
	for <koen@localhost>; Sat, 07 Apr 2007 22:56:57 +0200
Message-ID: <1175979417.461805993a8c7@dominion.kabel.utwente.nl>
Date: Sat, 07 Apr 2007 22:56:57 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
References: <E1HaHcl-0005E1-0o@linuxtogo.org>
	<1175978493.461801fd46a36@dominion.kabel.utwente.nl>
In-Reply-To: <1175978493.461801fd46a36@dominion.kabel.utwente.nl>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.6
X-Originating-IP: 84.81.120.26
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev libxml2 2.6.26: Added libiconv	dependency
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
X-List-Received-Date: Sat, 07 Apr 2007 20:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Quoting Koen Kooi <k.kooi@student.utwente.nl>:

> svolpe commit schreef:
> > libxml2 2.6.26: Added libiconv dependency
>
> > +DEPENDS = "libiconv"
>
> Are you sure? It would on i686, armv4t, armv5te and ppc603e with the glibc
> provided one,
> so I think that should be virtual/libiconv.

s/would/works/

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


