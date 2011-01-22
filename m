Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pghrx-000177-JC
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 19:07:25 +0100
Received: by bwz10 with SMTP id 10so2672367bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 10:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=IzsY8+Ce+tI/4SpOs6SDGiZTHGrawDVDVxtM2+CGPDo=;
	b=bskOwDfohuv8/wWGP5KcVxm9gC/WWVe+JvAqiALIZD40SmdTiUnQtW/gWoXfjEpXG+
	bAYLLYs3P7Zv6etj/zPE6Dmhu6iNQ+vIEe4FdXP0k/6nbfsojXCzFu0rc6/h9JL0gT9N
	c8QnGul4+eJJmYHBuQrc/GxLG2EQMt78rdegE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=E69FlbXDGPhqE6WG1k0io0W2I6U5whaq0nd2ib/m5ny6VyvKfJEC7/8ub6SPwD8pUW
	kxB31fUb89ys/gYHtD8yWwQXDU2u+pkDPtXw07qy+pcj1ABGzM4h81QhlsHIXcflTgk5
	oSlapr1wLQtqkK08Dz0pJacQmgse3SUMxX6lc=
MIME-Version: 1.0
Received: by 10.204.68.69 with SMTP id u5mr1930669bki.99.1295719600937; Sat,
	22 Jan 2011 10:06:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Sat, 22 Jan 2011 10:06:40 -0800 (PST)
Date: Sat, 22 Jan 2011 16:06:40 -0200
X-Google-Sender-Auth: EC1jJVn-hdr-rnzAmKDI37z4WB4
Message-ID: <AANLkTinz+p5J6K+XhohJJ=q7dD3X1kVGZDNA-4qOOH2W@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Recipes with fetch failures:
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
X-List-Received-Date: Sat, 22 Jan 2011 18:07:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I have started a build with an empty download dir and found some failures:

Those are not fetchable:

   ftp://invisible-island.net/ncurses/5.7/ncurses-5.7-20100501.patch.gz
   cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs;module=3Dipkg-utils

This does seems critical to us since it makes a hard time for anyone
trying to get something done with OE and has no background how to
workaround those. It seems that those need fixes.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


