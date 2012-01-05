Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gruending.net>) id 1Rib3t-0004xW-71
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 01:20:05 +0100
Received: by iakh37 with SMTP id h37so29474090iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 16:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gruending.net; s=google;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=KKU3fep4/xUUDRiS4v5FJXJwSoT4j2yEgZRatWO3HOk=;
	b=kASjwnPXRzsK1KZLCd8/t8PK5R103aLBgqHs+z0XLH+9xLh1wPutwyCIY79WaTKfCO
	g70lxBYo4z4OkjmDdWT+ldypPGCG5pDVdV2BmH7Ctiw2AH04Pwm4SptJehbgflSmPZAn
	7QcG/vzPIBOVvqB7feX4qq+C/+IZBYN6FFmQM=
MIME-Version: 1.0
Received: by 10.43.58.10 with SMTP id wi10mr59110498icb.57.1325722362362; Wed,
	04 Jan 2012 16:12:42 -0800 (PST)
Received: by 10.231.207.158 with HTTP; Wed, 4 Jan 2012 16:12:42 -0800 (PST)
Date: Wed, 4 Jan 2012 16:12:42 -0800
Message-ID: <CACj0d1irS71X99mBn+od5fbFoO_JhTWiuB5EAAcUc63KXjPk7w@mail.gmail.com>
From: Neil Gruending <neil@gruending.net>
To: openembedded-devel@lists.openembedded.org
Subject: Can't download linux-davinci
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
X-List-Received-Date: Thu, 05 Jan 2012 00:20:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is there another source for
linux-davinci_2.6.31+2.6.32-rc2-psp03.01.00.37 besides
http://www.angstrom-distribution.org/unstable/sources/git_arago-project.org.git.projects.linux-davinci.git_DEV.DaVinciPSP.03.XX.00.37.tar.gz?
I've been trying to download it now for almost 24 hours now with no
success. I get a download rate of about 2KB/s and then at around 20%
complete bitbake times out. I'm trying compile openembedded
2011.03-maintenance for a dm365-evm.

Thanks,
Neil


