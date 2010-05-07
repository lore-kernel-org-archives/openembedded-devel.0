Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OAI13-0003ti-Fl
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 09:31:11 +0200
Received: by bwz20 with SMTP id 20so403438bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ma+Dt3wSqa4UyvypJwZnHf8hc9raJ8Nt2V658behH+c=;
	b=UeKLG+RdRhmHfif/DJIpiIyu12smeIlP5EpWId3Dh/qLK9QD0PSu2UOw28VAo8XBcR
	gY4W0GDg1o1AHAfgtlJoqRluah8bDYoYSRRw+gjqtKKwLi0mutk3i3MYdtQHESHmKPjr
	IaRZFtofNsOu2B16IIOSpWg8GRTuB0HdjmcNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dHaNUZmUBZAR9FB1wTyMEI0hdPIJ3TAMRQITxu53MndhKLH4IlHZ4Yqb6TE8GdjgUY
	Cucg1qqRvrgXSHj6kYbF5RAzHTFWwalKJOT1ocjIelI8WadGHHHhyuf8yyFybHQOpCqz
	xnni9ub0+CLbNWtCDyHroaiF9gp24mRIATZZk=
MIME-Version: 1.0
Received: by 10.204.7.201 with SMTP id e9mr6284594bke.122.1273217204132; Fri, 
	07 May 2010 00:26:44 -0700 (PDT)
Received: by 10.204.76.76 with HTTP; Fri, 7 May 2010 00:26:44 -0700 (PDT)
In-Reply-To: <hrudq5$vms$1@dough.gmane.org>
References: <1273102999.5743.49.camel@rex> <hrtn8s$e9m$1@dough.gmane.org>
	<hrtpja$lag$1@dough.gmane.org> <1273147827.5743.104.camel@rex>
	<hrudq5$vms$1@dough.gmane.org>
Date: Fri, 7 May 2010 09:26:44 +0200
Message-ID: <p2ofca63bcf1005070026t2e5df9feo7775976b0c44d34d@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Fri, 07 May 2010 07:33:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

FYI: Console-/minimal/base-Image built fine for IGEPv2 board (build
from scratch)

Packaged-staging: Destination of packages is now defined by PSTAGE_DIR.

Regards,
Michael


