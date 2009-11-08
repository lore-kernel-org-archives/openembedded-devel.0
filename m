Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N7GEB-0002uF-Kw for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 23:27:22 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 1908487
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Nov 2009 22:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Bt0rjFaxT1iT
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Nov 2009 23:26:02 +0100 (CET)
Received: from [192.168.0.100] (103-208.echostar.pl [213.156.103.208])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id BDB5782
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Nov 2009 23:26:02 +0100 (CET)
Message-ID: <4AF7457A.9090702@cs.put.poznan.pl>
Date: Sun, 08 Nov 2009 23:26:02 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>	<hd4qpq$ee0$1@ger.gmane.org>
	<1257682982.26962.14.camel@opal>	<hd6ggj$tf3$1@ger.gmane.org>	<ac9c93b10911080608y6db44dache5b521eb64fafe2d@mail.gmail.com>	<be7a9f3d0911080655o4eff671cnaf59a134e7a97ac5@mail.gmail.com>	<hd6opq$ke8$1@ger.gmane.org>
	<6ec4247d0911081331h5bc3d7bcg881ab92d4b4c2136@mail.gmail.com>
In-Reply-To: <6ec4247d0911081331h5bc3d7bcg881ab92d4b4c2136@mail.gmail.com>
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sun, 08 Nov 2009 22:27:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> I'm with you on this one, Koen. Changing a versioned tarball is just
> dumb - it goes against common sense and long standing convention in
> release engineering.
> 
> As for choosing the 3.32 version, who's to say they won't add a bugfix
> and update that tarball too?

Beacuse that's not the way the whole CPAN (Perl's packages repository)
works. Version 3.32 is there, version 3.33 is not.

Przemek



