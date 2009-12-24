Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NNiaL-0003UM-OW
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 08:58:17 +0100
Received: by pwi18 with SMTP id 18so4813233pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 23:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=QrmZIiXBqFJQWawQRSS9uD1dZivu9qyci8yR557z8IA=;
	b=m92xZmb4X1qfA4lggVP6OgtJ07CMSC3dLq0igjgnxR3M2YR4dk1B3ZiKKR6sVLx/Kl
	HxW/vj0FqRhy0qPzMRAebSvri02Z12R2aCrSkOLd3T9Pxdi6GsfEfp5auUERhKhyu8MX
	KhuOG4pj6pYfwuUt03zi9ZuT34UDAdlxC0amg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=mZu2gEktMJkCj/w4BTFjOrSPxskxpZm4DvHdxG83Yzz3eu6vi2UPxjs87gpsbXYD2m
	eL8a/WZnw+VnoCI9NU0hebDe2d5xVykOCGqzcCH8e6lQWmwpGLpT1thx76AhCdTFcnlR
	72a0H9HgVczhIphh537ikxJYm8BoL27Wx47jM=
MIME-Version: 1.0
Received: by 10.115.132.5 with SMTP id j5mr7634468wan.129.1261641379466; Wed, 
	23 Dec 2009 23:56:19 -0800 (PST)
Date: Thu, 24 Dec 2009 13:26:19 +0530
Message-ID: <ad82c8890912232356p7e47a2edk9ca0389467dae654@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: how to convert em-x270.jffs2 to em-x270.img on compulab board
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
X-List-Received-Date: Thu, 24 Dec 2009 07:58:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
     I build x11-image for compulab board .I got  em-x270.jffs2 for compulab
board(EM-X270).
since updater application on compulab board will support em-x270.img
images.so how to convert
em-x270.jffs2 to em-x270.img,so that i can port .img file to nand flash.

with regards
vivek tambakad

