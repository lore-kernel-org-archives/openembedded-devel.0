Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NxDPK-0003gf-9z
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 07:57:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 06E29A2C3C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 07:54:21 +0200 (CEST)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id iud3BTTWLiQm
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 07:54:19 +0200 (CEST)
Received: from tomboy.localnet (pD9E14E18.dip.t-dialin.net [217.225.78.24])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id B2561A2C002
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 07:54:19 +0200 (CEST)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Apr 2010 07:54:18 +0200
User-Agent: KMail/1.12.4 (Linux/2.6.33-1.slh.9-sidux-amd64; KDE/4.3.4; x86_64; ;
	)
References: <t2yd2a86f8e1003312228g46462ac4iac67f8d051aac7b1@mail.gmail.com>
In-Reply-To: <t2yd2a86f8e1003312228g46462ac4iac67f8d051aac7b1@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201004010754.18182.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: how to add wxpython
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
X-List-Received-Date: Thu, 01 Apr 2010 05:57:34 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Donnerstag 01 April 2010 07:28:25 schrieb ttk rpink:
> How can I add wxPython to my distribution?
> I have:
> -----------------
> export IMAGE_INSTALL += " \
>                 hello \
>                 python \
>                 python-pygtk"
> 
> inherit image
> 
> export IMAGE_BASENAME = "mydistro-image"
> ----------------
> 
> 
> Thanks,
> 
> ttk

There is no recipe for wxPython. I tried to make one, because it was requested 
for SHR, but i failed.
I archived my try here: http://trac.shr-project.org/trac/ticket/637#comment:1
I don't know anymore why it failed but it wasn't a trivial thing...
But i don't know what wxPython is and how it works, so perhaps someone with 
some more experience about it is able to package it.

Regards
Thomas


