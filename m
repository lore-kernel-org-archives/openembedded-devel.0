Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MARym-0001j7-0S
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 19:04:20 +0200
Received: by bwz19 with SMTP id 19so6672125bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=EbMDiLW5zDt6ekpOzQ45SNMjg47nJUeSxtA2A/ayNhI=;
	b=GqY3dL+TfUVs++0mf7HpRcKjfxTVBSnVT4RNRlK7qKcvlu0jaKZk3Y68plpioKHGrU
	78I2w3oUPcPSkn8SyCDNJxJuLpCIsYbFtfFx0FgZOgLhqok8Xk24b2BJfzserxZosf1P
	pyK7SBx1Wx1zA4ciYNBL/pN+IaxfsH9MVBELY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=wxsdbo++rezlOTFlPV0ErBbQ3wGiJZdHiFhTRWRPh0sW/+IFC4dfxSQ2ZQ0DKWrEtn
	7AgtKpWySyYcewHaRvmZrNkSCK8PoaKoU/E9K8rWilsepsnxfp5Gj5UfSm5/Rz+lX/OB
	VmJ6D4Yl/eObfsqPkbaH1AL6t0NEXvTsaqqHo=
MIME-Version: 1.0
Received: by 10.103.175.8 with SMTP id c8mr2255975mup.117.1243702545396; Sat, 
	30 May 2009 09:55:45 -0700 (PDT)
Date: Sat, 30 May 2009 19:55:45 +0300
Message-ID: <fce2a370905300955v7ccc4cauebe5468b74b62e4b@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Pull request for new qt4 toolchain (and other mostly qt4 fixes)
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
X-List-Received-Date: Sat, 30 May 2009 17:04:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello!

Please pull qt4 toolchain support from the following repository:
git://github.com/booxter/oedev.git
If you want me to send patches to the ML please tell me then.

Thanks.


