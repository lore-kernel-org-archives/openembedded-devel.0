Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1MxlKB-0001ps-Ab
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Oct 2009 19:38:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id BEAE0503A75D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 15:39:34 -0200 (BRST)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dk11Abn6lVzG
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 15:39:31 -0200 (BRST)
Received: from [192.168.15.104] (bd2124aa.virtua.com.br [189.33.36.170])
	by mail.2mi.com.br (Postfix) with ESMTPA id 340585036A52
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 15:39:31 -0200 (BRST)
Message-ID: <4AD4BAD9.3080609@2mi.com.br>
Date: Tue, 13 Oct 2009 14:37:29 -0300
From: "Jader H. Silva" <jader@2mi.com.br>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: Openembedded Devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: jader@2mi.com.br
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Unable to fetch bootsplash, uri broken?
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
X-List-Received-Date: Tue, 13 Oct 2009 17:38:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all.

I am unable to fetch bootsplash-native.
 From a quick look into BB's URI and bootsplash site, it seems it's URI 
has changed (from 
ftp://ftp.openbios.org/pub/bootsplash/rpm-sources/bootsplash/bootsplash-3.0.7.tar.bz2) 
to 
ftp://ftp.bootsplash.org/pub/bootsplash/rpm-sources/bootsplash/bootsplash-3.0.7.tar.bz2

Even if I changed it's URI in bootsplash_3.0.7.bb and checksums.ini, I 
was still unable to fetch it.
I eventually downloaded the tarball from this page: 
http://www.filewatcher.com/m/bootsplash-3.0.7.tar.bz2.110507.0.0.html

Just want to know if someone else is having the same problem, I tested 
it only in stable/2009.


Att.
Jader H. Silva
Analista de desenvolvimento
2MI Tecnologia


