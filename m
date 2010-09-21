Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oy4f3-0000jX-C4
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 17:21:40 +0200
Received: by wyb34 with SMTP id 34so3900470wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Td/th8k3XY7v/XAoI7uOLoW8cqESkLDMe3OgU1N2LmU=;
	b=btsOu5qSEcKmS3gCIkOyoQN8JcfIoaeCX92cQ9T4vqdsZ0iyUT2KqwKsRl1xFDDUKU
	bpl7X0Z3XIBkVkDZHwqoRIuA8FC5vUVIUe78rk0XEWF5BRVO59DwCi8LMVvLvccjVgEa
	6uEvLXh7OXzIut9fFYK81rCK8aFmzGgaefDqk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=QFEw4YIIrsU+SfFHHlkA6Ya3QKR5NbCH1SSCgrDQ6X0XoU5RuWCUdypsj0BzFYKk0u
	FAaZ4dwdUT4QGi7zOOsb0Ok5sriPJBYAAw/Ap39nww/WCVqRIAbyOAX/ML+bfSMdKTwl
	Zdf0Gl+a66Q4VM7zz1q/ia5+k5D/45Mol4PbU=
MIME-Version: 1.0
Received: by 10.216.185.72 with SMTP id t50mr9307919wem.77.1285082493320; Tue,
	21 Sep 2010 08:21:33 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Tue, 21 Sep 2010 08:21:32 -0700 (PDT)
Date: Tue, 21 Sep 2010 11:21:32 -0400
Message-ID: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: anyone working on recipes for qt 4.7.0 released?
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
X-List-Received-Date: Tue, 21 Sep 2010 15:21:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Qt 4.7.0 is now released:

http://labs.qt.nokia.com/2010/09/21/qt-4-7-0-now-available/

Is anyone working on recipes for this yet?  I've been trying to get
4.7.0-beta2 to build, so wondering if anyone has tried 4.7.0 released
yet.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


