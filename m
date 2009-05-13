Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M4K2j-0004KA-7E
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 21:23:05 +0200
Received: by yw-out-1718.google.com with SMTP id 9so469963ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 12:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=jKPKeUm3z5/bne/qLJoqvTlwTpBeCCMC0K2xpBJUbTA=;
	b=aEIC+Xy7ZJ8YjZAc+YOOfefA+zLPR1zDddzOy4DJmWQJHXLIMbOtAD7adDZ4M5vSU2
	qSsjMtU/+GwrFMa+MzDRRIeQH1GIp2pVGD2WCD3CRxsSP83o8fh9B/qMwhjWbJWKgqNX
	2mFyL5TXUlZVeCocVpK1SPUDnrlnhdMpzvM6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Fz//ri0EsKvcokLwaOom54K8DZoMQLLgAL4hzk5UmTXbB6oeVGZhiK6ftMitypFmys
	YbFzOQOt20twiGiwvyXP9y5NTN7ZJ7VSROcCJ+wOIrwpPpE6cGaDTPlTaKbulDrBuZ/k
	j6ymh6qzMnXtxBJMpK5ApU1ec1cfoxreDsQA0=
MIME-Version: 1.0
Received: by 10.150.225.5 with SMTP id x5mr1709680ybg.321.1242242179253; Wed, 
	13 May 2009 12:16:19 -0700 (PDT)
Date: Wed, 13 May 2009 15:16:19 -0400
Message-ID: <f96d234e0905131216o2111c9d8medac9b4450d5aaa@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE git move to OSUOSL
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
X-List-Received-Date: Wed, 13 May 2009 19:23:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

The oe git infrastructure is set up at OSUOSL, so I propose we move
git.oe.org, and cgit.oe.org this Fri @ 3PM.  I've cordinated the DNS
changes with Philip Balister.  You can test at:

http://new.openembedded.org/cgit/

and git URI's

git://new.openembedded.org/openembedded
git@new.openembedded.org/openembedded

Feel free to push changes or whatever to test, as I plan to re-rsync
the git repository from the current server right before the
switchover.  The OE git server may be unavailable for a couple hours
during the switchover, and DNS propagation.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


