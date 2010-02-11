Received: from mail-yx0-f178.google.com ([209.85.210.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nfe2Q-0008Cc-4B
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 19:45:21 +0100
Received: by yxe8 with SMTP id 8so1517133yxe.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 10:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=kSjk6ZREY2auvEBr7ETatjJQVBRv4EH1lXBb9Djln+o=;
	b=f383dOmf2Kzwp8I00VlO9TERD5Fjv3XbEe+dcqxcopl7jWNScpux6yb3lGtbcH3dAg
	m9i6LU1olkLeqYy1nP7y7qrL2R8kynVfWflm2lXpAzBjTPHn4kbFbAzrFb8zVwJYywMV
	YWa/UPHRfQyTONlCoEPQuXqiRi6nXrw7TQEik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=djBD3jWUlQl8sSNYgAJZC5VMbX5waJ4jhjwdtDP8GtjiGsbYCi09rgPS+41eCNzRRQ
	+PEU5R2ABtiNKteCrnAH0nl7TysLTZfr5N/lW2lX4bEFLfSU5RYYQaMiMqS3oWvZ5D8L
	DTrBU+NQninrFY3Hatm13m7za2aRMmIHz+rIo=
MIME-Version: 1.0
Received: by 10.101.195.38 with SMTP id x38mr423349anp.135.1265913762755; Thu, 
	11 Feb 2010 10:42:42 -0800 (PST)
Date: Thu, 11 Feb 2010 19:42:42 +0100
Message-ID: <ac9c93b11002111042j540f846y40cc8cfa83518a1f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: xfce46-image: missing packages
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
X-List-Received-Date: Thu, 11 Feb 2010 18:45:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

I tired building xfce46-image (for eee701, but I doubt if that makes a
differeence).
However somehow the resulting rootfs is incomplete.
It does not contain xinit.
Also I have Xvesa but no X and no symlink to X.
Guess something is missing but no idea what exactly.
Anyone an idea what the best way to fix is and where to add it?

Thanks, Frans


