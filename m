Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PjFZG-0007hp-Nq
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 19:30:38 +0100
Received: by iyj18 with SMTP id 18so3777306iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 10:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=+CcktYpdcLhwAOKibvqVUEvVsdogHYKfvCRy90EtLc4=;
	b=fwbny/vrEjZifhiUf0519advrOZUgGEAhhOMIA8Sc5dRIP633/SAy9cNozoFwb9Ypa
	P8LW0NqCGeBhom0mcRg4z9Zh1yPujajxRc+CamL2BAy+VSGAboH5mcDWcHA5UJODM0vV
	gLFzk3Z3ctg0NHvwVARJiiub1GnZ9VQa+60PM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=BGpJW9BC4ZtEfFyIWqsXVgklIzC/WeYGH2YNjnYiaiYS/ujCzHMZNrvpMgZ/L/kJ2r
	iYTAu1U04bJsd801+wrMjiKrGE2+OwvuEpYm37rBaXY6V/lKSqzaEEpbdYf2NImh0y1v
	CmgRxIpKyoU6k7dEATvSR1t/fJEkK8QJhsMIk=
MIME-Version: 1.0
Received: by 10.231.166.205 with SMTP id n13mr4374048iby.58.1296325785990;
	Sat, 29 Jan 2011 10:29:45 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Sat, 29 Jan 2011 10:29:45 -0800 (PST)
Date: Sat, 29 Jan 2011 19:29:45 +0100
Message-ID: <AANLkTinwMf=NiwBWiK-j7u6yUkHGoPSoahU4hfYCWJjz@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: QT QA error
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
X-List-Received-Date: Sat, 29 Jan 2011 18:30:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

0: qt4-x11-free-4.7.1-r23.0 do_package (pid 31074)
ERROR: QA Issue with qt4-tools: Architecture did not match (40 to 3)
on /work/armv5te-oe-linux-gnueabi/qt4-x11-free-4.7.1-r23.0/packages-split/qt4-tools/usr/bin/rcc
ERROR: QA Issue with qt4-tools: Architecture did not match (40 to 3)
on /work/armv5te-oe-linux-gnueabi/qt4-x11-free-4.7.1-r23.0/packages-split/qt4-tools/usr/bin/moc
ERROR: QA Issue with qt4-tools: Architecture did not match (40 to 3)
on /work/armv5te-oe-linux-gnueabi/qt4-x11-free-4.7.1-r23.0/packages-split/qt4-tools/usr/bin/uic

No idea why this happens. distro minimal, target sheevaplug

Frans


