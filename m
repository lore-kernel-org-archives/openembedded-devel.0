Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sasankmadabushi@gmail.com>) id 1NzfQR-0005DU-K6
	for Openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 02:16:52 +0200
Received: by vws3 with SMTP id 3so589951vws.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 17:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=rA5eDiNfy6/cF21j9gpDvvjBc9x1gN7xLhDnwAANvEA=;
	b=RYXzQ9jhHdGZz58eu38J7z7eKAQg77b49ybVyNBf008UJN5ec0wEXVZfpG8LBLzEC1
	ejatXp0XvRr5Bchhg0pjgVsHTrFm/kJQ7VxWzPNOIzmmdZfWoxrNTTNibbCNcZLIO30U
	CRPe2EkvV4AArCXiwYxQpwCf9FK77dqjV88KM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=CovAWEXgGD7ScGmQMU+8fTRJda3m4RSXZ5ppQ+dQHpdd67lg29o47ASx/f85BrxRKU
	jtQRAJ4myNo+gsnIcpSLf7bfVczyNIqltaRtU0ETM9qgmCtDHscK9xVNX8CrItXtXQ3G
	/56DwYTuGRfdG5B1McQTgkN8WA0P71ToSL3I0=
MIME-Version: 1.0
Received: by 10.220.101.139 with HTTP; Wed, 7 Apr 2010 17:13:28 -0700 (PDT)
Date: Wed, 7 Apr 2010 19:13:28 -0500
Received: by 10.220.107.142 with SMTP id b14mr4791466vcp.150.1270685608572; 
	Wed, 07 Apr 2010 17:13:28 -0700 (PDT)
Message-ID: <r2n1d7462881004071713vfa2a05b4yc4ce27954684bde9@mail.gmail.com>
From: maadbushi sasank <sasankmadabushi@gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: sasankmadabushi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	MIME_BASE64_TEXT,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Help with installing cross compiler in beagle board
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
X-List-Received-Date: Thu, 08 Apr 2010 00:16:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

     I am a novice in oe.I want to know how to install gcc cross compiler in
open embedded.
I want to compile some basic programs for arm cortex-A8.Can any body please
help me with this.


Sas

