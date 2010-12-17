Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PTnTB-0002ma-JX
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 04:28:29 +0100
Received: by wwi17 with SMTP id 17so1315713wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 19:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=R2QiLDvHUYzTv/cUbwU0zR1TQcx2XTBTO3CW8Xb1UN4=;
	b=m1jaRt5NVyqcUdzkDu2+cFI/J4OSR0Wfv/g7ojrayhre0ZuTZ1TaXgk6/rN62ED09c
	Wt8pNWzytLs7MzTQ7w/tot7899OqWHY2l+ccEGU/HV/egcbqNAjz6J2YNOx6Rj7jYQGy
	QQVUExSDcU15226Tu/8L7mbRaWMJPu/JBdlSE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ieAo1V9oMW4VfYp3fAyYyUQdBptB4GxiVf73coLiN9PK6FPIP/1O8aG7yoLynwi6l0
	brRv24gag7TR9EtofiN40PHfYlWb+hBNrDhDMu3lAO68tNRKaUBqZE0hA6mU/yqfpgcu
	huYTgqN80LGwhwTxlyXX45mc0dtwN+8vsIo/4=
MIME-Version: 1.0
Received: by 10.216.142.101 with SMTP id h79mr1137922wej.49.1292594186865;
	Fri, 17 Dec 2010 05:56:26 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Fri, 17 Dec 2010 05:56:26 -0800 (PST)
Date: Fri, 17 Dec 2010 08:56:26 -0500
Message-ID: <AANLkTikPkD=e6O=cXQA5b5LYd6kapdgtjx=UG_pSweGn@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: testing branch 2010-12-17
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
X-List-Received-Date: Sat, 18 Dec 2010 03:28:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Master has been merged to testing-next and is ready for clean builds.

Last week there were quite a few issues, but a few builds did come through:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2010-12-10

Thanks to all who ran tests.  For more information on contributing to
our testing effort, see:

http://wiki.openembedded.org/index.php/Testing

Thanks,
Cliff

-- 
=================
http://bec-systems.com


